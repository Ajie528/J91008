package com.fh.controller.fish;


import com.fh.service.fish.System_configManager;
import com.fh.util.Const;
import com.fh.util.DateUtil;
import com.fh.util.PageData;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.util.ArrayList;
import java.util.List;

/**
 * 说明：服务器启动监听 缓存用
 * 创建人：Ajie
 * 创建时间：2019-10-14 11:22:27
 */
public class MonitorController implements ServletContextListener {

    // 服务器启动监听
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        // 在这里写你要执行的内容
        System.out.println("服务器缓存执行时间：//" + DateUtil.getTime().toString());
        // 得到上下文
        ServletContext applicati = sce.getServletContext();
        ApplicationContext context = new ClassPathXmlApplicationContext(new String[]{
                // 查找配置文件
                "classpath:spring/ApplicationContext-dataSource.xml",
                "classpath:spring/ApplicationContext-main.xml",
                "classpath:spring/ApplicationContext-redis.xml"
        });
        // 在下面写想要服务器启动时需要什么数据放到缓存
        // service层的类，getBean()是实现类的Service

        // 系统参数配置
        System_configManager system_configService = context.getBean("system_configService",System_configManager.class);
        PageData pd = new PageData();
        // 创建用户缓存list
        List<PageData> userList = new ArrayList<>(18);

        // 赋值ID查参数表
        pd.put("SYSTEM_CONFIG_ID","1");
        try {
           pd =  system_configService.findById(pd);
        } catch (Exception e) {
            e.printStackTrace();
        }
        // 存放到缓存中，键值对 #参数设置
        // 把参数信息放到缓存
        applicati.setAttribute(Const.Par, pd);


    }
    // 服务器关闭监听
    @Override
    public void contextDestroyed(ServletContextEvent sce) {
    }

}
