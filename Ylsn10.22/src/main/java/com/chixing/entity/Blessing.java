package com.chixing.entity;

import lombok.Data;

import java.io.Serializable;

@Data
public class Blessing  implements Serializable {
    private int happId;
    private int custId;

    public Blessing() {
    }
}
