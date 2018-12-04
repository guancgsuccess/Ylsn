package com.chixing;

import com.chixing.entity.Requirement;
import com.chixing.service.RequirementService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class RequirementServiceTest {
    @Autowired
    private RequirementService requirementService;

    /*@Test
    public void getRequirement(){
        Requirement requirement = requirementService.getRequirementByCustId(1);
        System.out.println(requirement);
    }*/

    /*@Test
    public void save(){
        Requirement requirement = new Requirement();
        requirement.setRequGender("男");
        requirement.setRequMinAge(40);
        requirement.setRequMaxAge(99);
        requirement.setRequProvince("不限");
        requirement.setRequCity("不限");
        requirement.setRequMinHeight(100);
        requirement.setRequMaxHeight(140);
        requirement.setRequMarriage("离异");
        requirement.setRequEducation("小学");
        requirement.setRequIncome(1);
        requirement.setRequHasPhoto(0);
        requirement.setCustId(7);
        int rows = requirementService.saveRequirement(requirement);
        System.out.println(rows);
    }*/

    /*@Test
    public void update(){
        Requirement requirement = new Requirement();
        requirement.setRequGender("男");
        requirement.setRequMinAge(40);
        requirement.setRequMaxAge(99);
        requirement.setRequProvince("不限");
        requirement.setRequCity("不限");
        requirement.setRequMinHeight(100);
        requirement.setRequMaxHeight(140);
        requirement.setRequMarriage("离异");
        requirement.setRequEducation("小学");
        requirement.setRequIncome(100);
        requirement.setRequHasPhoto(0);
        requirement.setCustId(7);
        int rows = requirementService.updateRequirement(requirement);
        System.out.println(rows);
    }*/
}
