package com.lft.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 *  日期与字符串转换工具类
 *  	
 *  	Date -> String
 *  	String -> Date
 *  
 *  	Calendar -> Date
 *  	Date -> Calendar
 *  
 *      Calendar -> Date -> String
 *      String -> Date -> Calendar
 *      
 *      util.Date -> sql.Date[略]
 *      sql.Date -> util.Date[略]
 */
public class DateUtil {

	//private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	//private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日");
	private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	/**
	 * Date日期 -> String字符串
	 * @param date 传入日期类型
	 * @return 返回字符串类型
	 */
	public static String dateToString (Date date)
	{
		if(date == null)
		{
			return null;
		}
		return sdf.format(date);
	}
	
	/**
	 * Calendar日历 -> String字符串
	 * @param Calendar 传入日历类型
	 * @return 返回字符串类型
	 */
	public static String dateToString (Calendar calendar)
	{
		return sdf.format(calendar.getTime());
	}
	
	/**
	 * String字符串 -> Date日期
	 * @param string 传入字符串类型
	 * @return 返回日期类型
	 */
	public static Date StringToDate(String string)
	{
		try {
			
			return sdf.parse(string);
			
		} catch (ParseException e) {
			
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * String字符串 -> Calendar日历
	 * @param string 传入字符串类型
	 * @return 返回日日历类型
	 */
	public static Calendar StringToCalendar(String string)
	{
		try {
			Calendar calendar = Calendar.getInstance();
			
			calendar.setTime(sdf.parse(string));
			
			return calendar;
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * Date日期 -> Calendar日历
	 * @param date 传入Date类型日期
	 * @return 返回Calendar类型日历
	 */
	public static Calendar dateToCalendar(Date date)
	{
		Calendar calendar = Calendar.getInstance();
		//将传入的Date日期赋值给当前calendar
		calendar.setTime(date);
		
		return calendar;
	}
	
	/**
	 *  Calendar日历 -> Date日期 
	 * @param calendar  传入Calendar类型日历
	 * @return 返回Date类型日期
	 */
	public static Date calendarToDate(Calendar calendar)
	{
		return calendar.getTime();
	}
	
}
