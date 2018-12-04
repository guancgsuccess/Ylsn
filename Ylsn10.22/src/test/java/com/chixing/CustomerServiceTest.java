package com.chixing;

import com.chixing.entity.Customer;
import com.chixing.service.CustomerService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class CustomerServiceTest {
    @Autowired
    private CustomerService customerService;

    @Test
    public void getCustomerByPhone(){
        Customer customer=customerService.getCustomerByPhone("138426407351");
        System.out.println(customer);
    }

    /*@Test
    public void getCustomerByPhoneAndPassword(){
        Customer customer=customerService.getCustomerByPhoneAndPassword("13842640735","123456");
        System.out.println(customer);
    }*/

    @Test
    public void getCustomerCount(){
        int count=customerService.getCustomerCount();
        System.out.println(count);
    }

    @Test
    public void saveCustomer() throws ParseException{
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Customer customer=new Customer();
        customer.setCustPhone("17034561018");
        customer.setCustPassword("1111");
        customer.setCustNickname("龙舌兰");
        customer.setCustGender("女");
        customer.setCustBirthday(sdf.parse("1987-9-1"));
        customer.setCustProvince("北京");
        customer.setCustCity("北京");
        customer.setCustHeight(170);
        customer.setCustEducation("大学");
        customer.setCustIncome("10000");
        customer.setCustMarriage("未婚");
        int rows=customerService.saveCustomer(customer);
        System.out.println(rows);
    }

    @Test
    public void updateCustomerPassword(){
        int rows=customerService.updateCustomerPassword("13945198842","0000");
        System.out.println(rows);
    }

    @Test
    public void updateCustomerPhoto(){
        int rows=customerService.updateCustomerPhoto("13945198842","lj.jpg");
        System.out.println(rows);
    }

    @Test
    public void deleteUser(){
        int rows=customerService.deleteUser("13945198842",2);
        System.out.println(rows);
    }
}
