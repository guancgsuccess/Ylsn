package com.chixing.controller;

import com.chixing.entity.Customer;
import com.chixing.entity.Requirement;
import com.chixing.service.CustomerService;
import com.chixing.service.RequirementService;
import com.chixing.util.PageModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@RestController
@RequestMapping("/search")
public class SearchController {
    public SearchController() {
        System.out.println("SearchController constructor....");
    }

    @Autowired
    private RequirementService requirementService;
    @Autowired
    private CustomerService customerService;

    @GetMapping(value="load")
    public ModelAndView load(Integer pagecode, HttpServletRequest request){
        PageModel<Customer> page =  new PageModel<>();
        ModelAndView mav = new ModelAndView();
        Integer custId=(Integer)request.getSession().getAttribute("custId");
        Requirement requirement=requirementService.getRequirementByCustId(custId,request);
        String requPhoto="有照片";
        if(requirement.getRequHasPhoto()==0)
            requPhoto="无照片";
        String md="all";
        page.setPageSize(20);
        page.setStartRecord(0);
        page.setTotalRecord(customerService.getCountCustomerByDynamic(requirement,md));
        page.setTotalPages(page.getTotalRecord()%page.getPageSize() ==0?page.getTotalRecord()/page.getPageSize() :page.getTotalRecord()/page.getPageSize() +1);
        page=customerService.getCustomerByDynamic(requirement,md,page);
        mav.addObject("requPhoto",requPhoto);
        mav.addObject("requirement",requirement);
        mav.addObject("page",page);
        mav.setViewName("search");
        return mav;
    }

    @PostMapping(value="condition")
    public PageModel<Customer> condition(Integer pagecode,HttpServletRequest request, String xb, String dq, String nl, String sg, String zp, String hs, String xl, String yx, String mz, String xx, String sx, String xz, String md){
        PageModel<Customer> page =  new PageModel<>();
        if(pagecode == null){//首页
            page.setCurrentPageCode(1);
        }else{
            page.setCurrentPageCode(pagecode);
        }
        HttpSession session=request.getSession();
        Integer custId= (Integer) session.getAttribute("custId");
        Requirement requirement=requirementService.getRequirementByCondition(custId,xb,dq,nl,sg,zp,hs,xl,yx,mz,xx,sx,xz);
        page.setPageSize(20);
        page.setTotalRecord(customerService.getCountCustomerByDynamic(requirement,md));
        page.setTotalPages(page.getTotalRecord()%page.getPageSize() ==0?page.getTotalRecord()/page.getPageSize() :page.getTotalRecord()/page.getPageSize() +1);
        page.setStartRecord((page.getCurrentPageCode()-1) * page.getPageSize());
        page = customerService.getCustomerByDynamic(requirement,md,page);
        return page;
    }
}
