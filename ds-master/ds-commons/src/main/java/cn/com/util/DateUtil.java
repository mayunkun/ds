package cn.com.util;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StringUtils;

public class DateUtil {
	private static Logger LOG = LoggerFactory.getLogger(DateUtil.class);
	/**
	 * 时间间隔：日
	 */
	public final static int DATE_INTERVAL_DAY = 1;
	/**
	 * 时间间隔：周
	 */
	public final static int DATE_INTERVAL_WEEK = 2;
	/**
	 * 时间间隔：月
	 */
	public final static int DATE_INTERVAL_MONTH = 3;
	/**
	 * 时间间隔：年
	 */
	public final static int DATE_INTERVAL_YEAR = 4;
	/**
	 * 时间间隔：小时
	 */
	public final static int DATE_INTERVAL_HOUR = 5;
	/**
	 * 时间间隔：分钟
	 */
	public final static int DATE_INTERVAL_MINUTE = 6;
	/**
	 * 时间间隔：秒
	 */
	public final static int DATE_INTERVAL_SECOND = 7;
	/**
	 * 时间格式：年月日
	 */
	public final static String DATE_FORMAT_YMD = "yyyy-MM-dd";
	/**
	 * 时间格式：年月日时分秒
	 */

	public final static String DATE_FORMAT_YEAR = "yyyy";

	public final static String DATE_FORMAT_MONTH = "MM";

	public final static String DATE_FORMAT_DAY = "dd";

	public final static String DATE_FORMAT_YM = "yyyy-MM";

	public final static String DATE_FORMAT_YMDHMS = "yyyy-MM-dd HH:mm:ss";

	public final static String DATE_FORMAT_YMDHH = "yyyy-MM-dd HH";

	public final static String DATE_FORMAT_YMDHMS2 = "yyyyMMddHHmmss";
	public final static String DATE_FORMAT_YMDH = "yyyyMMdd";

	public final static String DATE_FORMAT_YMDHMSsss = "yyyyMMddHHmmssSSS";

	/**
	 * 获得时间
	 * 
	 * @author sunju
	 * @creationDate. 2012-7-31 下午03:06:05
	 * @param date
	 *            时间
	 * @param dateFormat
	 *            时间格式
	 * @return 时间
	 */
	public static Date getDate(Date date, String dateFormat) {
		return dateFormat(dateFormat(date, dateFormat), dateFormat);
	}

	/**
	 * 获得当前日期(年月日)
	 * 
	 * @author sunju
	 * @creationDate. 2010-8-27 下午05:11:23
	 * @return 当前时间（yyyy-MM-dd）
	 */
	public static Date getNowDate() {
		return dateFormat(dateFormat(new Date(), DATE_FORMAT_YMD), DATE_FORMAT_YMD);
	}

	/**
	 * 获取当前时间字符串(年月日)
	 * 
	 * @author sunju
	 * @creationDate. 2011-5-4 下午08:22:34
	 * @return 时间字符串
	 */
	public static String getNowStringDate() {
		return dateFormat(new Date(), DATE_FORMAT_YMD);
	}

	public static String getNowStringYMDHMSDate() {
		return dateFormat(new Date(), DATE_FORMAT_YMDHMS2);
	}

	public static String getNowStringYMDHMSSDate() {
		return dateFormat(new Date(), DATE_FORMAT_YMDHMSsss);
	}

	/**
	 * 获得当前时间(年月日时分秒)
	 * 
	 * @author sunju
	 * @creationDate. 2010-8-27 下午05:12:57
	 * @return 当前时间（yyyy-MM-dd HH:mm:ss）
	 */
	public static Date getNowTime() {
		return dateFormat(dateFormat(new Date(), DATE_FORMAT_YMDHMS), DATE_FORMAT_YMDHMS);
	}

	/**
	 * 获取当前时间字符串(年月日时分秒)
	 * 
	 * @author sunju
	 * @creationDate. 2014-3-10 下午03:16:42
	 * @return 时间字符串
	 */
	public static String getNowStringTime() {
		return dateFormat(new Date(), DATE_FORMAT_YMDHMS);
	}

	/**
	 * 获得明天的日期字符串(格式年月日)
	 * 
	 * @author sunju
	 * @creationDate. 2011-5-4 下午08:19:28
	 * @return 明天的日期
	 */
	public static String getTomorrowStringDate() {
		return dateFormat(getTomorrowTime(), DATE_FORMAT_YMD);
	}

