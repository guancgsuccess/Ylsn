package com.chixing.service;

import com.chixing.entity.Activity;
import com.chixing.entity.Customer;
import com.chixing.util.PageModel;

import java.util.List;

public interface ActivityService {
    List<Activity> getAllActivi();

    Activity getActivityById(Integer actiId);

    int saveActivity(Activity activity);

    int updateActivity(Activity activity);

    int updateActivityState(Integer actiId,Integer actiState);

    int deleteActivity(Integer actiId);

    List<Activity> getActivityByCity(String actiCity);

    int getNo4PeopleByActivity(Integer actiId);

    int getStateByActivity(Integer actiId);

    List<Customer> getPhotoByActivity(Integer actiId);

    public Integer getCount();

    public PageModel<Activity> getAllActivityByPage(PageModel<Activity> page);

    public Integer getCountByCity(String actiCity);

    public PageModel<Activity> getActivityByPage(PageModel<Activity> page,String actiCity);

    public List<Integer> getStateCount();

    public List<Integer> getStateCountByCity(String actiCity);
}
