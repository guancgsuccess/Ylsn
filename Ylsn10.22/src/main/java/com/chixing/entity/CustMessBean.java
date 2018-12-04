package com.chixing.entity;

import java.io.Serializable;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class CustMessBean  implements Serializable {
    private Integer custId;
    private String custPhoto;
    private String custNickname;
    private Date custBirthday;
    private String custMarriage;
    private String custProvince;
    private Integer custHeight;
    private Date messTime;//信件发送的时间
    private Integer countMsg;//统计一个人发送的信件数

    public CustMessBean() {
    }

    public CustMessBean(Integer custId, String custPhoto, String custNickname, Date custBirthday, String custMarriage, String custProvince, Integer custHeight, Date messTime, Integer countMsg, Integer messFromId) {
        this.custId = custId;
        this.custPhoto = custPhoto;
        this.custNickname = custNickname;
        this.custBirthday = custBirthday;
        this.custMarriage = custMarriage;
        this.custProvince = custProvince;
        this.custHeight = custHeight;
        this.messTime = messTime;
        this.countMsg = countMsg;
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

    public String getCustNickname() {
        return custNickname;
    }

    public void setCustNickname(String custNickname) {
        this.custNickname = custNickname;
    }

    public String getCustBirthday() {
        DateFormat df=new SimpleDateFormat("yyyy-MM-dd");
        String strBirthDate=df.format(custBirthday);
//System.out.println(strBirthDate);
        //读取当前日期
        Calendar c = Calendar.getInstance();
        int year = c.get(Calendar.YEAR);
        int month = c.get(Calendar.MONTH)+1;
        int day = c.get(Calendar.DATE);
//        System.out.println("year"+year+"month"+month+"day"+day);
        //计算年龄
        int age = year - Integer.parseInt(strBirthDate.substring(0, 4)) - 1;
//        System.out.println(age);
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

    public String getCustMarriage() {
        return custMarriage;
    }

    public void setCustMarriage(String custMarriage) {
        this.custMarriage = custMarriage;
    }

    public String getCustProvince() {
        return custProvince;
    }

    public void setCustProvince(String custProvince) {
        this.custProvince = custProvince;
    }

    public Integer getCustHeight() {
        return custHeight;
    }

    public void setCustHeight(Integer custHeight) {
        this.custHeight = custHeight;
    }

    public String getMessTime() {
        DateFormat df=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String result=df.format(messTime);
        return result;
    }

    public void setMessTime(Date messTime) {
        this.messTime = messTime;
    }

    public Integer getCountMsg() {
        return countMsg;
    }

    public void setCountMsg(Integer countMsg) {
        this.countMsg = countMsg;
    }

    @Override
    public String toString() {
        return "CustMessBean{" +
                "custId=" + custId +
                ", custPhoto='" + custPhoto + '\'' +
                ", custNickname='" + custNickname + '\'' +
                ", custBirthday=" + custBirthday +
                ", custMarriage='" + custMarriage + '\'' +
                ", custProvince='" + custProvince + '\'' +
                ", custHeight=" + custHeight +
                ", messTime=" + messTime +
                ", countMsg=" + countMsg +
                '}';
    }
}