	/**
	 * 获得明天的日期字符串(格式年月日)
	 * 
	 * @author sunju
	 * @creationDate. 2011-5-4 下午08:19:28
	 * @return 明天的日期
	 */
	public static String getAfterTomorrowStringDate() {
		return dateFormat(getAfterTomorrowTime(), DATE_FORMAT_YMD);
	}

	/**
	 * 获得明天的日期(年月日)
	 * 
	 * @author sunju
	 * @creationDate. 2011-5-4 下午08:19:57
	 * @return 明天的日期
	 */
	public static Date getTomorrowDate() {
		return dateAdd(DATE_INTERVAL_DAY, getNowDate(), 1);
	}

	/**
	 * 获得明天的时间(年月日时分秒)
	 * 
	 * @author sunju
	 * @creationDate. 2011-5-4 下午08:20:19
	 * @return 明天的时间
	 */
	public static Date getTomorrowTime() {
		return dateAdd(DATE_INTERVAL_DAY, getNowTime(), 1);
	}

	/**
	 * 后天
	 * 
	 * <ul>
	 * <li>
	 * <b>原因：<br/>
	 * <p>
	 * [2014-10-31]gaozhanglei<br/>
	 * 
	 * @return TODO
	 *         </p>
	 *         </li>
	 *         </ul>
	 */
	public static Date getAfterTomorrowTime() {
		return dateAdd(DATE_INTERVAL_DAY, getNowTime(), 2);
	}

	/**
	 * 获得昨天的日期
	 * 
	 * @author sunju
	 * @creationDate. 2013-10-22 下午03:54:48
	 * @return 昨天的日期
	 */
	public static Date getYesterdayDate() {
		return dateAdd(DATE_INTERVAL_DAY, getNowDate(), -1);
	}

	/**
	 * 获取当年的第一天
	 * 
	 * @param year
	 * @return
	 */
	public static Date getCurrYearFirst() {
		Calendar currCal = Calendar.getInstance();
		int currentYear = currCal.get(Calendar.YEAR);
		return getYearFirst(currentYear);
	}

	/**
	 * 获取当年的最后一天
	 * 
	 * @param year
	 * @return
	 */
	public static Date getCurrYearLast() {
		Calendar currCal = Calendar.getInstance();
		int currentYear = currCal.get(Calendar.YEAR);
		return getYearLast(currentYear);
	}

	/**
	 * 获取某年第一天日期
	 * 
	 * @param year
	 *            年份
	 * @return Date
	 */
	public static Date getYearFirst(int year) {
		Calendar calendar = Calendar.getInstance();
		calendar.clear();
		calendar.set(Calendar.YEAR, year);
		Date currYearFirst = calendar.getTime();
		return currYearFirst;
	}

	/**
	 * 获取某年最后一天日期
	 * 
	 * @param year
	 *            年份
	 * @return Date
	 */
	public static Date getYearLast(int year) {
		Calendar calendar = Calendar.getInstance();
		calendar.clear();
		calendar.set(Calendar.YEAR, year);
		calendar.roll(Calendar.DAY_OF_YEAR, -1);
		Date currYearLast = calendar.getTime();

		return currYearLast;
	}

	/**
	 * 获取当月第一天
	 * 
	 * @author sunju
	 * @creationDate. 2013-10-22 下午03:45:53
	 * @return 日期
	 */
	public static Date getMonthFirst() {
		Calendar lastDate = Calendar.getInstance();
		lastDate.set(Calendar.DATE, 1); // 设为当前月的1号
		return getDate(lastDate.getTime(), DATE_FORMAT_YMD);
	}

	/**
	 * 获得下个月第一天的日期
	 * 
	 * @author sunju
	 * @creationDate. 2013-10-22 下午03:52:38
	 * @return 日期
	 */
	public static Date getNextMonthFirst() {
		Calendar lastDate = Calendar.getInstance();
		lastDate.add(Calendar.MONTH, 1); // 加一个月
		lastDate.set(Calendar.DATE, 1); // 把日期设置为当月第一天
		return getDate(lastDate.getTime(), DATE_FORMAT_YMD);
	}

	public static Date getNextMonthFirst(Date date) {
		Calendar lastDate = Calendar.getInstance();
		lastDate.setTime(date);
		lastDate.add(Calendar.MONTH, 1); // 加一个月
		lastDate.set(Calendar.DATE, 1); // 把日期设置为当月第一天
		return getDate(lastDate.getTime(), DATE_FORMAT_YMD);
	}

