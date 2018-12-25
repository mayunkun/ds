/*
 * @(#)java 2014-3-21下午01:49:57
 * Copyright 2013 sinovatech, Inc. All rights reserved.
 */
package cn.com.util;

import java.util.Random;

/**
 * 字符串处理工具类,提供常用字符串处理方法
 * <ul>
 * <li>
 * <b>修改历史：</b><br/>
 * <p>
 * [2014-3-21下午01:49:57]gaozhanglei<br/>
 * TODO
 * </p>
 * </li>
 * </ul>
 */

public class StringUtils {
	/**
	 * 验证字符串时候为空
	 * 
	 * @author sunju
	 * @creationDate. 2010-12-3 下午04:47:52
	 * @param str
	 *            字符串
	 * @return boolean
	 */
	public static boolean isEmpty(String str) {
		return (str == null || str.equals("")) ? true : false;
	}

	/**
	 * 验证字符串非空
	 * 
	 * @author sunju
	 * @creationDate. 2010-12-3 下午04:48:16
	 * @param str
	 *            字符串
	 * @return boolean
	 */
	public static boolean isNotEmpty(String str) {
		return (str == null || str.equals("")) ? false : true;
	}

	/**
	 * 获得带中文的字符串长度
	 * 
	 * @author sunju
	 * @creationDate. 2010-11-2 上午11:36:30
	 * @param str
	 *            字符串
	 * @return 字符串长度
	 */
	public static long getChineseTextLen(String str) {
		if (isEmpty(str))
			return 0;
		return str.replaceAll("[^\\x00-\\xff]", "00").length();
	}

	/**
	 * 截取带中文的文本长度
	 * 
	 * @author sunju
	 * @creationDate. 2010-11-2 上午11:37:35
	 * @param str
	 *            字符串
	 * @param len
	 *            长度
	 * @param ext
	 *            截断后添加的标识(一般传省略号)
	 * @return 字符串
	 */
	public static String subChineseText(String str, int len, String ext) {
		if (isEmpty(str))
			return "";
		if (getChineseTextLen(str) <= len)
			return str;
		int m = (int) Math.floor(len / 2);
		int length = str.length();
		long subLen = 0;
		for (int i = m; i < length; i++) {
			subLen = getChineseTextLen(str.substring(0, i));
			if (subLen >= len) {
				StringBuilder result = new StringBuilder(str.substring(0, (subLen > len) ? i - 1 : i));
				if (isNotEmpty(ext)) {
					result.append(ext);
				}
				return result.toString();
			}
		}
		return str;
	}

	/**
	 * 文本转成全角字符串
	 * 
	 * @author sunju
	 * @creationDate. 2010-11-2 下午05:29:16
	 * @param str
	 *            待转换的字符串
	 * @return 全角字符串
	 */
	public static String text2sbcCase(String str) {
		if (isEmpty(str))
			return "";
		char[] c = str.toCharArray();
		int len = c.length;
		for (int i = 0; i < len; i++) {
			if (c[i] == 32) {
				c[i] = (char) 12288;
				continue;
			}
			if (c[i] < 127)
				c[i] = (char) (c[i] + 65248);
		}
		return new String(c);
	}

	/**
	 * 文本转成半角字符串
	 * 
	 * @author sunju
	 * @creationDate. 2010-11-2 下午05:28:31
	 * @param str
	 *            待转换的字符串
	 * @return 半角字符串
	 */
	public static String text2dbcCase(String str) {
		if (isEmpty(str))
			return "";
		char[] c = str.toCharArray();
		int len = c.length;
		for (int i = 0; i < len; i++) {
			if (c[i] == 12288) {
				c[i] = (char) 32;
				continue;
			}
			if (c[i] > 65280 && c[i] < 65375)
				c[i] = (char) (c[i] - 65248);
		}
		return new String(c);
	}

	/**
	 * 获取一定长度的随机字符串
	 * 
	 * @param length
	 *            指定字符串长度
	 * @return 一定长度的字符串
	 */
	public static String getRandomStringByLength(int length) {
		String base = "abcdefghijklmnopqrstuvwxyz0123456789";
		Random random = new Random();
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < length; i++) {
			int number = random.nextInt(base.length());
			sb.append(base.charAt(number));
		}
		return sb.toString();
	}

	/**
	 * 测试
	 * 
	 * @author sunju
	 * @creationDate. 2010-12-3 下午04:51:12
	 * @param args
	 */
	public static void main(String[] args) {
		// String str = "";
		// System.out.println(isEmpty(str));
		// System.out.println(isNotEmpty(str));
		// System.out.println(getChineseTextLen("123中文"));
		System.out.println(subChineseText("1我们答复的萨芬的", 0, "..."));
		// String sbcStr = text2sbcCase("123");
		// String sbcStr2 =
		// text2dbcCase("！＃＠＄＠＃＄％＾＆＊（）｛｝４５４８３８５８８９ＷＺＥＸＨＪＫＬ：＞？ｄｆｇｈｊｋｌ；／");
		// System.out.println(sbcStr);
		// System.out.println(sbcStr2);
		// System.out.println(text2dbcCase(sbcStr));
		// System.out.println(getRandomString(6));
	}
}
