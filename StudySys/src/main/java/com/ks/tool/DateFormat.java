package com.ks.tool;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateFormat {

    private static SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");

    public static Date StringFormatDate(String datestr){
        Date date = null;
        try {
            date = sf.parse(datestr);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return date;
    }

    public static String DateFormatString(Date date){
        return sf.format(date);
    }
}
