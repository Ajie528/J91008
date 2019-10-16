package com.fh.controller.fish;

import com.fh.controller.base.BaseController;
import com.fh.entity.User;
import com.fh.service.fish.*;
import com.fh.util.Const;
import com.fh.util.Jurisdiction;
import com.fh.util.PageData;
import com.fh.util.Tools;
import com.fh.util.express.ThreadManagers;
import org.apache.shiro.session.Session;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.annotation.Resource;
import java.lang.reflect.Parameter;
import java.util.Date;



/**
 * 说明：总入口
 * 创建人：Ajie
 * 创建时间：2019-10-14 16:00:19
 */
@Controller
@RequestMapping(value = "/fish")
public class MainController extends BaseController {

    // 奖金记录
    @Resource(name = "bonus_recService")
    private Bonus_recManager bonus_recService;
    // 喂养记录
    @Resource(name = "feed_recordService")
    private Feed_recordManager feed_recordService;
    // 用户管理
    @Resource(name = "j91008_userService")
    private J91008_userManager j91008_userService;
    // 公告管理
    @Resource(name = "notice_recService")
    private Notice_recManager notice_recService;
    // 轮播图管理
    @Resource(name = "rotation_chartService")
    private Rotation_chartManager rotation_chartService;
    // 提现管理
    @Resource(name = "withdraw_cashService")
    private Withdraw_cashManager withdraw_cashService;
    // 充值管理
    @Resource(name = "recharge_cashService")
    private Recharge_cashManager recharge_cashService;


