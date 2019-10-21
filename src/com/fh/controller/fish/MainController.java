package com.fh.controller.fish;

import com.fh.controller.base.BaseController;
import com.fh.entity.User;
import com.fh.service.fish.*;
import com.fh.util.*;
import com.fh.util.express.ThreadManagers;
import org.apache.shiro.session.Session;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;


import java.util.ArrayList;
import java.util.List;

import static com.fh.util.DateUtil.*;


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
     * @描述：访问注册页
     * @创建人：Ajie
     * @创建时间：2019/10/17 0017
     */
    @RequestMapping(value = "/toRegister")
    public ModelAndView toRegister() {
        ModelAndView mv = this.getModelAndView();
        mv.setViewName("j91008/register");
        return mv;
    }

    /**
     * 功能描述：访问登录页
     *
     * @author Ajie
     * @date 2019/10/17
     */
    @RequestMapping(value = "/toLogin")
    public ModelAndView toLogin() {
        ModelAndView mv = this.getModelAndView();
        mv.setViewName("j91008/login");
        removeSession();
        return mv;
    }

    /**
     * 功能描述：访问首页
     *
     * @author Ajie
     * @date 2019/10/18
     */
    @RequestMapping(value = "/toIndex")
    public ModelAndView toIndex() throws Exception {
        ModelAndView mv = this.getModelAndView();
        if (is_login()) {
            User user = (User) Jurisdiction.getSession().getAttribute(Const.J9User_SESSION_USER);
            PageData pd = new PageData();
            pd.put("PHONE", user.getPHONE());
            pd = j91008_userService.findByPhone(pd);
            mv.setViewName("j91008/index");
            mv.addObject("user", pd);
        } else {
            mv.setViewName("j91008/login");
        }
        return mv;
    }

    /**
     * 功能描述：访问充值页面
     *
     * @author Ajie
     * @date 2019/10/18 0018
     */
    @RequestMapping(value = "/toCharge")
    public ModelAndView toCharge() throws Exception {
        ModelAndView mv = this.getModelAndView();
        if (is_login()) {
            User user = (User) Jurisdiction.getSession().getAttribute(Const.J9User_SESSION_USER);
            PageData pd = new PageData();
            // 从缓存获取参数配置
            PageData par = (PageData) applicati.getAttribute(Const.Par);
            pd.put("PHONE", user.getPHONE());
            pd = j91008_userService.findByPhone(pd);
            mv.setViewName("j91008/charge");
            mv.addObject("user", pd);
            mv.addObject("par", par);
        } else {
            mv.setViewName("j91008/login");
        }
        return mv;
    }

    /**
     * 功能描述：访问喂养页面
     *
     * @author Ajie
     * @date 2019/10/19 0019
     */
    @RequestMapping(value = "/toFeeding")
    public ModelAndView toFeeding() throws Exception {
        ModelAndView mv = this.getModelAndView();
        if (is_login()) {
            User user = (User) Jurisdiction.getSession().getAttribute(Const.J9User_SESSION_USER);
            PageData pd = new PageData();
            // 从缓存获取参数配置
            PageData par = (PageData) applicati.getAttribute(Const.Par);
            // 获取轮播图列表
            List<PageData> rotationChartList = rotation_chartService.listAll(pd);
            pd.put("PHONE", user.getPHONE());
            pd = j91008_userService.findByPhone(pd);
            mv.setViewName("j91008/feeding");
            mv.addObject("user", pd);
            mv.addObject("par", par);
            mv.addObject("pic", rotationChartList);
        } else {
            mv.setViewName("j91008/login");
        }
        return mv;
    }

    /**
     * 功能描述：访问公排页面
     *
     * @author Ajie
     * @date 2019/10/19 0019
     */
    @RequestMapping(value = "/toPlatoon")
    public ModelAndView toPlatoon() throws Exception {
        ModelAndView mv = this.getModelAndView();
        if (is_login()) {
            User user = (User) Jurisdiction.getSession().getAttribute(Const.J9User_SESSION_USER);
            PageData pd = new PageData();
            pd.put("PHONE", user.getPHONE());
            pd = j91008_userService.findByPhone(pd);
            pd.put("USER_ID", pd.getString("J91008_USER_ID"));
            List<PageData> feedList = feed_recordService.listByUserId(pd);
            mv.setViewName("j91008/platoon");
            mv.addObject("user", pd);
            mv.addObject("feedRec", feedList);
        } else {
            mv.setViewName("j91008/login");
        }
        return mv;
    }

    /**
     * 功能描述：访问我的页面
     *
     * @author Ajie
     * @date 2019/10/19 0019
     */
    @RequestMapping(value = "/toCenter")
    public ModelAndView toCenter() throws Exception {
        ModelAndView mv = this.getModelAndView();
        if (is_login()) {
            User user = (User) Jurisdiction.getSession().getAttribute(Const.J9User_SESSION_USER);
            PageData pd = new PageData();
            pd.put("PHONE", user.getPHONE());
            pd = j91008_userService.findByPhone(pd);
            // 获取轮播图列表
            List<PageData> rotationChartList = rotation_chartService.listAll(pd);
            // 获取新闻公告
            PageData news = notice_recService.findByNewTime(pd);
            mv.setViewName("j91008/center");
            mv.addObject("user", pd);
            mv.addObject("pic", rotationChartList);
            mv.addObject("news", news);
        } else {
            mv.setViewName("j91008/login");
        }
        return mv;
    }

    /**
     * 功能描述：访问奖金明细页面
     * @author Ajie
     * @date 2019/10/21 0021
     */
    @RequestMapping(value = "/toBonusRec")
    public ModelAndView toBonusRec() throws Exception {
        ModelAndView mv = this.getModelAndView();
        if (is_login()) {
            User user = (User) Jurisdiction.getSession().getAttribute(Const.J9User_SESSION_USER);
            PageData pd = new PageData();
            pd.put("PHONE", user.getPHONE());
            pd = j91008_userService.findByPhone(pd);
            pd.put("USER_ID", pd.getString("J91008_USER_ID"));
            // 奖金记录
            List<PageData> bonusList = bonus_recService.listByUserId(pd);
            // 充值记录
            List<PageData> rechargeList = recharge_cashService.listByUserId(pd);
            // 提现记录
            List<PageData> withdrawList = withdraw_cashService.listByUserId(pd);
            List<PageData> total = new ArrayList<>(18);
            total.addAll(bonusList);
            if (rechargeList.size()>0){
                total.addAll(rechargeList);
            }
            if (withdrawList.size()>0){
                total.addAll(withdrawList);
            }
            total = SortUtil.sortTime(total);
            mv.setViewName("j91008/fundDetails");
            mv.addObject("user", pd);
            mv.addObject("bonusRec", total);
        } else {
            mv.setViewName("j91008/login");
        }
        return mv;
    }


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
                    j91008_userService.wipeReNumber(pd);
                    notice_recService.wipeData(pd);
                    recharge_cashService.wipeData(pd);
                    bonus_recService.wipeData(pd);
                    feed_recordService.wipeData(pd);
                    withdraw_cashService.wipeData(pd);
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
    protected String register(@RequestParam("USER") String[] userInfo) throws Exception {
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
        pd.put("PHONE", phone);
        pd2 = j91008_userService.findByPhone(pd);
        if (pd2 != null) {
            return "alreadyExist";
        }
        // 加密后的密码和确认密码验证
        if (!password.equals(confirm)) {
            return "passwordError";
        }
        // 验证推荐人是否存在
        pd.put("PHONE", recommender);
        pd1 = j91008_userService.findByPhone(pd);
        if ("".equals(pd1) || pd1 == null) {
            return "recommenderError";
        }
        // 验证推荐人是否领养(激活)
        int IS_ADOPTION = Integer.parseInt(pd1.get("IS_ADOPTION").toString());
        if (IS_ADOPTION == 0) {
            return "nonAdoption";
        }
        // 验证是否有HTNL标签
        if (Tools.checkHTML(userInfo[1]) || Tools.checkHTML(userInfo[2])) {
            return "illegal";
        }


        // 传数据去保存新注册用户
        addRegisterUser(userInfo, pd1);
        return "success";
    }

    /**
     * @描述：保存新注册用户信息
     * @参数：注册页传过来的用户信息和查询数据得到推荐人信息
     * @返回值：
     * @创建人：Ajie
     * @创建时间：2019/10/16 0016
     */
    protected void addRegisterUser(String[] userInfo, PageData Re) throws Exception {
        PageData pd = new PageData();
        PageData pd1 = new PageData();
        // 推荐关系路径、推荐人ID
        String rePath = Re.getString("RE_PATH");
        String reId = Re.getString("J91008_USER_ID");
        // 定义新注册用户的推荐关系路径
        String path = "";
        if (Tools.isEmpty(rePath)) {
            path = "," + reId + ",";
        } else {
            path = rePath + reId + ",";
        }
        pd.put("GMT_CREATE", getTime());
        pd.put("GMT_MODIFIED", "");
        pd.put("TEAM_PERFORMANCE", 0);
        pd.put("IS_WITHDRAW", 0);
        pd.put("PHONE", userInfo[0]);
        pd.put("PASSWORD", Tools.encrypt(userInfo[1]));
        pd.put("FEEDING_TODAY", 0);
        pd.put("MONEY", 0);
        pd.put("RECOMMENDED_NUMBER", 0);
        pd.put("RECOMMENDER", reId);
        pd.put("RE_PATH", path);
        pd.put("LOVE_COIN", 0);
        pd.put("NICKNAME", "");
        pd.put("IS_ADOPTION", 0);
        pd.put("J91008_USER_ID", "");
        j91008_userService.save(pd);
        pd = j91008_userService.findByPhone(pd);
        // 把新注册的用户添加到服务器缓存中
        applicati.setAttribute(userInfo[0], pd);
        // 更新推荐人的推荐数量
        int number = Integer.parseInt(Re.get("RECOMMENDED_NUMBER").toString());
        pd1.put("RECOMMENDED_NUMBER", (number + 1));
        pd1.put("PHONE", Re.get("PHONE"));
        j91008_userService.addReNumber(pd1);
        // 根据推荐人ID查信息，重复赋值到服务器缓存中
        pd1 = j91008_userService.findById(Re);
        applicati.setAttribute(pd1.get("PHONE").toString(), pd1);
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
        PageData pd1 = new PageData();
        // 获取前台传过来的登录信息
        pd = this.getPageData();
        // 登录过来的手机号和密码
        String phone = pd.getString("phone");
        String password = Tools.encrypt(pd.getString("password"));
        //验证手机号是否正确
        pd.put("PHONE", phone);
        pd = j91008_userService.findByPhone(pd);
        if ("".equals(pd) || pd == null) {
            return "phoneError";
        }
        // 验证密码和手机号是否匹配
        // 先在服务器缓存中查询是否有用户信息
        pd1 = (PageData) applicati.getAttribute(phone);
        boolean is_phone;
        boolean is_password;
        if (!"".equals(pd1) || pd1 != null) {
            is_phone = phone.equals(pd1.get("PHONE").toString());
            is_password = password.equals(pd1.getString("PASSWORD"));
            // 如果密码或者手机号不匹配
            if (!is_phone || !is_password) {
                return "error";
            }
            pd = pd1;
        } else {
            pd = j91008_userService.findByPhoneAndpassword(pd);
            if ("".equals(pd) || pd == null) {
                return "error";
            }
            // 把从数据库查到的用户信息添加到服务器缓存中
            applicati.setAttribute(pd.get("PHONE").toString(), pd);
        }
        // 验证是否有html标签
        if (Tools.checkHTML(pd.getString("password"))) {
            return "illegal";
        }
        // 调用方法赋值到实体类中
        savaUser(pd);
        return "success";
    }

    /**
     * @描述：保存信息到实体类并存放到session中
     * @参数：通过验证的用户信息
     * @返回值：
     * @创建人：Ajie
     * @创建时间：2019/10/16 0016
     */
    protected void savaUser(PageData pd) {
        // 创建实体类对象
        User user = new User();
        user.setTEAM_PERFORMANCE(Integer.parseInt(pd.get("TEAM_PERFORMANCE").toString()));
        user.setIS_WITHDRAW(Integer.parseInt(pd.get("IS_WITHDRAW").toString()));
        user.setPHONE(pd.get("PHONE").toString());
        user.setPASSWORD(pd.getString("PASSWORD"));
        user.setFEEDING_TODAY(Integer.parseInt(pd.get("FEEDING_TODAY").toString()));
        user.setRECOMMENDED_NUMBER(Integer.parseInt(pd.get("RECOMMENDED_NUMBER").toString()));
        if (pd.get("RECOMMENDER") != null) {
            user.setRECOMMENDER(Integer.parseInt(pd.get("RECOMMENDER").toString()));
        }
        user.setRE_PATH(pd.getString("RE_PATH"));
        user.setNICKNAME(pd.getString("NICKNAME"));
        user.setIS_ADOPTION(Integer.parseInt(pd.get("IS_ADOPTION").toString()));
        // 放入session中
        Jurisdiction.getSession().setAttribute(Const.J9User_SESSION_USER, user);
    }

    /**
     * 功能描述：领养小鱼
     *
     * @return 是否成功
     * @author Ajie
     * @date 2019/10/18 0018
     */
    @RequestMapping(value = "/adopt")
    @ResponseBody
    protected String adopt() throws Exception {
        PageData pd = new PageData();
        // 获取前台传过来的手机号
        pd = this.getPageData();
        pd = j91008_userService.findByPhone(pd);
        if (!is_login()) {
            return "login";
        }
        // 验证账号钱是否足够
        double money = Double.parseDouble(pd.get("MONEY").toString());
        if (money <= 0) {
            return "less";
        }
        // 执行领养，扣除1元饲料，更新状态为1（领养）
        int cost = 1;
        pd.put("COST", cost);
        j91008_userService.deducMoneyAndUpState(pd);
        return "success";
    }

    /**
     * 功能描述：充值饲料
     *
     * @param ：数额、支付方式、支付凭据
     * @return 是否成功
     * @author Ajie
     * @date 2019/10/19 0019
     */
    @RequestMapping(value = "/charge")
    @ResponseBody
    public String recharge(@RequestParam("recInfo") String[] recInfo) throws Exception {
        double money = Double.parseDouble(recInfo[0]);
        // 验证是否登录
        if (!is_login()) {
            return "login";
        }
        // 验证充值的数额是否大于0
        if (money <= 0) {
            return "tooLittle";
        }
        // 验证是否选择了充值类型
        if (Tools.isEmpty(recInfo[1])) {
            return "typeEmpty";
        }
        // 验证是否上传支付凭证
        if (Tools.isEmpty(recInfo[2])) {
            return "imgEmpty";
        }
        // 创建未审核的充值订单
        PageData pd = new PageData();
        pd.put("GMT_CREATE", getTime());
        pd.put("GMT_MODIFIED", "");
        pd.put("NUMBER", money);
        pd.put("USER_ID", Integer.parseInt(recInfo[3]));
        pd.put("PAYMENT_TYPE", Integer.parseInt(recInfo[1]));
        pd.put("VOUCHER", recInfo[2]);
        pd.put("IS_DELETED", 0);
        pd.put("IS_AUDITING", 0);
        pd.put("RECHARGE_CASH_ID", this.get32UUID());
        recharge_cashService.save(pd);
        return "success";
    }

    /**
     * 功能描述：充值饲料，确认审核
     *
     * @param :充值订单ID
     * @return :是否成功
     * @author Ajie
     * @date 2019/10/19 0019
     */
    @RequestMapping(value = "/adoptExamine")
    @ResponseBody
    protected String adoptExamine() throws Exception {
        PageData pd = new PageData();
        pd = this.getPageData();
        // 查询订单
        pd = recharge_cashService.findById(pd);
        // 判断是否已经审核
        int i = Integer.parseInt(pd.get("IS_AUDITING").toString());
        if (i == 1) {
            return "processed";
        }
        String userId = pd.getString("USER_ID");
        // 更改订单状态
        pd.put("IS_AUDITING", 1);
        pd.put("GMT_MODIFIED", getTime());
        recharge_cashService.editState(pd);
        double money = Double.parseDouble(pd.get("NUMBER").toString());
        // 给用户增加饲料
        addMoney(userId, money);
        return "success";
    }

    /**
     * 功能描述：喂养小鱼
     *
     * @param :手机号
     * @return :是否成功
     * @author Ajie
     * @date 2019/10/19 0019
     */
    @RequestMapping(value = "/feedFish")
    @ResponseBody
    protected String feedFish() throws Exception {
        PageData pd = new PageData();
        PageData pd1 = new PageData();
        PageData par = (PageData) applicati.getAttribute(Const.Par);
        pd = this.getPageData();
        // 通过手机号查用户信息
        pd = j91008_userService.findByPhone(pd);
        String userId = pd.getString("J91008_USER_ID");
        double money = Double.parseDouble(pd.get("MONEY").toString());
        // 验证是否处于登录状态
        if (!is_login() || (pd == null)) {
            return "login";
        }
        // 验证饲料（钱）是否够喂养小鱼
        double cost = 50;
        if (money < cost) {
            return "less";
        }
        // 验证是否达到今天喂养封顶次数
        int count = Integer.parseInt(pd.get("FEEDING_TODAY").toString()); // 今日喂养次数
        int feedingTimes = Integer.parseInt(par.get("FEEDING_TIMES").toString()); // 没有推人进来的喂养次数
        int Max = Integer.parseInt(par.get("FEED_CAPPING").toString()); // 推荐人进来最大可获得的喂养次数
        int recommendedNumber = Integer.parseInt(pd.get("RECOMMENDED_NUMBER").toString()); // 推荐数量
        int getFeed = Integer.parseInt(par.get("GET_FREQUENCY").toString()); // 推荐人进来获得的喂养次数
        boolean is_feed = (recommendedNumber <= 0 && count == 0) || (count < Max+feedingTimes && count < recommendedNumber*getFeed+feedingTimes);
        if (!is_feed){
            return "MaxFeed";
        }
        // 执行喂养
        // 1.获取全部喂养记录累积，为了得到下一个排号,和已出局人数
        pd1 = feed_recordService.getRecCount(pd);
        int recCount = Integer.parseInt(pd1.get("REC_COUNT").toString());
        int outCount = Integer.parseInt(pd1.get("OUT_COUNT").toString());
        // 2.创建喂养记录
        pd.put("GMT_CREATE", getTime());
        pd.put("GMT_MODIFIED", "");
        pd.put("FEED_NUMBER", cost);
        pd.put("USER_ID", pd.getString("J91008_USER_ID"));
        pd.put("IS_OUT", 0);
        pd.put("ROW_NUMBER", ++recCount);
        pd.put("COUNT_OUT", outCount);
        pd.put("FEED_RECORD_ID", "");
        feed_recordService.save(pd);
        // 3.用户今日喂养次数+1
        j91008_userService.addFeedCount(pd);
        // 4.扣除用户饲料（钱）
        pd.put("COST", cost);
        j91008_userService.deducMoney(pd);
        // 调用奖金结算的方法
        bonusSettlement(userId,cost);
        outBonusSettlement(cost);
        return "success";
    }

    /**
     * 功能描述：动态奖金结算
     * @author Ajie
     * @date 2019/10/21 0021
     * @param : 用户ID,喂养成本
     */
    public void bonusSettlement(String userId, double cost) throws Exception {
        // 如果是顶点账号 不用发奖金
        if (userId.equals("10000")) {
            return;
        }
        PageData pd = new PageData();
        pd.put("J91008_USER_ID", userId);
        // 查找用户信息
        pd = j91008_userService.findById(pd);
        // 推荐人
        String Recommender = pd.get("RECOMMENDER").toString();
        String recommenPath = pd.getString("RE_PATH");
        // 发推荐奖
        double re_profit = 0.02;
        double money = re_profit * cost;
        addMoney(Recommender, money);
        bonusRec(Recommender,money,"动态");
        // 发管理奖
        double ad_profit = 0.01;
        money = ad_profit * cost;
        int MaxNumber = 7;
        // 字符串截取
        if (recommenPath.startsWith(",")) {
            recommenPath = recommenPath.substring(1);
        }
        if (recommenPath.endsWith(",")) {
            recommenPath = recommenPath.substring(0,recommenPath.length()-1);
        }
        // 根据推荐路径 查最高7人
        pd.put("PATH",recommenPath);
        pd.put("NUM",MaxNumber);
        List<PageData> listRe = j91008_userService.listMostNumByPath(pd);
        if (listRe.size() < 2) {
            return;
        }
        // 删除列表第一个元素，因为已经发了推荐奖了
        listRe.remove(0);
        // 给符合条件的用户发钱
        for (PageData i : listRe) {
            userId = i.getString("J91008_USER_ID");
            addMoney(userId,money);
            bonusRec(userId,money,"动态");
        }
    }

    /**
     * 功能描述：静态奖金结算（出局奖金）
     * @author Ajie
     * @date 2019/10/21 0021
     * @param :成本
     * @return
     */
    public void outBonusSettlement(double cost) throws Exception {
        PageData pd = new PageData();
        PageData par = (PageData) applicati.getAttribute(Const.Par);
        // 查询已出局人数和当前排号累积
        pd = feed_recordService.getRecCount(pd);
        int count = Integer.parseInt(pd.get("REC_COUNT").toString());
        int out_count = Integer.parseInt(pd.get("OUT_COUNT").toString());
        ++out_count;
        int number = 7;
        boolean is_adopt = out_count*number <= count;
        // 发放奖金
        while (is_adopt){
            // 查询未出局最小排号记录信息
            pd = feed_recordService.getNotOutMin(pd);
            String userId = pd.getString("USER_ID");
            // 更改记录状态
            pd.put("IS_OUT",1);
            pd.put("COUNT_OUT",out_count);
            feed_recordService.editState(pd);
            // 给用户发钱并且做记录
            double money = Double.parseDouble(par.get("OUT_EARNINGS").toString());
            addMoney(userId,money);
            bonusRec(userId,money,"出局");
            // 出局人数累积
            out_count++;
            is_adopt = out_count*number <= count;
        }

    }


    /**
     * 功能描述：创建奖金记录
     *
     * @param ：用户ID、数额、类型
     * @author Ajie
     * @date 2019/10/21 0021
     */
    public void bonusRec(String userId, double money, String type) throws Exception {
        PageData pd = new PageData();
        pd.put("GMT_CREATE", getTime());
        pd.put("GMT_MODIFIED", "");
        pd.put("NUMBER", money);
        pd.put("USER_ID", userId);
        pd.put("TYPE", type);
        pd.put("IS_DELETED", 0);
        pd.put("STATE", 1);
        pd.put("BONUS_REC_ID", "");
        bonus_recService.save(pd);
    }

    /**
     * 功能描述：给用户增加饲料（钱）
     *
     * @param :用户ID、数额
     * @author Ajie
     * @date 2019/10/19 0019
     */
    public void addMoney(String userId, double money) throws Exception {
        PageData pd = new PageData();
        pd.put("COST", money);
        pd.put("J91008_USER_ID", userId);
        j91008_userService.addMoney(pd);
    }

    /**
     * 功能描述：验证用户是否处于登录状态
     *
     * @author Ajie
     * @date 2019/10/18 0018
     */
    public boolean is_login() {
        //session缓存的用户信息
        User user = (User) Jurisdiction.getSession().getAttribute(Const.J9User_SESSION_USER);
        //判断不等于空
        if (user != null) {
            return true;
        } else {
            removeSession();
            return false;
        }
    }

    /**
     * 功能描述：清理session缓存
     *
     * @author Ajie
     * @date 2019/10/18 0018
     */
    public void removeSession() {
        Session session = Jurisdiction.getSession();    //以下清除session缓存
        session.removeAttribute(Const.J9User_SESSION_USER);
    }


}
