package com.chixing;

import com.chixing.entity.Login;
import com.chixing.service.LoginService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class LoginServiceTest {
    @Autowired
    private LoginService loginService;

    @Test
    public void getRecentLoginByCustId(){
        Login login=loginService.getRecentLoginByCustId(1);
        System.out.println(login);
    }

    @Test
    public void getLoginCount(){
        int count=loginService.getLoginCount();
        System.out.println(count);
    }

    @Test
    public void saveLogin(){
        Login login=new Login();
        login.setLoginIp("192.168.1.255");
        login.setCustId(4);
        int rows=loginService.saveLogin(login);
        System.out.println(rows);
    }

    @Test
    public void deleteUser(){
        int rows=loginService.deleteUser();
        System.out.println(rows);
    }
}
