package com.chixing.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public class Visit  implements Serializable {
    private Integer custId;
    private Integer custVisitId;
    private Date visitDate;

    public Visit() {
    }
}