	public static Date getMonthFirst(Date date) {
		Calendar lastDate = Calendar.getInstance();
		lastDate.setTime(date);
		// 加一个月
		lastDate.set(Calendar.DATE, 1); // 把日期设置为当月第一天
		return getDate(lastDate.getTime(), DATE_FORMAT_YMD);
	}

	/**
	 * 取得当前星期几
	 * 
	 * @author sunju
	 * @creationDate. 2010-9-20 下午05:34:36
	 * @param date
	 *            时间
	 * @return 星期
	 */
	public static String getWeekOfDate(Date date) {
		if (date == null)
			return null;
		String[] weekDays = { "星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六" };
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		int w = cal.get(Calendar.DAY_OF_WEEK) - 1;
		if (w < 0)
			w = 0;
		return weekDays[w];
	}

	/**
	 * 或得当前日期是一年中的第几周
	 * 
	 * @author wxl
	 * @creationDate. 2015-10-26 下午05:29:36
	 * @param date
	 *            时间
	 * @return 周
	 */
	public static int getWeekNumOfDate(Date date) {
		if (date == null)
			return 0;
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.setFirstDayOfWeek(Calendar.MONDAY);
		cal.get(Calendar.WEEK_OF_YEAR);
		int weeknum = cal.get(Calendar.WEEK_OF_YEAR);
		return weeknum;
	}

	/**
	 * 时间类型转换返回字符串
	 * 
	 * @author sunju
	 * @creationDate. 2010-8-27 下午05:18:37
	 * @param date
	 *            时间
	 * @param dateFormat
	 *            时间格式
	 * @return 转换后的时间字符串
	 */
	public static String dateFormat(Date date, String dateFormat) {
		if (date == null)
			return null;
		SimpleDateFormat format = new SimpleDateFormat(dateFormat);
		return format.format(date);
	}

	/**
	 * 字符串时间类型转换返回Date类型
	 * 
	 * @author sunju
	 * @creationDate. 2010-8-27 下午05:23:35
	 * @param date
	 *            字符串时间
	 * @param dateFormat
	 *            时间格式
	 * @return 转换后的时间
	 */
	public static Date dateFormat(String date, String dateFormat) {
		if (StringUtils.isEmpty(date))
			return null;
		SimpleDateFormat format = new SimpleDateFormat(dateFormat);
		try {
			return format.parse(date);
		} catch (Exception e) {
			LOG.error(e.getMessage());
			return null;
		}
	}

	/**
	 * 加时间
	 * 
	 * @author sunju
	 * @creationDate. 2010-8-27 下午05:28:06
	 * @param interval
	 *            增加项，可以是天数、月份、年数、时间、分钟、秒
	 * @param date
	 *            时间
	 * @param num
	 *            加的数目
	 * @return 时间加后的时间
	 */
	public static Date dateAdd(int interval, Date date, int num) {
		if (date == null)
			return null;
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		switch (interval) {
		case DATE_INTERVAL_DAY:
			calendar.add(Calendar.DATE, num);
			break;
		case DATE_INTERVAL_WEEK:
			calendar.add(Calendar.WEEK_OF_MONTH, num);
			break;
		case DATE_INTERVAL_MONTH:
			calendar.add(Calendar.MONTH, num);
			break;
		case DATE_INTERVAL_YEAR:
			calendar.add(Calendar.YEAR, num);
			break;
		case DATE_INTERVAL_HOUR:
			calendar.add(Calendar.HOUR, num);
			break;
		case DATE_INTERVAL_MINUTE:
			calendar.add(Calendar.MINUTE, num);
			break;
		case DATE_INTERVAL_SECOND:
			calendar.add(Calendar.SECOND, num);
			break;
		default:
		}
		return calendar.getTime();
	}

