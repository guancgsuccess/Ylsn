package com.chixing.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import java.util.HashSet;
import java.util.Set;
/*@WebListener*/
public class LoginListener implements HttpSessionListener,ServletContextListener {
    private ServletContext application = null;
    public void contextDestroyed(ServletContextEvent sce) {
        System.out.println("context destory");
    }

    public void contextInitialized(ServletContextEvent sce) {
        System.out.println("context init");
        application = sce.getServletContext();
        Set<Integer> onlineUserSet = new HashSet<Integer>();
        application.setAttribute("onlineUserSet", onlineUserSet);
    }

    public void sessionCreated(HttpSessionEvent se) {
        System.out.println("session create");
    }

    public void sessionDestroyed(HttpSessionEvent se) {
        HttpSession session = se.getSession();
        Set<Integer> onlineUserSet = (Set<Integer>)application.getAttribute("onlineUserSet");
        Integer custId = (Integer)session.getAttribute("custId");
        onlineUserSet.remove(custId);
        application.setAttribute("onlineUserSet", onlineUserSet);
        onlineUserSet = (Set<Integer>)application.getAttribute("onlineUserSet");
        System.out.println(onlineUserSet.toString());
        System.out.println(custId + "超时退出");
        System.out.println("session destory");
    }

}