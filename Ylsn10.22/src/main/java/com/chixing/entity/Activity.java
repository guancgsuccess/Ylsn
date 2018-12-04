package com.chixing.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public class Activity implements Serializable{
    private Integer actiId;
    private String actiTitle;
    private String actiCity;
    private Date actiDate;
    private String actiTime;
    private String actiPlace;
    private Integer actiCount;
    private String actiImages;
    private Integer actiState;
    private String actiIntroduction;

    public Activity() {
    }
}
