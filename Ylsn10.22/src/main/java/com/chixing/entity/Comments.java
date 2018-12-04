package com.chixing.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public class Comments  implements Serializable {
    private Integer commId;
    private String commContent;
    private Date commTime;
    private Integer custId;
    private Integer happId;

    public Comments() {
    }
}
