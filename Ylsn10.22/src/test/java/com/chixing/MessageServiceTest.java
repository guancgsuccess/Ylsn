package com.chixing;

import com.chixing.entity.Message;
import com.chixing.service.MessageService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class MessageServiceTest {
    @Autowired
    private MessageService messageService;

    @Test
    public void getMessage(){
        List<Message> messageList = messageService.getMessageById(1,5);
        for (Message message : messageList) {
            System.out.println(message);
        }
    }

    @Test
    public void save(){
        Message message = new Message();
        message.setMessContent("hey");
        message.setMessFromId(1);
        message.setMessToId(2);
        int rows = messageService.saveMessage(message);
        System.out.println(rows);
    }
}
