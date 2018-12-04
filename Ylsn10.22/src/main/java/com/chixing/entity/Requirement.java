package com.chixing.entity;

import lombok.Data;

import java.io.Serializable;

@Data
public class Requirement  implements Serializable {
    private Integer requId;
    private String requGender;
    private Integer requMinAge;
    private Integer requMaxAge;
    private String requProvince;
    private String requCity;
    private Integer requMinHeight;
    private Integer requMaxHeight;
    private String requMarriage;
    private String requEducation;
    private String requIncome;
    private String requNation;
    private String requBloodType;
    private String requZodiac;
    private String requConstellation;
    private Integer requHasPhoto;
    private Integer custId;

    public Requirement() {
    }
}
