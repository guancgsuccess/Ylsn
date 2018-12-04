package com.chixing.entity;

import lombok.Data;

import java.io.Serializable;

@Data
public class Blacklist  implements Serializable {
    private int custId;
    private int custBlackId;

    public Blacklist() {
    }
}
