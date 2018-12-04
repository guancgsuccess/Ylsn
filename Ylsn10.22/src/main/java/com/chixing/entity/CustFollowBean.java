package com.chixing.entity;

import java.io.Serializable;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class CustFollowBean  implements Serializable {
    private Integer custId;
    private String custPhoto;
    private String custNickname;
    private Date custBirthday;
    private String custProvince;
    private String custEducation;
    private Integer custHeight;
    private String custCity;

    public CustFollowBean() {
    }

    public CustFollowBean(Integer custId, String custPhoto, String custNickname, Date custBirthday, String custProvince, String custEducation, Integer custHeight, String custCity) {
        this.custId = custId;
        this.custPhoto = custPhoto;
        this.custNickname = custNickname;
        this.custBirthday = custBirthday;
        this.custProvince = custProvince;
        this.custEducation = custEducation;
        this.custHeight = custHeight;
        this.custCity = custCity;
    }

    public Integer getCustId() {
        return custId;
    }

    public void setCustId(Integer custId) {
        this.custId = custId;
    }

    public String getCustPhoto() {
        return custPhoto;
    }

    public void setCustPhoto(String custPhoto) {
        this.custPhoto = custPhoto;
    }

    public String getCustBirthday(){
        DateFormat df=new SimpleDateFormat("yyyy-MM-dd");
        String strBirthDate=df.format(custBirthday);
        Calendar c = Calendar.getInstance();
        int year = c.get(Calendar.YEAR);
        int month = c.get(Calendar.MONTH)+1;
        int day = c.get(Calendar.DATE);
        int age = year - Integer.parseInt(strBirthDate.substring(0, 4)) - 1;
        if (Integer.parseInt(strBirthDate.substring(5,7)) < month) {
            age++;
        } else if (Integer.parseInt(strBirthDate.substring(5,7))== month && Integer.parseInt(strBirthDate.substring(8,10)) <= day){
            age++;
        }
        return String.valueOf(age);
    }

    public void setCustBirthday(Date custBirthday) {
        this.custBirthday = custBirthday;
    }

    public String getCustProvince() {
        return custProvince;
    }

    public void setCustProvince(String custProvince) {
        this.custProvince = custProvince;
    }

    public String getCustEducation() {
        return custEducation;
    }

    public void setCustEducation(String custEducation) {
        this.custEducation = custEducation;
    }

    public Integer getCustHeight() {
        return custHeight;
    }

    public void setCustHeight(Integer custHeight) {
        this.custHeight = custHeight;
    }

    public String getCustNickname() {
        return custNickname;
    }

    public void setCustNickname(String custNickname) {
        this.custNickname = custNickname;
    }

    public String getCustCity() {
        return custCity;
    }

    public void setCustCity(String custCity) {
        this.custCity = custCity;
    }

    @Override
    public String toString() {
        return "CustFollowBean{" +
                "custId=" + custId +
                ", custPhoto='" + custPhoto + '\'' +
                ", custNickname='" + custNickname + '\'' +
                ", custBirthday=" + custBirthday +
                ", custProvince='" + custProvince + '\'' +
                ", custEducation='" + custEducation + '\'' +
                ", custHeight=" + custHeight +
                ", custCity='" + custCity + '\'' +
                '}';
    }
}
