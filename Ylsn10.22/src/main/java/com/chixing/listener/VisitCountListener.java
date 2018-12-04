package com.chixing.listener;

import com.chixing.dao.CustomerDao;
import com.chixing.util.MyTask1;
import com.chixing.util.MyTask2;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.util.Timer;

public class VisitCountListener implements ServletContextListener {
    private Timer timer=null;

    @Override
    public void contextInitialized(ServletContextEvent event) {
        WebApplicationContext appctx = WebApplicationContextUtils.getWebApplicationContext(event.getServletContext());
        CustomerDao customerDao = (CustomerDao) appctx.getBean("customerDao");
        timer = new Timer(true);
        event.getServletContext().log("定时器已启动");
        timer.schedule(new MyTask1(event.getServletContext(),customerDao),0,60*60*1000);
        timer.schedule(new MyTask2(event.getServletContext(),customerDao),0,24*60*60*1000);
        event.getServletContext().log("已经添加任务调度表");
    }

    @Override
    public void contextDestroyed(ServletContextEvent event) {
        timer.cancel();
        event.getServletContext().log("定时器销毁");
    }
}
