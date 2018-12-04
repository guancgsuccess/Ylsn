package com.chixing.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public class Customer  implements Serializable {
    private Integer custId;
    private String custPhone;
    private String custPassword;
    private Date custCreateTime;
    private String custNickname;
    private String custGender;
    private Date custBirthday;
    private String custProvince;
    private String custCity;
    private Integer custHeight;
    private String custEducation;
    private String custIncome;
    private String custMarriage;
    private Integer custType;
    private String custPhoto;
    private Integer custDayVisitCount;
    private Integer custWeekVisitCount;
    private Integer custMonthVisitCount;
    private Integer custTotalVisitCount;
    private String custWeight;
    private String custProFession;
    private String custNation;
    private String custBloodType;
    private String custZodiac;
    private String custConstellation;
    private String custHobby;
    private String custIntroduce;
    private Integer custMeetCount;
    private Integer custLikeNumber;
    private Integer custState;

    public Customer() {
    }

    public Customer(String custPhone, String custPassword, String custNickname, String custGender, Date custBirthday, String custProvince, String custCity, Integer custHeight, String custEducation, String custIncome, String custMarriage) {
        this.custPhone = custPhone;
        this.custPassword = custPassword;
        this.custNickname = custNickname;
        this.custGender = custGender;

        this.custBirthday = custBirthday;
        this.custProvince = custProvince;
        this.custCity = custCity;
        this.custHeight = custHeight;
        this.custEducation = custEducation;
        this.custIncome = custIncome;
        this.custMarriage = custMarriage;
    }

    public Customer(String custPhone, String custPassword, Date custCreateTime, String custNickname, String custGender, Date custBirthday, String custProvince, String custCity, Integer custHeight, String custEducation, String custIncome, String custMarriage) {
        this.custPhone = custPhone;
        this.custPassword = custPassword;
        this.custCreateTime = custCreateTime;
        this.custNickname = custNickname;
        this.custGender = custGender;
        this.custBirthday = custBirthday;
        this.custProvince = custProvince;
        this.custCity = custCity;
        this.custHeight = custHeight;
        this.custEducation = custEducation;
        this.custIncome = custIncome;
        this.custMarriage = custMarriage;
    }

    public Customer(Integer custId, String custPhone, String custPassword, Date custCreateTime, String custNickname, String custGender, Date custBirthday, String custProvince, String custCity, Integer custHeight, String custEducation, String custIncome, String custMarriage, Integer custType, String custPhoto, Integer custDayVisitCount, Integer custWeekVisitCount, Integer custMonthVisitCount, Integer custTotalVisitCount, String custWeight, String custProFession, String custNation, String custBloodType, String custZodiac, String custConstellation, String custHobby, String custIntroduce, Integer custState, Date messTime, Integer countMsg) {
        this.custId = custId;
        this.custPhone = custPhone;
        this.custPassword = custPassword;
        this.custCreateTime = custCreateTime;
        this.custNickname = custNickname;
        this.custGender = custGender;
        this.custBirthday = custBirthday;
        this.custProvince = custProvince;
        this.custCity = custCity;
        this.custHeight = custHeight;
        this.custEducation = custEducation;
        this.custIncome = custIncome;
        this.custMarriage = custMarriage;
        this.custType = custType;
        this.custPhoto = custPhoto;
        this.custDayVisitCount = custDayVisitCount;
        this.custWeekVisitCount = custWeekVisitCount;
        this.custMonthVisitCount = custMonthVisitCount;
        this.custTotalVisitCount = custTotalVisitCount;
        this.custWeight = custWeight;
        this.custProFession = custProFession;
        this.custNation = custNation;
        this.custBloodType = custBloodType;
        this.custZodiac = custZodiac;
        this.custConstellation = custConstellation;
        this.custHobby = custHobby;
        this.custIntroduce = custIntroduce;
        this.custState = custState;
    }
}
