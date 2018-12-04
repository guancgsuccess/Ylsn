package com.chixing.interceptor;

import com.alibaba.druid.pool.DruidDataSource;
import com.chixing.filter.AdvancedFilter;
import com.chixing.listener.LoginListener;
import com.chixing.listener.VisitCountListener;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.boot.web.servlet.ServletListenerRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import javax.sql.DataSource;

@ServletComponentScan
@Configuration
//一个是配置包扫描的，一个是启用Spring MVC支持
public class MyMvcConfig implements WebMvcConfigurer {
    @Bean
    public ViewResolver viewResolver() {
        InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
        viewResolver.setPrefix("/WEB-INF/jsp/");
        viewResolver.setSuffix(".jsp");
        return viewResolver;
    }

    /**
     * 注册拦截器
     */
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        //addPathPattern后跟拦截地址，excludePathPatterns后跟排除拦截地址
        registry.addInterceptor(new CheckLoginInterceptor()).excludePathPatterns("/GetMobileCode","/askCheckNikename","/customer/save","/pageJump"
                ,"/askCheckPhone","/register","/druid/**","/Path/**","/index","/login","/customer/login","/customer/logout","/customer/askVerCode","/image","/css/**","/img/**","/js/**","/happiness/getHappinessPhoto","/customer/getCustomerListByVisit","/customer/getCustomerList","/error").addPathPatterns("/**");
        registry.addInterceptor(localeInterceptor()).excludePathPatterns("").addPathPatterns("/customer/message");
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        //对文件的路径进行配置,创建一个虚拟路径/Path/** ，即只要在<img src="/Path/picName.jpg" />便可以直接引用图片
        //*这是图片的物理路径  "file:/+本地图片的地址"
      //  registry.addResourceHandler("/Path/**").addResourceLocations("file:/F:\\Ylsn Image\\","file:F:/Ylsn Image/happ-photo/allPhoto/","file:F:/Ylsn Image/happ-photo/homePhoto/","file:F:\\Ylsn Image\\cust-photo/","file:F:/Ylsn Image/acti-photo/");
        registry.addResourceHandler("/Path/**").addResourceLocations("file:D:/Ylsn Image/happ-photo/allPhoto/","file:D:/Ylsn Image/happ-photo/homePhoto/","file:D:\\Ylsn Image\\cust-photo/","file:D:/Ylsn Image/acti-photo/");

        WebMvcConfigurer.super.addResourceHandlers(registry);
    }

    @SuppressWarnings({ "rawtypes", "unchecked" })
    @Bean
    public FilterRegistrationBean advancedFilterRegister() {
        FilterRegistrationBean frBean = new FilterRegistrationBean();
        frBean.setFilter(new AdvancedFilter());
        frBean.addUrlPatterns("/**");
        frBean.addInitParameter("dirtyWord","/WEB-INF/DirtyWord");
        frBean.addInitParameter("charset","UTF-8");
        System.out.println("filter");
        return frBean;
    }

    @SuppressWarnings({ "rawtypes", "unchecked" })
    @Bean
    public ServletListenerRegistrationBean LoginListenerRegist() {
        ServletListenerRegistrationBean srb = new ServletListenerRegistrationBean();
        srb.setListener(new LoginListener());
        System.out.println("loginListener");
        return srb;
    }

    @SuppressWarnings({ "rawtypes", "unchecked" })
    @Bean
    public ServletListenerRegistrationBean VisitListenerRegist() {
        ServletListenerRegistrationBean srb = new ServletListenerRegistrationBean();
        srb.setListener(new VisitCountListener());
        System.out.println("visitListener");
        return srb;
    }

    @Bean
    public VisitCountInterceptor localeInterceptor() {
        return new VisitCountInterceptor();
    }

    @Bean
    @ConfigurationProperties(prefix = "spring.datasource")
    @Primary //在同样的DataSource中，首先使用被标注的DataSource
    //加载时读取指定的配置信息,前缀为spring.datasource.druid
    public DataSource druidDataSource() {

        return new DruidDataSource();
    }
}
