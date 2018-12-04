package com.chixing.entity;

import lombok.Data;

import java.io.Serializable;

@Data
public class CustActivity  implements Serializable {
    private Integer custId;
    private Integer actiId;

    public CustActivity() {
    }
}
