package com.chixing.service;

import com.chixing.entity.Requirement;

import javax.servlet.http.HttpServletRequest;

public interface RequirementService {
    Requirement getRequirementByCustId(int custId, HttpServletRequest request);

    Requirement getRequirementByCondition(Integer custId,String xb,String dq,String nl,String sg,String zp,String hs,String xl,String yx,String mz,String xx,String sx,String xz);

    int saveRequirement(Requirement requirement);

    int updateRequirement(Requirement requirement);

    Requirement getRealRequirementByCustId(int custId);
}
