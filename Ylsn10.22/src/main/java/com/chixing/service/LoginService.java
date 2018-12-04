package com.chixing.service;

import com.chixing.entity.Login;

import java.util.Date;

public interface LoginService {
    Login getRecentLoginByCustId(Integer custId);

    int getLoginCount();

    int saveLogin(Login login);

    int deleteUser();

    Date getLoginTimeByCustId(Integer custId);
}
