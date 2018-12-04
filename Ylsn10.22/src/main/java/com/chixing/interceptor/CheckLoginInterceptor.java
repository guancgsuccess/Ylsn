package com.chixing.interceptor;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CheckLoginInterceptor extends HandlerInterceptorAdapter {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String requesturl = request.getServletPath();
        System.out.println("request url = " + requesturl);
        HttpSession session = request.getSession();
        if (session.getAttribute("custPhone") != null) {
            System.out.println("interceptor... 用户已登录.........");
            return true;
        }
        System.out.println("interceptor......用户未登录......");
        response.sendRedirect("/login");
        return false;
    }
}
