package com.chixing.service;

import com.chixing.entity.Activity;
import com.chixing.entity.Customer;
import com.chixing.util.PageModel;

import java.util.List;

public interface CustActivityService {
    List<Activity> getCustActiByCustId(Integer custId);

    List<Customer> getCustActiByActiId(Integer actiId);

    List<Customer> getmaleCountCustActi(Integer actiId);

    List<Customer> getfemaleCountCustActi(Integer actiId);

    Integer getmaleCountActiId(Integer actiId);

    Integer getfemaleCountActiId(Integer actiId);

    Integer getCountActiId(Integer actiId);

    Integer getIsSignup(Integer custId, Integer actiId);

    int saveCustActivity(Integer custId, Integer actiId);

    PageModel<Customer> getCustActiByPage(Integer actiId,PageModel<Customer> page);

    PageModel<Customer> getmaleCountCustActiByPage(Integer actiId,PageModel<Customer> page);

    PageModel<Customer> getfemaleCountCustActiByPage(Integer actiId,PageModel<Customer> page);
}
