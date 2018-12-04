package com.chixing.interceptor;

import com.chixing.entity.Visit;
import com.chixing.service.VisitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Calendar;
import java.util.Date;

public class VisitCountInterceptor  extends HandlerInterceptorAdapter {

    @Autowired
    private VisitService visitService;
    public VisitCountInterceptor(VisitService visitService){
        this.visitService=visitService;
    }
    public VisitCountInterceptor(){ }
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        Integer custId=(Integer) request.getSession(false).getAttribute("custId");
        Integer id=Integer.parseInt( request.getParameter("id"));
        if(custId!=id)
            visitService.saveVisitById(custId,id);
        return true;
    }


}
