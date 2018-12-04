package com.chixing.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public class Login  implements Serializable {
    private Integer loginId;
    private Date loginTime;
    private String loginIp;
    private Integer custId;

    public Login() {
    }
}
