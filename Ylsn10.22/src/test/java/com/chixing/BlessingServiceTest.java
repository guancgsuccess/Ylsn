package com.chixing;

import com.chixing.entity.Customer;
import com.chixing.service.BlessingService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class BlessingServiceTest {
    @Autowired
    private BlessingService blessingService;

    @Test
    public void testSelectBlessingById(){
        int count=blessingService.getCountBlessing(1);
        System.out.println(count);
    }

    @Test
    public void testSelectBlessingByHappId(){
        List<Customer> customerList=blessingService.getBlessingByHappId(1);
        for (Customer customer : customerList) {
            System.out.println(customer);
        }
    }

    @Test
    public void testAddBlessing(){
        int rows=blessingService.saveBlessing(2,5);
        System.out.println(rows);
    }

    @Test
    public void testSelectBlessing(){
        int count=blessingService.getBlessing(2,5);
        System.out.println(count);
    }

    @Test
    public void testDeleteBlessing(){
        int rows=blessingService.deleteBlessing(2,5);
        System.out.println(rows);
    }
}
