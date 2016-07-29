package spring.utility.ten;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Hashtable;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;


public class Utility {
	
	public static String nullCheck(String str){
		if(str==null){
			str= "";
		}
		
		return str;
	}

	 public static String saveFile(MultipartFile multipartFile, String basePath) { 
	        String fileName = ""; 

	        String originalFileName = multipartFile.getOriginalFilename(); 

	        String contentType = multipartFile.getContentType(); 

	        long fileSize = multipartFile.getSize(); 
	         
	        System.out.println("fileSize: " + fileSize); 
	        System.out.println("originalFileName: " + originalFileName); 
	         
	        InputStream inputStream = null; 
	        OutputStream outputStream = null; 
	 
	        try { 
	            if( fileSize > 0 ) {
	                inputStream = multipartFile.getInputStream(); 
	 
	                File oldfile = new File(basePath, originalFileName); 
	             
	                if ( oldfile.exists()){ 
	                    for(int k=0; true; k++){ 
	                        oldfile = new File(basePath,"("+k+")"+originalFileName); 
	                      
	                        if(!oldfile.exists()){
	                            fileName = "("+k+")"+originalFileName; 
	                            break; 
	                        } 
	                    } 
	                }else{ 
	                    fileName = originalFileName; 
	                } 

	                String serverFullPath = basePath + "\\" + fileName; 
	                 
	                System.out.println("fileName: " + fileName); 
	                System.out.println("serverFullPath: " + serverFullPath); 
	                 
	                outputStream = new FileOutputStream( serverFullPath ); 
	  
	                int readBytes = 0; 
	                byte[] buffer = new byte[8192]; 
	 
	                while((readBytes = inputStream.read(buffer, 0, 8192)) != -1 ) { 
	                    outputStream.write( buffer, 0, readBytes ); 
	                } 
	                outputStream.close(); 
	                inputStream.close(); 
	                         
	            } 
	 
	        } catch(Exception e) { 
	            e.printStackTrace();   
	        }finally{ 
	             
	        } 
	         
	        return fileName; 
	    } 
	 
	 public static void deleteFile(String upDir, String oldfile){
		 
		 File file=new File(upDir,oldfile);
		 
		 if(file.exists()){
			 file.delete();
		 }
		 
	 }
}