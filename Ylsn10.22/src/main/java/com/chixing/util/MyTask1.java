package com.chixing.util;

import com.chixing.dao.CustomerDao;

import javax.servlet.ServletContext;
import java.util.Calendar;
import java.util.TimerTask;

public class MyTask1 extends TimerTask {
    private static final int C_SCHEDULE_HOUR = 0;
    private static boolean isRunning = false;
    private ServletContext context = null;
    private CustomerDao customerDao = null;

    public MyTask1(ServletContext context, CustomerDao customerDao) {
        this.context  =  context;
        this.customerDao  =  customerDao;
    }

    @Override
    public void run() {
        Calendar cal = Calendar.getInstance();
        if(!isRunning){
            if(C_SCHEDULE_HOUR == cal.get(Calendar.HOUR_OF_DAY)){
                isRunning = true;
                context.log("开始执行指定任务");

                //TODO  添加自定义的详细任务，以下只是示例
                customerDao.updateCustomerDay();

                isRunning  =  false;
                context.log("指定任务执行结束");
            }
        }else{
            context.log("上一次任务执行还未结束");
        }
    }
}