	/**
	 * 两个时间时间差[前面时间和比较时间比,小于比较时间返回负数]
	 * 
	 * @author sunju
	 * @creationDate. 2010-8-27 下午05:26:13
	 * @param interval
	 *            比较项，可以是天数、月份、年数、时间、分钟、秒
	 * @param date
	 *            时间
	 * @param compare
	 *            比较的时间
	 * @return 时间差(保留两位小数点,小数点以后两位四舍五入)
	 */
	public static double getDateDiff(int interval, Date date, Date compare) {
		if (date == null || compare == null)
			return 0;
		double result = 0;
		double time = 0;
		Calendar calendar = null;
		switch (interval) {
		case DATE_INTERVAL_DAY:
			time = date.getTime() - compare.getTime();
			result = time / 1000d / 60d / 60d / 24d;
			break;
		case DATE_INTERVAL_HOUR:
			time = date.getTime() - compare.getTime();
			result = time / 1000d / 60d / 60d;
			break;
		case DATE_INTERVAL_MINUTE:
			time = date.getTime() / 1000d / 60d;
			result = time - compare.getTime() / 1000d / 60d;
			break;
		case DATE_INTERVAL_MONTH:
			calendar = Calendar.getInstance();
			calendar.setTime(date);
			time = calendar.get(Calendar.YEAR) * 12d;
			calendar.setTime(compare);
			time -= calendar.get(Calendar.YEAR) * 12d;
			calendar.setTime(date);
			time += calendar.get(Calendar.MONTH);
			calendar.setTime(compare);
			result = time - calendar.get(Calendar.MONTH);
			break;
		case DATE_INTERVAL_SECOND:
			time = date.getTime() - compare.getTime();
			result = time / 1000d;
			break;
		case DATE_INTERVAL_WEEK:
			calendar = Calendar.getInstance();
			calendar.setTime(date);
			time = calendar.get(Calendar.YEAR) * 52d;
			calendar.setTime(compare);
			time -= calendar.get(Calendar.YEAR) * 52d;
			calendar.setTime(date);
			time += calendar.get(Calendar.WEEK_OF_YEAR);
			calendar.setTime(compare);
			result = time - calendar.get(Calendar.WEEK_OF_YEAR);
			break;
		case DATE_INTERVAL_YEAR:
			calendar = Calendar.getInstance();
			calendar.setTime(date);
			time = calendar.get(Calendar.YEAR);
			calendar.setTime(compare);
			result = time - (double) calendar.get(Calendar.YEAR);
			break;
		default:
			break;
		}
		return new BigDecimal(result).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
	}

	/**
	 * 获取时间差[前面时间和比较时间比,小于比较时间返回负数]
	 * 
	 * @author sunju
	 * @creationDate. 2010-9-1 下午04:36:07
	 * @param level
	 *            返回时间等级(1:返回天;2:返回天-小时;3:返回天-小时-分4:返回天-小时-分-秒;)
	 * @param date
	 *            时间
	 * @param compare
	 *            比较的时间
	 * @return 时间差(保留两位小数点,小数点以后两位四舍五入)
	 */
	public static String getDateBetween(Integer level, Date date, Date compare) {
		if (date == null || compare == null)
			return null;
		long s = new BigDecimal(getDateDiff(DATE_INTERVAL_SECOND, date, compare)).setScale(2, BigDecimal.ROUND_HALF_UP).longValue();
		int ss = 1;
		int mi = ss * 60;
		int hh = mi * 60;
		int dd = hh * 24;

		long day = s / dd;
		long hour = (s - day * dd) / hh;
		long minute = (s - day * dd - hour * hh) / mi;
		long second = (s - day * dd - hour * hh - minute * mi) / ss;
		String flag = (day < 0 || hour < 0 || minute < 0 || second < 0) ? "-" : "";
		day = Math.abs(day);
		hour = Math.abs(hour);
		minute = Math.abs(minute);
		second = Math.abs(second);
		StringBuilder result = new StringBuilder(flag);
		switch (level) {
		case 1:
			if (day != 0)
				result.append(day).append("天");
			break;
		case 2:
			if (day != 0)
				result.append(day).append("天");
			if (hour != 0)
				result.append(hour).append("小时");
			break;
		case 3:
			if (day != 0)
				result.append(day).append("天");
			if (hour != 0)
				result.append(hour).append("小时");
			if (minute != 0)
				result.append(minute).append("分");
			break;
		case 4:
			if (day != 0)
				result.append(day).append("天");
			if (hour != 0)
				result.append(hour).append("小时");
			if (minute != 0)
				result.append(minute).append("分");
			if (second != 0)
				result.append(second).append("秒");
			break;
		default:
			break;
		}
		return result.toString();
	}

