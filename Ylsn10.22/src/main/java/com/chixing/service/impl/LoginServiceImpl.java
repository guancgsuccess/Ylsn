package com.chixing.service.impl;

import com.chixing.dao.LoginDao;
import com.chixing.entity.Login;
import com.chixing.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class LoginServiceImpl implements LoginService {
    @Autowired
    private LoginDao loginDao;

    @Override
    public Login getRecentLoginByCustId(Integer custId) {
        return loginDao.selectRecentLoginByCustId(custId);
    }

    @Override
    public int getLoginCount() {
        return loginDao.selectLoginCount();
    }

    @Override
    public int saveLogin(Login login) {
        return loginDao.addLogin(login);
    }

    @Override
    public int deleteUser() {
        return loginDao.deleteUser();
    }

    @Override
    public Date getLoginTimeByCustId(Integer custId) {
        return this.loginDao.selectLoginTimeByCustId(custId);
    }
}
