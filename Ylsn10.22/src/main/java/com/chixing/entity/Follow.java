package com.chixing.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public class Follow  implements Serializable {
    private Integer custIdInitiative;
    private Integer custIdUnactive;
    private Date followTime;

    public Follow() {
    }
}
