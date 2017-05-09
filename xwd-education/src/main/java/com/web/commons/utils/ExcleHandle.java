package com.web.commons.utils;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;

public class ExcleHandle {
	/**
	 * 单元格取值处理
	 * @param cell
	 * @return
	 */
	public String getValue(HSSFCell cell) { 
		 DecimalFormat df = new DecimalFormat("#");		
		 if (cell == null)			
			 return "";		
		 switch (cell.getCellType()) {		
		 	case HSSFCell.CELL_TYPE_NUMERIC:			
		 		if(HSSFDateUtil.isCellDateFormatted(cell)){				
		 			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");				
		 			return sdf.format(HSSFDateUtil.getJavaDate(cell.getNumericCellValue())).toString();			
		 			}			
		 		return df.format(cell.getNumericCellValue());
		 	case HSSFCell.CELL_TYPE_STRING:					
		 		return cell.getStringCellValue();		
		 	case HSSFCell.CELL_TYPE_FORMULA:			
		 		return cell.getCellFormula();		
		 	case HSSFCell.CELL_TYPE_BLANK:			
		 		return "";		
		 	case HSSFCell.CELL_TYPE_BOOLEAN:			
		 		return cell.getBooleanCellValue() + "";		
		 	case HSSFCell.CELL_TYPE_ERROR:			
		 		return cell.getErrorCellValue() + "";		
		 }		
		 return cell.getStringCellValue();
	       
	    }	
}
