package com.chixing.controller;

import com.chixing.entity.Requirement;
import com.chixing.service.RequirementService;
import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;

@RestController
@RequestMapping("/requirement")
public class RequirementController {
    public RequirementController(){
        System.out.println("RequirementController constructor....");
    }
    @Autowired
    private RequirementService requirementService;
    //获得择友条件
    @GetMapping("getRequirement")
    public Requirement getRequirementByCustId(HttpSession session){
        Integer custId=(Integer)session.getAttribute("custId");
        Requirement requirement = this.requirementService.getRealRequirementByCustId(custId);
        return requirement;
    }
    //修改择友条件
    @PostMapping("updateRequirement")
    public int updateRequirement(Requirement requirement){
        int result = this.requirementService.updateRequirement(requirement);
        return result;
    }
}
