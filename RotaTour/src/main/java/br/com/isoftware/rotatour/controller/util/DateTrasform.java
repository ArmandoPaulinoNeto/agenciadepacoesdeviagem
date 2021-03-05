package br.com.isoftware.rotatour.controller.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.time.LocalDateTime;  
import java.time.format.DateTimeFormatter; 

public class DateTrasform {
	
	public static Date converterStrigParaData(String str_data) {
		try {
				SimpleDateFormat fmt = new SimpleDateFormat("dd/MM/yyyy");  
		        Date data = fmt.parse(str_data);
		        System.out.println(data);
		        return data;
		} catch (Exception e) { 
			e.printStackTrace();
	        return null;
	    }
	}
	
	public static String convertLocalDateTimeToStr(LocalDateTime  date) {
		try {
			DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
		    return  date.format(myFormatObj);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}

}
