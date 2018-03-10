package com.my.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Util {
	public static String generateFileName(String picFileName) {
		DateFormat format = new SimpleDateFormat("yyyyMMddhhmmssSS"); //形成时间格式包含年月日时分秒毫秒
		Date mydate = new Date();                                     //默认会获得当前的时间
		String strformdate = format.format(mydate);   				  //对当前时间进行格式化，并返回相应的字符串
		String prefilename = picFileName.substring(0, picFileName
				.lastIndexOf("."));                                   //取原文件名称，不包括后缀
		String lastfilename = picFileName.substring(picFileName
				.lastIndexOf("."), picFileName.length());             //取文件名称的后缀
		return prefilename + strformdate + lastfilename;			  //将以上三者拼成新的名称字符串
	}
}
