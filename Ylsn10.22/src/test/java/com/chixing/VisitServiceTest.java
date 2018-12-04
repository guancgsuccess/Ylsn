package com.chixing;

import com.chixing.entity.Customer;
import com.chixing.entity.Visit;
import com.chixing.service.VisitService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.Date;
import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class VisitServiceTest {
    @Autowired
    private VisitService visitService;

    @Test
    public void getVisitByVisitId(){
        List<Customer> customers = visitService.getVisitByVisitId(4);
        for (Customer customer : customers) {
            System.out.println(customer);
        }
    }

    /*@Test
    public void getVisitById(){
        List<Customer> customers = visitService.getVisitById(1);
        for (Customer customer : customers) {
            System.out.println(customer);
        }
    }*/

    @Test
    public void getLastTime(){
        Date date = visitService.getLastTime(1,7);
        System.out.println(date);
    }

    @Test
    public void getHasVisited(){
        int count=visitService.getHasVisited(1,8);
        System.out.println(count);
    }

    @Test
    public void saveVisit(){
        Visit visit = new Visit();
        visit.setCustId(1);
        visit.setCustVisitId(7);
        int rows = visitService.saveVisit(visit);
        System.out.println(rows);
    }

    @Test
    public void updateVisit(){
        Visit visit = new Visit();
        visit.setCustId(1);
        visit.setCustVisitId(7);
        visit.setVisitDate(new Date());
        int rows = visitService.updateVisit(visit);
        System.out.println(rows);
    }
    @Test
    public void  test(){
        String str1="hello";
        String str2="he"+new String("llo");
        System.out.println(str1+"-----------"+str2);
    }
}
