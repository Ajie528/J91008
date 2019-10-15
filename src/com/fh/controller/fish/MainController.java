package com.fh.controller.fish;

import com.fh.controller.base.BaseController;
import com.fh.service.fish.*;
import com.fh.util.PageData;
import com.fh.util.express.ThreadManagers;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;


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
     *@描述：清空系统数据，保留顶点账号和参数
     *@返回值：成功信息
     *@创建人：Ajie
     *@创建时间：2019/10/15 0015
     */
    @RequestMapping(value = "/resetSystem")
    @ResponseBody
    public String resetSystem() throws Exception {
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
        return "success";
    }


}
