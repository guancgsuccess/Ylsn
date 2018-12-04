package com.chixing.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public class LoginBean  implements Serializable {
    private Integer custId;
    private String custPhone;
    private String custPassword;
    private Date loginTime;
    private String loginIp;

    public LoginBean() {
    }
}
