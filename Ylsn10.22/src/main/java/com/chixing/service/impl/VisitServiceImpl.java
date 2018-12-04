package com.chixing.service.impl;

import com.chixing.dao.CustomerDao;
import com.chixing.dao.VisitDao;
import com.chixing.entity.CustFollowBean;
import com.chixing.entity.Customer;
import com.chixing.entity.Visit;
import com.chixing.service.VisitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Service
public class VisitServiceImpl implements VisitService {
    @Autowired
    private VisitDao visitDao;
    @Autowired
    private CustomerDao customerDao;

    @Override
    public List<Customer> getVisitByVisitId(int custVisitId) {
        return visitDao.selectVisitByVisitId(custVisitId);
    }

    @Override
    public List<CustFollowBean> getVisitByVisitId6(int custVisitId) {
        return visitDao.selectVisitByVisitId6(custVisitId);
    }

    @Override
    public List<CustFollowBean> getVisitById(int custId) {
        return visitDao.selectVisitById(custId);
    }

    @Override
    public Date getLastTime(int custId,int custVisitId) {
        return visitDao.selectLastTime(custId, custVisitId);
    }

    @Override
    public int getHasVisited(int custId, int custVisitId) {
        return visitDao.selectHasVisited(custId, custVisitId);
    }

    @Override
    public int saveVisit(Visit visit) {
        return visitDao.insertVisit(visit);
    }

    @Override
    public int updateVisit(Visit visit) {
        return visitDao.updateVisit(visit);
    }

    @Override
    public int getVisitCount(Integer custVisitId) {
        return visitDao.selectVisitCount(custVisitId);
    }

    @Override
    public int getMyVisitOtherCount(Integer custId) {
        return visitDao.selectMyVisitOtherCount(custId);
    }

    @Override
    public List<CustFollowBean> getAllVisitme(Integer custVisitId) {
        return visitDao.selectAllVisitme(custVisitId);
    }

    @Override
    public List<CustFollowBean> getmyVisitOtherById(Integer custId) {
        return visitDao.selectVisitById(custId);
    }

    @Override
    @Transactional
    public void saveVisitById(Integer custId, Integer custVisitId) {
        Date date=visitDao.selectLastTime(custId,custVisitId);
        boolean flag=false;
        Visit visit=new Visit();
        visit.setCustId(custId);
        visit.setCustVisitId(custVisitId);
        visit.setVisitDate(new Date());
        if(date==null){
            if(visitDao.insertVisit(visit)>0)
                flag=true;
        }
        else {
            if(date.getTime()<getTimeOf12().getTime()){
                if(visitDao.updateVisit(visit)>0)
                    flag=true;
            }
        }
        if(flag)
            customerDao.updateVisitCount(custVisitId);
    }

    private Date getTimeOf12() {
        Calendar cal = Calendar.getInstance();
        cal.setTime(new Date());
        cal.set(Calendar.HOUR_OF_DAY, 0);
        cal.set(Calendar.MINUTE, 0);
        cal.set(Calendar.SECOND, 0);
        cal.set(Calendar.MILLISECOND, 0);
        return cal.getTime();
    }
}
