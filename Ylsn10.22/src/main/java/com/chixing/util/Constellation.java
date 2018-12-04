package com.chixing.util;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class Constellation {
    public static final String[] constellationArr= { "水瓶座", "双鱼座", "牡羊座", "金牛座", "双子座", "巨蟹座", "狮子座", "处女座", "天秤座",
            "天蝎座", "射手座", "魔羯座" };

    public static final int[] constellationEdgeDay = { 20, 19, 21, 21, 21, 22, 23, 23, 23, 23, 22, 22 ,20 };
    //得到星座

    public static String getBuyerConstell(Date b){
        Calendar cal=Calendar.getInstance();
        if(b!=null){
            cal.setTime(b);
            int mon=cal.get(cal.MONTH);
            int day=cal.get(cal.DAY_OF_MONTH);
            if(day>=20){
                return constellationArr[mon];
            }else{
                if(mon-1<0){
                    return constellationArr[11];
                }else{
                    return constellationArr[mon-1];
                }

            }
        }
        return null;
    }

    public static String getNature(Date b){
        Calendar cal=Calendar.getInstance();
        if(b!=null){
            cal.setTime(b);
            int mon=cal.get(cal.YEAR)+1;
            String str="";
            switch (mon%12)
            {
                case 1:str = "猴";return str;
                case 2:str = "鸡";return str;
                case 3:str = "狗";return str;
                case 4:str = "猪";return str;
                case 5:str = "鼠";return str;
                case 6:str = "牛";return str;
                case 7:str = "虎";return str;
                case 8:str = "兔";return str;
                case 9:str = "龙";return str;
                case 10:str = "蛇";return str;
                case 11:str = "马";return str;
                case 0:str = "羊";return str;
            }
        }
        return null;
    }
/*    public static void main(String[] args) throws ParseException {
        String s="2012-12-12";
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        System.out.println(sdf.parse(s));
        Date d = new Date();
        System.out.println(getBuyerConstell(sdf.parse(s)));
        System.out.println(getNature(d));
    }*/
}