    /**
     * @描述：清空系统数据，保留顶点账号和参数
     * @返回值：成功信息
     * @创建人：Ajie
     * @创建时间：2019/10/15 0015
     */
    @RequestMapping(value = "/resetSystem")
    @ResponseBody
    private String resetSystem() throws Exception {
        logger.info("-------------清空系统数据");
        PageData pd = new PageData();
        // 调用多线程执行清表操作
        ThreadManagers.getThreadPollProxy().execute(new Runnable() {
            @Override
            public void run() {
                try {
                    j91008_userService.wipeData(pd);
                    notice_recService.wipeData(pd);
                    rotation_chartService.wipeDate(pd);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        });
        // 重置序列
        pd.put("seqName", "J9_USERID_SEQ");
        pd.put("seqStart", "10001");
        j91008_userService.reset_seq(pd);
        pd.put("seqName", "J9_BONUS_SEQ");
        pd.put("seqStart", "1");
        j91008_userService.reset_seq(pd);
        pd.put("seqName", "J9_FEED_SEQ");
        pd.put("seqStart", "1");
        j91008_userService.reset_seq(pd);
        return "success";
    }

    /**
     * @描述：用户注册验证是否能注册
     * @参数：页面传过来的信息
     * @返回值：是否能注册
     * @创建人：Ajie
     * @创建时间：2019/10/16 0016
     */
    @RequestMapping(value = "/register")
    @ResponseBody
    protected String register(@RequestParam("USER") String userInfo[]) throws Exception {
        PageData pd = new PageData();
        PageData pd1;
        PageData pd2;
        // 参数验证
        if (userInfo.length != 4) {
            return "parLack";
        }
        // 手机号、密码、确认密码、推荐人
        String phone = userInfo[0];
        String password = Tools.encrypt(userInfo[1]);
        String confirm = Tools.encrypt(userInfo[2]);
        String recommender = userInfo[3];
        // 手机号格式验证
        if (!Tools.checkMobileNumber(phone)) {
            return "phoneError";
        }
        // 验证手机号是否已经注册
        pd.put("PHONE",phone);
        pd2 = j91008_userService.findByPhone(pd);
        if (!"".equals(pd2) || pd2 != null){
            return "alreadyExist";
        }
        // 加密后的密码和确认密码验证
        if (!password.equals(confirm)) {
            return "passwordError";
        }
        // 验证推荐人是否存在
        pd.put("J91008_USER_ID", recommender);
        pd1 = j91008_userService.findById(pd);
        if ("".equals(pd1) || pd1 == null) {
            return "recommenderError";
        }
        // 验证推荐人是否领养(激活)
        int IS_ADOPTION = Integer.parseInt(pd1.getString("IS_ADOPTION"));
        if (IS_ADOPTION == 0) {
            return "nonAdoption";
        }
        // 传数据去保存新注册用户
        addRegisterUser(userInfo,pd1);
        return "success";
    }

    /**
     *@描述：保存新注册用户信息
     *@参数：注册页传过来的用户信息和查询数据得到推荐人信息
     *@返回值：
     *@创建人：Ajie
     *@创建时间：2019/10/16 0016
     */
    protected void addRegisterUser(String userInfo[],PageData Re) throws Exception {
        Date date = new Date();
        PageData pd = new PageData();
        // 推荐关系路径、推荐人ID
        String rePath = Re.getString("RE_PATH");
        String reId = Re.getString("J91008_USER_ID");
        // 定义新注册用户的推荐关系路径
        String path = "";
        if (Tools.isEmpty(rePath)) {
            path = ","+reId+",";
        }else {
            path = rePath+reId+",";
        }
        pd.put("GMT_CREATE",Tools.date2Str(date));
        pd.put("GMT_MODIFIED","");
        pd.put("IS_DELETED",0);
        pd.put("IS_WITHDRAW ",0);
        pd.put("PHONE",userInfo[0]);
        pd.put("PASSWORD",userInfo[1]);
        pd.put("FEEDING_TODAY",0);
        pd.put("MONEY",0);
        pd.put("RECOMMENDED_NUMBER",0);
        pd.put("RECOMMENDER",reId);
        pd.put("RE_PATH",path);
        pd.put("LOVE_COIN",0);
        pd.put("NICKNAME","");
        pd.put("IS_ADOPTION",0);
        j91008_userService.save(pd);
        pd = j91008_userService.findByPhone(pd);
        // 把新注册的用户添加到服务器缓存中
        applicati.setAttribute(userInfo[0],pd);
        // 更新推荐人的推荐数量
        int number = Integer.parseInt(Re.getString("RECOMMENDED_NUMBER"));
        pd.put("RECOMMENDED_NUMBER",(number+1));
        pd.put("PHONE",Re.getString("PHONE"));
        j91008_userService.addReNumber(pd);
        // 根据推荐人ID查信息，重复赋值到服务器缓存中
        pd = j91008_userService.findById(Re);
        applicati.setAttribute(pd.getString("PHONE"),pd);
    }


    /**
     * @描述：请求登录，验证用户
     * @返回值：是否登录成功
     * @创建人：Ajie
     * @创建时间：2019/10/16 0016
     */
    @RequestMapping(value = "/login")
    @ResponseBody
    private String login() throws Exception {
        PageData pd = new PageData();
        PageData pd1;
        // 获取前台传过来的登录信息
        pd = this.getPageData();
        // 登录过来的手机号和密码
        String phone = pd.getString("phone");
        String password = Tools.encrypt(pd.getString("password"));
        //验证手机号是否正确
        pd.put("PHONE",phone);
        pd = j91008_userService.findByPhone(pd);
        if ("".equals(pd) || pd == null){
            return "phoneError";
        }
        // 验证密码和手机号是否匹配
        // 先在服务器缓存中查询是否有用户信息
        pd1 = (PageData) applicati.getAttribute(phone);
        boolean is_phone;
        boolean is_password;
        if (!"".equals(pd1) || pd1 != null){
            is_phone = phone.equals(pd1.getString("PHONE"));
            is_password = password.equals(pd1.getString("PASSWORD"));
            // 如果密码或者手机号不匹配
            if (!is_phone || !is_password){
                return "error";
            }
            pd = pd1;
        }else {
            pd = j91008_userService.findByPhoneAndpassword(pd);
            if ("".equals(pd) || pd == null){
                return "error";
            }
            // 把从数据库查到的用户信息添加到服务器缓存中
            applicati.setAttribute(pd.getString("PHONE"),pd);
        }
        // 调用方法赋值到实体类中
        savaUser(pd);
        return "success";
    }

    /**
     *@描述：保存信息到实体类并存放到session中
     *@参数：通过验证的用户信息
     *@返回值：
     *@创建人：Ajie
     *@创建时间：2019/10/16 0016
     */
    protected void savaUser(PageData pd) {
        // 创建实体类对象
        User user = new User();
        user.setIS_DELETED(Integer.parseInt(pd.getString("IS_DELETED")));
        user.setIS_WITHDRAW(Integer.parseInt(pd.getString("IS_WITHDRAW")));
        user.setPHONE(pd.getString("IS_WITHDRAW"));
        user.setPASSWORD(pd.getString("IS_DELETED"));
        user.setFEEDING_TODAY(Integer.parseInt(pd.getString("FEEDING_TODAY")));
        user.setRECOMMENDED_NUMBER(Integer.parseInt(pd.getString("RECOMMENDED_NUMBER")));
        user.setRECOMMENDER(Integer.parseInt(pd.getString("RECOMMENDER")));
        user.setRE_PATH(pd.getString("RE_PATH"));
        user.setNICKNAME(pd.getString("NICKNAME"));
        user.setIS_ADOPTION(Integer.parseInt(pd.getString("IS_ADOPTION")));
        // 放入session中
        Jurisdiction.getSession().setAttribute(Const.J9User_SESSION_USER,user);
    }


}
