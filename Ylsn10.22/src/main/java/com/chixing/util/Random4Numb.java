package com.chixing.util;

import java.util.Random;

public class Random4Numb {

    public static final String numberChar = "0123456789";
    /**
     * 返回一个定长的随机纯数字字符串(只包含数字)
     * @param length
     *            随机字符串长度
     * @return 随机字符串
     */
    public static String generateDigitalString(int length) {
        StringBuffer sb = new StringBuffer();
        Random random = new Random();
        for (int i = 0; i < length; i++) {
            sb.append(numberChar.charAt(random.nextInt(numberChar.length())));
        }
        return sb.toString();
    }

}
