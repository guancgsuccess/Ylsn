package com.chixing.service;

import com.chixing.entity.CustFollowBean;
import com.chixing.entity.Customer;
import com.chixing.entity.Visit;

import java.util.Date;
import java.util.List;

public interface VisitService {
    List<Customer> getVisitByVisitId(int custVisitId);

    List<CustFollowBean> getVisitByVisitId6(int custVisitId);

    List<CustFollowBean> getVisitById(int custId);

    Date getLastTime(int custId,int custVisitId);

    int getHasVisited(int custId,int custVisitId);

    int saveVisit(Visit visit);

    int updateVisit(Visit visit);

    //查询访问我的用户数量
    int getVisitCount(Integer custVisitId);

    //查询我访问的用户数量
    int getMyVisitOtherCount(Integer custId);

    //查询访问过我的所有用户
    List<CustFollowBean> getAllVisitme(Integer custVisitId);

    //查询我访问过的用户
    List<CustFollowBean> getmyVisitOtherById(Integer custId);

    void saveVisitById(Integer custId,Integer custVisitId);
}
