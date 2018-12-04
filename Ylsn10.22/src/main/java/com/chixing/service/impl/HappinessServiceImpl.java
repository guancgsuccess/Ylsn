package com.chixing.service.impl;

import com.chixing.dao.CustomerDao;
import com.chixing.dao.HappinessDao;

import com.chixing.entity.Customer;
import com.chixing.entity.Happiness;
import com.chixing.service.HappinessService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

@Service
public class HappinessServiceImpl implements HappinessService {
    @Autowired
    private HappinessDao happinessDao;
    @Autowired
    private CustomerDao customerDao;

    @Override
    public Happiness getHappinessById(Integer custId) {
        return happinessDao.selectHappinessById(custId);
    }

    @Override
    public Happiness getHappinessByName(String happOtherName) {
        return happinessDao.selectHappinessByName(happOtherName);
    }

    @Override
    public int getCountHappiness() {
        return happinessDao.selectCountHappiness();
    }

    @Override
    public int saveHappiness(Happiness happiness) {
        return happinessDao.addHappiness(happiness);
    }

    @Override
    public int deleteHappiness(Integer happId) {
        return happinessDao.deleteHappiness(happId);
    }

    @Override
    @Transactional
    public Happiness getHappinessByPhone(String custPhone) {
        Happiness happiness=happinessDao.selectHappinessByPhone(custPhone);
        if(happiness==null)
            return null;
        Customer customer=customerDao.selectCustomerById(happiness.getCustId());
        happiness.setHappImages(customer.getCustNickname());
        return happiness;
    }

    @Override
    @Transactional
    public Integer uploadCheck(Integer custId, String nickname) {
        Happiness happiness=happinessDao.selectHappinessById(custId);
        Customer customer1=customerDao.selectCustomerById(custId);
        Happiness happiness3=happinessDao.selectHappinessByName(customer1.getCustNickname());
        Happiness happiness1=happinessDao.selectHappinessByName(nickname);
        Customer customer=customerDao.selectCustomerByNickname(nickname);
        Happiness happiness2;
        if(customer!=null)
            happiness2=happinessDao.selectHappinessById(customer.getCustId());
        else
            return 2;
        if(happiness!=null||happiness1!=null||happiness2!=null||happiness3!=null)
            return 1;
        return 0;
    }

    @Override
    public boolean changImgType(String srcPath,String targetPath,String type) {

        BufferedImage bufferedImage;
        File file=new File(srcPath);
        String path=targetPath+"\\"+file.getName().split("\\.")[0]+type;
        try {

            //1.读取图片
            bufferedImage = ImageIO.read(file);

            //2.创建一个空白大小相同的RGB背景
            BufferedImage newBufferedImage = new BufferedImage(bufferedImage.getWidth(),
                    bufferedImage.getHeight(), BufferedImage.TYPE_INT_RGB);
            newBufferedImage.createGraphics().drawImage(bufferedImage, 0, 0, Color.WHITE, null);

            //3.再次写入的时候以jpeg图片格式
            ImageIO.write(newBufferedImage, type.replace(".","").trim(), new File(path));
            System.out.println("成功将png格式图片转换为jpg格式");
            return true;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    @Transactional
    public Happiness getHappinessByHappId(Integer happId) {
        Happiness happiness=happinessDao.selectHappinessByHappId(happId);
        Customer customer=customerDao.selectCustomerById(happiness.getCustId());
        happiness.setHappOtherName(happiness.getHappOtherName()+","+customer.getCustNickname());
        return happiness;
    }
}