	/**
	 * 时间是否是今天
	 * 
	 * @author sunju
	 * @creationDate. 2011-5-4 下午08:24:58
	 * @param date
	 *            时间
	 * @return 布尔
	 */
	public static boolean isToday(Date date) {
		if (date == null)
			return false;
		return getNowStringDate().equals(dateFormat(date, DATE_FORMAT_YMD));
	}

	/**
	 * 时间是否合法
	 * 
	 * @author sunju
	 * @creationDate. 2012-6-19 下午01:07:59
	 * @param date
	 *            时间
	 * @param dateFormat
	 *            时间格式
	 * @return
	 */
	public static boolean isValidDate(String date, String dateFormat) {
		try {
			new SimpleDateFormat(dateFormat).parse(date);
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	
	/**
	 * 两个时间相差的分钟数
	 * 
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	public static long getIntervalByDate(Date startDate, Date endDate) {
		long interval = -1;
		if (startDate == null || endDate == null) {
			return interval;
		}
		long ss = (endDate.getTime() - startDate.getTime()) / (1000); // 共计秒数
		interval = (int) ss / 60; // 共计分钟数
		return Math.abs(interval);
	}
	
	/**
	 * long转date
	 * @param longTime
	 * @return
	 */
	public static Date getDateByLong(Long longTime) {
		 SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
         Date date = new Date(longTime);  
         sdf.format(date);
         return date;
	}
	 /** 
     * 获得本小时的开始时间，即2017-01-01 23:00:00 
     * 
     * @return 
     */ 
    public static  Date getCurrentHourStartTime() { 
        return dateFormat(dateFormat(new Date(), DATE_FORMAT_YMDHH),DATE_FORMAT_YMDHH);
    } 
    
    /** 
     * 获得本小时的结束时间，即2017-01-01 23:59:59 
     * 
     * @return 
     */ 
    public  static Date getCurrentHourEndTime() { 
    	return dateFormat(dateFormat(new Date(), DATE_FORMAT_YMDHH) + ":59:59",DATE_FORMAT_YMDHMS);
    }
	
	public static void main(String[] args) {
		// System.out.println(getDateBetween(Integer.valueOf(4),
		// dateFormat("2011-05-4 20:02:05", "yyyy-MM-dd HH:mm:ss"), new
		// Date()));
		// System.out.println(getDateDiff(DATE_INTERVAL_DAY,
		// dateFormat("2010-11-16 10:20:38", DATE_FORMAT_YMDHMS),
		// dateFormat("2010-11-12 23:32:53", DATE_FORMAT_YMDHMS)));
		// System.out.println(getDateBetween(4,
		// dateFormat("2010-11-16 10:20:38", DATE_FORMAT_YMDHMS),
		// dateFormat("2010-11-12 23:32:53", DATE_FORMAT_YMDHMS)));
		// System.out.println(getWeekOfDate(dateFormat("2011-1-10 12:37:52",
		// DATE_FORMAT_YMDHMS)));
		// System.out.println(isValidDate("2012-05-08 12:00:00",
		// "yyyy-MM-dd HH:mm:ss"));
		// Date timestamp = dateFormat("2012-06-19 13:33:02",
		// "yyyy-MM-dd HH:mm:ss");;
		// double dateDiff = getDateDiff(DATE_INTERVAL_MINUTE, new Date(),
		// timestamp);
		// System.out.println("dateDiff-->" + dateDiff);
		// if (dateDiff > 6) {
		// System.out.println("超时");
		// }
		// System.out.println(DateUtil.dateFormat(new Date(),
		// "yyyy年MM月dd日HH时mm分"));
		// // 取到明天的今天
		Date nextYear = DateUtil.dateAdd(DateUtil.DATE_INTERVAL_DAY, new Date(), 1);

		// System.out.println(DateUtil.dateFormat(nextYear,
		// DateUtil.DATE_FORMAT_YMDHMS));
		// System.out.println(dateFormat(new Date(), DATE_FORMAT_YMDHMSsss));
		// System.out.println(getYesterdayDate());
		// System.out.println(getMonthFirst());
		// System.out.println(getNextMonthFirst());
		// int week = DateUtil.getWeekNumOfDate(new Date());
		// System.out.println(week);

		System.out.println(dateFormat(nextYear, DATE_FORMAT_YMD));
		// System.out.println(dateFormat(nextYear, DATE_FORMAT_YEAR));
		// System.out.println(dateFormat(getCurrYearLast(), DATE_FORMAT_YMD));
		// System.out.println(getYearFirst(2012));
	}
}
