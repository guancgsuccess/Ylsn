package com.chixing.util;

import com.chixing.dao.CustomerDao;

import javax.servlet.ServletContext;
import java.util.Calendar;
import java.util.TimerTask;

public class MyTask2 extends TimerTask {
    private static final int C_SCHEDULE_WEEK = 1;
    private static final int C_SCHEDULE_MONTH = 1;
    private static boolean isRunning = false;
    private ServletContext context = null;
    private CustomerDao customerDao = null;

    public MyTask2(ServletContext context, CustomerDao customerDao) {
        this.context  =  context;
        this.customerDao  =  customerDao;
    }

    @Override
    public void run() {
        Calendar cal = Calendar.getInstance();
        if(!isRunning){
            if(C_SCHEDULE_WEEK == cal.get(Calendar.DAY_OF_WEEK)){
                isRunning = true;
                context.log("开始执行指定任务");

                //TODO  添加自定义的详细任务，以下只是示例
                customerDao.updateCustomerWeekVisitCount();

                isRunning  =  false;
                context.log("指定任务执行结束");
            }

            if(C_SCHEDULE_MONTH == cal.get(Calendar.DAY_OF_MONTH)){
                isRunning = true;
                context.log("开始执行指定任务");

                //TODO  添加自定义的详细任务，以下只是示例
                customerDao.updateCustomerMonthVisitCount();

                isRunning  =  false;
                context.log("指定任务执行结束");
            }
        }else{
            context.log("上一次任务执行还未结束");
        }
    }
}
