package com.chixing.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public class Message  implements Serializable {
    private Integer messId;
    private String messContent;
    private Date messTime;
    private Integer messFromId;
    private Integer messToId;
    private Integer messState;

    public Message() {
    }
}
