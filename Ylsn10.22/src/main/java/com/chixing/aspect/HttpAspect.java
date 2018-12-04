package com.chixing.aspect;

import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;

@Aspect
@Component
public class HttpAspect {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Pointcut("execution(public * com.chixing.controller.*.*(..))")
    public void myLog() {    }

    @Before("myLog()")
    public void reqMessage() {
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = attributes.getRequest();
        logger.info("*********打印请求信息开始**********");
        logger.info("URL : " + request.getRequestURL().toString());
        logger.info("HTTP_METHOD : " + request.getMethod());
        logger.info("*********打印请求信息结束**********");
    }

    @AfterReturning(returning="object",pointcut="myLog()")
    public void resMessage(Object object) {
        logger.info("*********打印结果信息开始**********");
        logger.info("RESULT:"+ object);
        logger.info("*********打印结果信息结束**********");
    }
}
