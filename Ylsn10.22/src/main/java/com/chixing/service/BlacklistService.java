package com.chixing.service;

import com.chixing.entity.Customer;
import com.chixing.util.PageModel;

import java.util.List;

public interface BlacklistService {
    List<Customer> getBlacklistById(Integer custId);

    int saveBlacklist(Integer custId,Integer custBlackId);

    int deleteBlacklist(Integer custId,Integer custBlackId);

    Integer getCountOfBlacklistByCustId(Integer custId);

    PageModel<Customer> getBlacklistMsgByPage(PageModel<Customer> page, Integer custId);
}
