package com.chixing.service.impl;

import com.chixing.dao.CustomerDao;
import com.chixing.dao.RequirementDao;
import com.chixing.entity.Customer;
import com.chixing.entity.Requirement;
import com.chixing.service.RequirementService;
import com.chixing.util.IPAnalyse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.util.Calendar;
import java.util.Map;

@Service
public class RequirementServiceImpl implements RequirementService {
    @Autowired
    private RequirementDao requirementDao;
    @Autowired
    private CustomerDao customerDao;

    @Override
    @Transactional
    public Requirement getRequirementByCustId(int custId, HttpServletRequest request) {
        Customer customer=customerDao.selectCustomerById(custId);
        Requirement requirement=requirementDao.selectRequirementByCustId(custId);
        if(requirement.getRequGender()==null||requirement.getRequGender().equals("不限")) {
            if (customer.getCustGender().equals("女"))
                requirement.setRequGender("男");
            else
                requirement.setRequGender("女");
        }
        if(requirement.getRequProvince()==null){
            Map<String,String> map=IPAnalyse.getAddress("58.211.151.194");//根据用户请求获取所在地 改为下面一行代码
            /*Map<String,String> map=IPAnalyse.getAddress(IPAnalyse.getIp(request));*/
            requirement.setRequProvince(map.get("province").substring(0,2));
            requirement.setRequCity(map.get("city").substring(0,2));
        }
        Calendar cal = Calendar.getInstance();
        int yearNow=cal.get(Calendar.YEAR);
        cal.setTime(customer.getCustBirthday());
        int yearBirthday=cal.get(Calendar.YEAR);
        int age=yearNow-yearBirthday;
        if(requirement.getRequMinAge()==1){
            requirement.setRequMinAge(age-5);
        }
        if(requirement.getRequMaxAge()==100){
            requirement.setRequMaxAge(age+5);
        }
        if(requirement.getRequMinHeight()==null||requirement.getRequMinHeight()==0){
            if(customer.getCustGender().equals("女"))
                requirement.setRequMinHeight(165);
            else
                requirement.setRequMinHeight(155);
        }
        if(requirement.getRequMaxHeight()==null||requirement.getRequMaxHeight()==999){
            if(customer.getCustGender().equals("女"))
                requirement.setRequMaxHeight(185);
            else
                requirement.setRequMaxHeight(175);
        }
        if(requirement.getRequHasPhoto()==null)
            requirement.setRequHasPhoto(1);
        requirement.setRequMarriage(null);
        requirement.setRequEducation(null);
        requirement.setRequIncome(null);
        requirement.setRequNation(null);
        requirement.setRequBloodType(null);
        requirement.setRequZodiac(null);
        requirement.setRequConstellation(null);
        return requirement;
    }

    @Override
    public Requirement getRequirementByCondition(Integer custId,String xb, String dq, String nl, String sg, String zp, String hs, String xl, String yx, String mz, String xx, String sx, String xz) {
        Requirement requirement=new Requirement();
        requirement.setCustId(custId);
        if(!xb.equals("性别"))
            requirement.setRequGender(xb);
        if(!dq.equals("地区")) {
            String[] add=dq.split("-");
            requirement.setRequProvince(add[0].substring(4));
            requirement.setRequCity(add[1]);
        }
        if(!nl.equals("年龄")) {
            requirement.setRequMinAge(Integer.parseInt(nl.substring(0,2)));
            if(nl.substring(2,3).equals("岁"))
                requirement.setRequMaxAge(100);
            else
                requirement.setRequMaxAge(Integer.parseInt(nl.substring(3,5)));
        }
        if(!sg.equals("身高")){
            requirement.setRequMinHeight(Integer.parseInt(sg.substring(0,3)));
            if(sg.substring(3,5).equals("厘米"))
                requirement.setRequMaxHeight(999);
            else
                requirement.setRequMaxHeight(Integer.parseInt(sg.substring(4,7)));
        }
        if(!zp.equals("照片"))
            requirement.setRequHasPhoto(1);
        if(!hs.equals("婚史")){
            requirement.setRequMarriage(hs);
        }
        if(!xl.equals("学历")){
            requirement.setRequEducation(xl);
        }
        if(!yx.equals("月薪"))
            requirement.setRequIncome(yx);
        if(!mz.equals("民族")&&!mz.equals("其它"))
            requirement.setRequNation(mz);
        if(!xx.equals("血型"))
            requirement.setRequBloodType(xx);
        if(!sx.equals("生肖")) {
            requirement.setRequZodiac(sx);
        }
        if(!xz.equals("星座")){
            /*String[] strings=xz.split(",");
            String con="";
            for (String s : strings) {
                con+="'"+s+"'"+",";
            }
            requirement.setRequConstellation(con.substring(1,con.length()-2));*/
            requirement.setRequConstellation(xz);
            System.out.println(requirement.getRequConstellation());
        }
        return requirement;
    }

    @Override
    public int saveRequirement(Requirement requirement) {
        return requirementDao.insertRequirement(requirement);
    }

    @Override
    public int updateRequirement(Requirement requirement) {
        return requirementDao.updateRequirement(requirement);
    }

    @Override
    public Requirement getRealRequirementByCustId(int custId) {
        return requirementDao.selectRealRequirement(custId);
    }
}
