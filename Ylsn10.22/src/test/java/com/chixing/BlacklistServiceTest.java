package com.chixing;

import com.chixing.entity.Customer;
import com.chixing.service.BlacklistService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class BlacklistServiceTest {
    @Autowired
    private BlacklistService blacklistService;

    @Test
    public void testSelectBlacklistById(){
        List<Customer> list=blacklistService.getBlacklistById(1);
        for (Customer customer : list) {
            System.out.println(customer);
        }
    }

    @Test
    public void testAddBlacklist(){
        int rows=blacklistService.saveBlacklist(3,4);
        System.out.println(rows);
    }

    @Test
    public void testDeleteBlacklist(){
        int rows=blacklistService.deleteBlacklist(3,4);
        System.out.println(rows);
    }
}
