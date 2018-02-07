package com.xingou.service.impl;

import com.xingou.dao.TempDao;
import com.xingou.entity.Temperature;
import com.xingou.service.TempService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/*
 * Created by viczyf on 2017/11/27.
 */
@Service("tempService")
public class TempServiceImpl implements TempService{
    private static boolean isSameDate(Date date1, Date date2) {
        Calendar cal1 = Calendar.getInstance();
        cal1.setTime(date1);

        Calendar cal2 = Calendar.getInstance();
        cal2.setTime(date2);

        boolean isSameYear = cal1.get(Calendar.YEAR) == cal2
                .get(Calendar.YEAR);
        boolean isSameMonth = isSameYear
                && cal1.get(Calendar.MONTH) == cal2.get(Calendar.MONTH);
        boolean isSameDate = isSameMonth
                && cal1.get(Calendar.DAY_OF_MONTH) == cal2
                .get(Calendar.DAY_OF_MONTH);

        return isSameDate;
    }

    @Resource
    private TempDao tempDao;

    public List<Temperature> selectTemp(int uid){
        String hql = "from Temperature t where t.user.uid="+uid;
        return tempDao.find(hql);
    };
    public List<Temperature> selectMaxTemp(int uid){
        String hql = "from Temperature t where t.user.uid="+uid;
        List list = tempDao.find(hql);
        List<Temperature> tempMaxList = new ArrayList<Temperature>();
        int x=0;
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        SimpleDateFormat formatter1 = new SimpleDateFormat("yyyy-MM-dd");
        while (x < list.size()) {
            int a = 1;
            int b = 0;
            Temperature maxTemp=null;
            Temperature temp1=(Temperature)list.get(x);
            float temperature1=temp1.getTemp();
            if ((x == list.size()-1)) {
                tempMaxList.add(temp1);
                System.out.println("最终加入的温度记录"+temperature1);
                break;
            }
            Temperature temp2=(Temperature)list.get(x+a);
            float temperature2=temp2.getTemp();
//            System.out.print(temperature1);
//            System.out.println(temperature2);
            Date date1=null;
            Date date2=null;
            try {
                date1 = formatter.parse(temp1.getDate());
                date2 = formatter.parse(temp2.getDate());
            } catch (java.text.ParseException e) {
                e.printStackTrace();
            }
//            System.out.println("时间是否一致"+isSameDate(date1,date2));
            //比较x和x+a在不在同一天
            if (!isSameDate(date1, date2)) {
                tempMaxList.add(temp1);
                x++;
                System.out.println("时间不一致,加入"+temperature1);
                System.out.println("下一个循环的数"+x);
            } else {
                while (b == 0) {
                    if (temperature1 > temperature2) {
                        maxTemp = temp1;
                    } else {
                        maxTemp = temp2;
                        temperature1=temperature2;
                        temp1=temp2;
                    }
                    a++;
                    if ((x + a) >= list.size()) {
                        break;
                    }
                    temp2=(Temperature)list.get(x+a);
                    temperature2=temp2.getTemp();
                    System.out.println(temperature2);
                    date2=null;
                    try {
                        date2 = formatter.parse(temp2.getDate());
                    } catch (java.text.ParseException e) {
                        e.printStackTrace();
                    }
                    if (!isSameDate(date1, date2)) {
                        b=1;
                    }
                }
                System.out.println(b);
                tempMaxList.add(maxTemp);
                x=x+a;
                System.out.println("加入温度"+temperature1);
                System.out.println("下一个循环的数"+x);
            }
        }
//        for(x=0;x<tempMaxList.size();x++) {
//            Temperature tempsingle = tempMaxList.get(x);
//            float single_temperature = tempsingle.getTemp();
//            Date single_date=null;
//            try {
//                single_date = formatter.parse(tempsingle.getDate());
//            } catch (java.text.ParseException e) {
//                e.printStackTrace();
//            }
//            String format_date = formatter1.format(single_date);
//            tempsingle.setDate(format_date);
//        }
        return tempMaxList;
    };
}
