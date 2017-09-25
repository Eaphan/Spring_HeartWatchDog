package com.xingou.tools;

/*
 * Created by viczyf on 2017/2/9.
 */

import java.text.SimpleDateFormat;
import java.util.Date;

public class MyTools {
    public MyTools() {
    }

    public static String changeHTML(String value) {
        value = value.replace("&", "&amp;");
        value = value.replace(" ", "&nbsp;");
        value = value.replace("<", "&lt;");
        value = value.replace(">", "&gt;");
        value = value.replace("\r\n", "<br>");
        return value;
    }

    public static int strToint(String value) {
        byte i = -1;
        if (value != null && !value.equals("")) {
            int i1;
            try {
                i1 = Integer.parseInt(value);
            } catch (NumberFormatException var3) {
                i1 = -1;
                var3.printStackTrace();
            }

            return i1;
        } else {
            return i;
        }
    }

    public static float strTofloat(String value) {
        byte i =-1;
        if (value != null && !value.equals("")) {
            float i1;
            try {
                i1 = Float.parseFloat(value);
            } catch (NumberFormatException var3) {
                i1 = -1;
                var3.printStackTrace();
            }
            return i1;
        } else {
            return i;
        }
    }

    public static String toChinese(String value) {
        if (value == null) {
            return "";
        } else {
            try {
                value = new String(value.getBytes("ISO8859_1"), "utf-8");
                return value;
            } catch (Exception var2) {
                return "";
            }
        }
    }

    public static String changeTime(Date date) {
        SimpleDateFormat format = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");
        return format.format(date);
    }
}

