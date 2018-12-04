package com.chixing.service;

import com.chixing.entity.Happiness;

import javax.servlet.http.HttpSession;

public interface HappinessService {
    Happiness getHappinessById(Integer custId);

    Happiness getHappinessByName(String happOtherName);

    int getCountHappiness();

    int saveHappiness(Happiness happiness);

    int deleteHappiness(Integer happId);

    Integer uploadCheck(Integer custId,String nickname);

    boolean changImgType(String srcPath,String targetPath,String type);

    Happiness getHappinessByPhone(String custPhone);

    Happiness getHappinessByHappId(Integer happId);
}
