package com.chixing;

import com.chixing.entity.Happiness;
import com.chixing.service.HappinessService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.Date;

@RunWith(SpringRunner.class)
@SpringBootTest
public class HappinessServiceTest {
    @Autowired
    private HappinessService happinessService;

    @Test
    public void testSelectHappinessById(){
        Happiness happiness=happinessService.getHappinessById(1);
        System.out.println(happiness);
    }

    @Test
    public void testSelectHappinessByName(){
        Happiness happiness=happinessService.getHappinessByName("王化坤");
        System.out.println(happiness);
    }

    @Test
    public void testSelectCountHappiness(){
        int count=happinessService.getCountHappiness();
        System.out.println(count);
    }

    @Test
    public void testAddHappiness(){
        Happiness happiness= new Happiness();
        happiness.setHappOtherName("姚衎");
        happiness.setHappState(0);
        happiness.setHappTitle("我们上床了");
        happiness.setHappContent("666666");
        happiness.setHappImages("xxoo.jpg");
        happiness.setCustId(2);
        int rows=happinessService.saveHappiness(happiness);
        System.out.println(rows);
    }

    @Test
    public void testDeleteHappiness(){
        int rows=happinessService.deleteHappiness(3);
        System.out.println(rows);
    }
}
