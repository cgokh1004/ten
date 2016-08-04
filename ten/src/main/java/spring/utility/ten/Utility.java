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

import spring.model.ncomment.*;


public class Utility {
	public static int total(int noticeno, NcommentDAO ndao){
        return ndao.total(noticeno);
   }
	
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
	 
	  /** 
		  * 댓글용 페이징 메소드
		  * @param totalRecord 전체 레코드수 
		  * @param nowPage     현재 페이지 
		  * @param recordPerPage 페이지당 레코드 수 
		  * @param url 이동할 페이지 
		  * @param bbsno 상위글번호
		  * @return 페이징 생성 문자열
		  */ 
		 public static String paging(int totalRecord, int nPage, int recordPerPage,String url,int noticeno,int nowPage, String col, String word){ 
		   int pagePerBlock = 10; // 블럭당 페이지 수 
		   int totalPage = (int)(Math.ceil((double)totalRecord/recordPerPage)); // 전체 페이지  
		   int totalGrp = (int)(Math.ceil((double)totalPage/pagePerBlock));// 전체 그룹 
		   int nowGrp = (int)(Math.ceil((double)nPage/pagePerBlock));    // 현재 그룹 
		   int startPage = ((nowGrp - 1) * pagePerBlock) + 1; // 특정 그룹의 페이지 목록 시작  
		   int endPage = (nowGrp * pagePerBlock);             // 특정 그룹의 페이지 목록 종료   
		    
		   StringBuffer str = new StringBuffer(); 
		    
		   str.append("<style type='text/css'>"); 
		   str.append("  #paging {text-align: center; margin-top: 5px; font-size: 1em;}"); 
		   str.append("  #paging A:link {text-decoration:none; color:black; font-size: 1em;}"); 
		   str.append("  #paging A:hover{text-decoration:none; background-color: #CCCCCC; color:black; font-size: 1em;}"); 
		   str.append("  #paging A:visited {text-decoration:none;color:black; font-size: 1em;}"); 
		   str.append("  .span_box_1{"); 
		   str.append("    text-align: center;");    
		   str.append("    font-size: 1em;"); 
		   str.append("    border: 1px;"); 
		   str.append("    border-style: solid;"); 
		   str.append("    border-color: #cccccc;"); 
		   str.append("    padding:1px 6px 1px 6px; /*위, 오른쪽, 아래, 왼쪽*/"); 
		   str.append("    margin:1px 2px 1px 2px; /*위, 오른쪽, 아래, 왼쪽*/"); 
		   str.append("  }"); 
		   str.append("  .span_box_2{"); 
		   str.append("    text-align: center;");    
		   str.append("    background-color: #668db4;"); 
		   str.append("    color: #FFFFFF;"); 
		   str.append("    font-size: 1em;"); 
		   str.append("    border: 1px;"); 
		   str.append("    border-style: solid;"); 
		   str.append("    border-color: #cccccc;"); 
		   str.append("    padding:1px 6px 1px 6px; /*위, 오른쪽, 아래, 왼쪽*/"); 
		   str.append("    margin:1px 2px 1px 2px; /*위, 오른쪽, 아래, 왼쪽*/"); 
		   str.append("  }"); 
		   str.append("</style>"); 
		   str.append("<DIV id='paging'>"); 
//		     str.append("현재 페이지: " + nowPage + " / " + totalPage + "  "); 
		 
		   int _nowPage = (nowGrp-1) * pagePerBlock; // 10개 이전 페이지로 이동 
		   if (nowGrp >= 2){ 
		     str.append("<span class='span_box_1'><A href='./"+url+"?nowPage="+nowPage+"&col="+col+"&word="+word+"&noticeno="+noticeno+"&nPage="+_nowPage+"'>이전</A></span>"); 
		   } 
		 
		   for(int i=startPage; i<=endPage; i++){ 
		     if (i > totalPage){ 
		       break; 
		     } 
		 
		     if (nPage == i){ 
		       str.append("<span class='span_box_2'>"+i+"</span>"); 
		     }else{ 
		       str.append("<span class='span_box_1'><A href='./"+url+"?nowPage="+nowPage+"&col="+col+"&word="+word+"&noticeno="+noticeno+"&nPage="+i+"'>"+i+"</A></span>");   
		     } 
		   } 
		    
		   _nowPage = (nowGrp * pagePerBlock)+1; // 10개 다음 페이지로 이동 
		   if (nowGrp < totalGrp){ 
		     str.append("<span class='span_box_1'><A href='./"+url+"?nowPage="+nowPage+"&col="+col+"&word="+word+"&noticeno="+noticeno+"&nPage="+_nowPage+"'>다음</A></span>"); 
		   } 
		   str.append("</DIV>"); 
		    
		   return str.toString(); 
		 } 
}