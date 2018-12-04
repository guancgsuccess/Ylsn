package com.chixing.entity;

import lombok.Data;

import java.io.Serializable;

@Data
public class LoginProcessBean  implements Serializable {
    private LoginBean loginBean;
    private Integer loginStatus;
    private String loginMessage;

    public LoginProcessBean() {
    }
}
