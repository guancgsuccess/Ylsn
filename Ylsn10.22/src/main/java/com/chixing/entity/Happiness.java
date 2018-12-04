package com.chixing.entity;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Data
public class Happiness  implements Serializable {
    private Integer happId;
    private String happOtherName;
    private Integer happState;
    private String happTitle;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date happTime;
    private String happContent;
    private String happImages;
    private Integer custId;

    public void setHappTime(String time) throws ParseException {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        this.happTime = format.parse(time);
    }
    public Happiness() {
    }
}
