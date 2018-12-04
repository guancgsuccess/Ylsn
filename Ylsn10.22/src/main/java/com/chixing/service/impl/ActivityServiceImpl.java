package com.chixing.service.impl;

import com.chixing.dao.ActivityDao;
import com.chixing.entity.Activity;
import com.chixing.entity.Customer;
import com.chixing.service.ActivityService;
import com.chixing.util.PageModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ActivityServiceImpl implements ActivityService {
    @Autowired
    private ActivityDao activityDao;

    @Override
    public List<Activity> getAllActivi() {
        return activityDao.selectAllActivity();
    }

    @Override
    public Activity getActivityById(Integer actiId) {
        return activityDao.selectActivityById(actiId);
    }

    @Override
    public int saveActivity(Activity activity) {
        return activityDao.saveActivity(activity);
    }

    @Override
    public int updateActivity(Activity activity) {
        return activityDao.updateActivity(activity);
    }

    @Override
    public int updateActivityState(Integer actiId, Integer actiState) {
        return activityDao.updateActivityState(actiId, actiState);
    }

    @Override
    public int deleteActivity(Integer actiId) {
        return activityDao.deleteActivity(actiId);
    }

    @Override
    public List<Activity> getActivityByCity(String actiCity) {
        return activityDao.selectActivityByCity(actiCity);
    }

    @Override
    public int getNo4PeopleByActivity(Integer actiId){
        return activityDao.selectNo4PeopleByActivity(actiId);
    }

    @Override
    public Integer getCount() {
        return this.activityDao.selectCount();
    }

    @Override
    public Integer getCountByCity(String actiCity){
        return this.activityDao.selectCountByCity(actiCity);
    }

    @Override
    public int getStateByActivity(Integer actiId){
        return activityDao.selectStateByActivity(actiId);
    }

    @Override
    public List<Customer> getPhotoByActivity(Integer actiId){
        return activityDao.selectPhotoByActivity(actiId);
    }


    /*分页*/
    @Override
    public PageModel<Activity> getAllActivityByPage(PageModel<Activity> page) {
        List<Activity> activityList = this.activityDao.selectAllActivityByPage(page);
        page.setModelList(activityList);
        return page;
    }

    @Override
    public PageModel<Activity> getActivityByPage(PageModel<Activity> page, String actiCity) {
        List<Activity> activityList = this.activityDao.selectActivityByPage(page,actiCity);
        page.setModelList(activityList);
        return page;
    }

    @Override
    public List<Integer> getStateCount() {
        return activityDao.selectStateCount();
    }

    @Override
    public List<Integer> getStateCountByCity(String actiCity) {
        return activityDao.selectStateCountByCity(actiCity);
    }
}
