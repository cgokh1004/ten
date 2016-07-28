
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
	 
	/**
	  * 댓글 갯수 메소드
	  * @param bbsno 글번호
	  * @param rdao  댓글갯수가져올 rDAO
	  * @return 댓글갯수
	  */
//	public static int rcount(int bbsno,ReplyDAO rdao){
//         return rdao.rcount(bbsno);
//    }
//	/**
//	 * 댓글 갯수 메소드
//	 * @param bbsno 글번호
//	 * @param rdao  댓글갯수가져올 rDAO
//	 * @return 댓글갯수
//	 */
//	public static int imgcount(int imgno,ImgReplyDAO rdao){
//		return rdao.rcount(imgno);
//	}
//	 /** 
//	  * 댓글용 페이징 메소드
//	  * @param totalRecord 전체 레코드수 
//	  * @param nowPage     현재 페이지 
//	  * @param recordPerPage 페이지당 레코드 수 
//	  * @param url 이동할 페이지 
//	  * @param bbsno 상위글번호
//	  * @return 페이징 생성 문자열
//	  */ 
//	 public static String paging(int totalRecord, int nPage, int recordPerPage,String url,int bbsno,int nowPage, String col, String word){ 
//	   int pagePerBlock = 10; // 블럭당 페이지 수 
//	   int totalPage = (int)(Math.ceil((double)totalRecord/recordPerPage)); // 전체 페이지  
//	   int totalGrp = (int)(Math.ceil((double)totalPage/pagePerBlock));// 전체 그룹 
//	   int nowGrp = (int)(Math.ceil((double)nPage/pagePerBlock));    // 현재 그룹 
//	   int startPage = ((nowGrp - 1) * pagePerBlock) + 1; // 특정 그룹의 페이지 목록 시작  
//	   int endPage = (nowGrp * pagePerBlock);             // 특정 그룹의 페이지 목록 종료   
//	    
//	   StringBuffer str = new StringBuffer(); 
//	    
//	   str.append("<style type='text/css'>"); 
//	   str.append("  #paging {text-align: center; margin-top: 5px; font-size: 1em;}"); 
//	   str.append("  #paging A:link {text-decoration:none; color:black; font-size: 1em;}"); 
//	   str.append("  #paging A:hover{text-decoration:none; background-color: #CCCCCC; color:black; font-size: 1em;}"); 
//	   str.append("  #paging A:visited {text-decoration:none;color:black; font-size: 1em;}"); 
//	   str.append("  .span_box_1{"); 
//	   str.append("    text-align: center;");    
//	   str.append("    font-size: 1em;"); 
//	   str.append("    border: 1px;"); 
//	   str.append("    border-style: solid;"); 
//	   str.append("    border-color: #cccccc;"); 
//	   str.append("    padding:1px 6px 1px 6px; /*위, 오른쪽, 아래, 왼쪽*/"); 
//	   str.append("    margin:1px 2px 1px 2px; /*위, 오른쪽, 아래, 왼쪽*/"); 
//	   str.append("  }"); 
//	   str.append("  .span_box_2{"); 
//	   str.append("    text-align: center;");    
//	   str.append("    background-color: #668db4;"); 
//	   str.append("    color: #FFFFFF;"); 
//	   str.append("    font-size: 1em;"); 
//	   str.append("    border: 1px;"); 
//	   str.append("    border-style: solid;"); 
//	   str.append("    border-color: #cccccc;"); 
//	   str.append("    padding:1px 6px 1px 6px; /*위, 오른쪽, 아래, 왼쪽*/"); 
//	   str.append("    margin:1px 2px 1px 2px; /*위, 오른쪽, 아래, 왼쪽*/"); 
//	   str.append("  }"); 
//	   str.append("</style>"); 
//	   str.append("<DIV id='paging'>"); 
////	     str.append("현재 페이지: " + nowPage + " / " + totalPage + "  "); 
//	 
//	   int _nowPage = (nowGrp-1) * pagePerBlock; // 10개 이전 페이지로 이동 
//	   if (nowGrp >= 2){ 
//	     str.append("<span class='span_box_1'><A href='./"+url+"?nowPage="+nowPage+"&col="+col+"&word="+word+"&bbsno="+bbsno+"&nPage="+_nowPage+"'>이전</A></span>"); 
//	   } 
//	 
//	   for(int i=startPage; i<=endPage; i++){ 
//	     if (i > totalPage){ 
//	       break; 
//	     } 
//	 
//	     if (nPage == i){ 
//	       str.append("<span class='span_box_2'>"+i+"</span>"); 
//	     }else{ 
//	       str.append("<span class='span_box_1'><A href='./"+url+"?nowPage="+nowPage+"&col="+col+"&word="+word+"&bbsno="+bbsno+"&nPage="+i+"'>"+i+"</A></span>");   
//	     } 
//	   } 
//	    
//	   _nowPage = (nowGrp * pagePerBlock)+1; // 10개 다음 페이지로 이동 
//	   if (nowGrp < totalGrp){ 
//	     str.append("<span class='span_box_1'><A href='./"+url+"?nowPage="+nowPage+"&col="+col+"&word="+word+"&bbsno="+bbsno+"&nPage="+_nowPage+"'>다음</A></span>"); 
//	   } 
//	   str.append("</DIV>"); 
//	    
//	   return str.toString(); 
//	 } 
	 /**
	   * 2010-12-14 형식의 날짜를 리턴합니다.
	   * @return 2008-01-30 형식의 문자열 리턴
	   */
	  public static String getDate6(int year, int month, int day){
	      SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
	      
	      new Date();
	      String date = sd.format(new Date(year-1900, month, day));
	 
	      // System.out.println(date);        
	      return date;
	  }
	  private static final String root ="/blog";
	  
	  public static synchronized String getRoot(){
	    return root;
	  }
		 
	/** 
     * 파일업로드 처리(model1,mvc) 
     * @param fileItem 
     * @param upDir 
     * @return 
     */ 
    public static String saveFile(MultipartFile multipartFile, String basePath) { 
        // input form's parameter name 
        String fileName = ""; 
        // original file name 
        String originalFileName = multipartFile.getOriginalFilename(); 
        // file content type 
        String contentType = multipartFile.getContentType(); 
        // file size 
        long fileSize = multipartFile.getSize(); 
         
        System.out.println("fileSize: " + fileSize); 
        System.out.println("originalFileName: " + originalFileName); 
         
        InputStream inputStream = null; 
        OutputStream outputStream = null; 
 
        try { 
            if( fileSize > 0 ) { // 파일이 존재한다면 
                // 인풋 스트림을 얻는다. 
                inputStream = multipartFile.getInputStream(); 
 
                File oldfile = new File(basePath, originalFileName); 
             
                if ( oldfile.exists()){ 
                    for(int k=0; true; k++){ 
                        //파일명 중복을 피하기 위한 일련 번호를 생성하여 
                        //파일명으로 조합 
                        oldfile = new File(basePath,"("+k+")"+originalFileName); 
                     
                        //조합된 파일명이 존재하지 않는다면, 일련번호가 
                        //붙은 파일명 다시 생성 
                        if(!oldfile.exists()){ //존재하지 않는 경우 
                            fileName = "("+k+")"+originalFileName; 
                            break; 
                        } 
                    } 
                }else{ 
                    fileName = originalFileName; 
                } 
                //make server full path to save 
                String serverFullPath = basePath + "\\" + fileName; 
                 
                System.out.println("fileName: " + fileName); 
                System.out.println("serverFullPath: " + serverFullPath); 
                 
                outputStream = new FileOutputStream( serverFullPath ); 
  
                // 버퍼를 만든다. 
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
		File file = new File(upDir,oldfile);
		
		if(file.exists()){
			file.delete();
		}
	}
	/** 
	   * 직업 코드를 받아서 해당하는 값(레이블)을 리턴 
	   * @param key 
	   * @return 
	   */ 
	  public static String  getCodeValue(String key) { 
	    Hashtable codes = new Hashtable(); 

	    codes.put("A01", "회사원"); 
	    codes.put("A03", "전산관련직"); 
	    codes.put("A05", "연구전문직"); 
	    codes.put("A07", "각종학교학생"); 
	    codes.put("A09", "일반자영업"); 
	    codes.put("A11", "공무원"); 
	    codes.put("A13", "의료인"); 
	    codes.put("A15", "법조인"); 
	       codes.put("A17", "종교.언론/예술인"); 
	    codes.put("A19", "농업"); 
	    codes.put("A23", "축산업"); 
	    codes.put("A25", "수산업"); 
	    codes.put("A27", "광업"); 
	    codes.put("A30", "주부"); 
	    codes.put("A32", "무직"); 
	    codes.put("A99", "기타"); 
	     
	    Object value = codes.get(key); // A01 ~ A99가 추출 

	    return (String)(value); // 코드값에 해당하는 직업 리턴 
	  } 

	/**
	 * 오늘,어제,그제 날짜 가져오기
	 * 
	 * @return List- 날짜들 저장
	 */
	public static List<String> getDay() {
		List<String> list = new ArrayList<String>();

		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();// 추상클래스라서 new안함.날짜불러오기
		for (int j = 0; j < 3; j++) {
			list.add(sd.format(cal.getTime()));// 오늘 날짜
			cal.add(Calendar.DATE, -1);// 어제날짜
		}

		return list;
	}

	/**
	 * 등록날짜와 오늘,어제,그제날짜와 비교
	 * 
	 * @param wdate
	 *            - 등록날짜
	 * @return - true:오늘,어제,그제중 등록날짜와 같음 false:오늘,어제,그제 날짜가 등록날짜와 다 다름
	 */
	public static boolean compareDay(String wdate) {// wdate등록날짜
		boolean flag = false;
		List<String> list = getDay();
		if (wdate.equals(list.get(0)) || wdate.equals(list.get(1)) || wdate.equals(list.get(2))) {
			flag = true;
		}

		return flag;
	}

	public static String nullCheck(String str) {
		if (str == null) {
			str = "";
		}
		return str;
	}
}
