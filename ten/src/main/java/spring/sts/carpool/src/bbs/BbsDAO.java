package bbs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import utility.DBClose;
import utility.DBOpen;

public class BbsDAO {
	/**
	 * 전체 레코드 갯수를 가져옴
	 * @param col
	 * @param word
	 * @return int total
	 */
	
 public int total(String col, String word){
	 int total=0;
		Connection con=DBOpen.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		StringBuffer sql=new StringBuffer();
		sql.append(" select count(*) from bbs ");
		if(word.trim().length()>0){
			sql.append(" Where "+col+" like '%'||?||'%' ");
		}
		try {
			pstmt=con.prepareStatement(sql.toString());
			if(word.trim().length()>0){
				pstmt.setString(1, word);
			}
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				total=rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	 return total;
 }
	
	public int create(BbsDTO dto){
		int cnt=0;
		Connection con=DBOpen.getConnection();
		PreparedStatement pstmt=null;
		StringBuffer sql=new StringBuffer();
		sql.append("INSERT INTO bbs(bbsno, wname, title, content, passwd, wdate,grpno)   ");
		sql.append("VALUES((SELECT NVL(MAX(bbsno), 0) + 1 as bbsno FROM bbs),  ");
		sql.append("?, ?, ?, ?, sysdate,    ");
		sql.append(" (SELECT NVL(MAX(grpno), 0) + 1 as grpno FROM bbs))  ");

		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getWname());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getPasswd());
			
			cnt=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(con, pstmt);
		}
		
		
		return cnt;
	}

	  /**  * 목록  
	  * @return List 목록
	  */
	 public List<BbsDTO> list(Map map){
	   Connection con = DBOpen.getConnection();
	   PreparedStatement pstmt = null;
	   ResultSet rs = null;
	   StringBuffer sql = null; // String 보다 처리 속도가 수만배 빠름.
	   List<BbsDTO> list = null;	   
	   int sno=(Integer)map.get("sno");
	   int eno=(Integer)map.get("eno");
	   String col=(String)map.get("col");
	   String word=(String)map.get("word");
	   sql = new StringBuffer();
	   sql.append("SELECT bbsno, wname, title,viewcnt, wdate, grpno, indent, ansnum, r ");
	   sql.append("		from( ");
	   sql.append("			 SELECT bbsno, wname, title,viewcnt, wdate, grpno, indent, ansnum, rownum r   ");
	   sql.append("				from(SELECT bbsno, wname, title,viewcnt, wdate, grpno, indent, ansnum  ");
	   sql.append("						FROM bbs   ");
	   if(word.trim().length()>0)
		   sql.append("  where "+col+" like '%' || ? || '%' " );
	   sql.append("						ORDER BY grpno DESC, ansnum ");
	   sql.append("			) ");
	   sql.append(") ");
	   sql.append("	where r>=? AND r<=? ");

	  
	   try{
		   int i=1;
	     pstmt = con.prepareStatement(sql.toString());
	     if(word.trim().length()>0)
	    	 pstmt.setString(i++, word);
	     pstmt.setInt(i++, sno);
	     pstmt.setInt(i++, eno);
	     rs = pstmt.executeQuery();
	     list = new ArrayList<BbsDTO>();
	     
	     while(rs.next() == true){
	    	 BbsDTO dto = new BbsDTO();
	       dto.setBbsno(rs.getInt("bbsno"));   // 컬럼 -> 변수로 변환, DBMS -> JAVA
	       dto.setWname(rs.getString("wname"));
	       dto.setTitle(rs.getString("title"));
	       dto.setViewcnt(rs.getInt("viewcnt"));
	       dto.setWdate(rs.getString("wdate"));
	       dto.setGrpno(rs.getInt("grpno"));
	       dto.setIndent(rs.getInt("indent"));
	       dto.setAnsnum(rs.getInt("ansnum"));
	    
	       
	       list.add(dto);                     // 저장소에 하나의 객체를 저장
	       
	     }
	   }catch(Exception e){
	     e.printStackTrace();
	   }finally{
	     DBClose.close(con, pstmt, rs);
	   }
	   
	   return list;
	 }
   
	 /**
	   * 조회
	   * @param bbsno 조회할 글 번호
	   * @return
	   */
	  public BbsDTO read(int bbsno){
	    Connection con = DBOpen.getConnection();
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    StringBuffer sql = null; // String 보다 처리 속도가 수만배 빠름.
	    BbsDTO dto = null;        // 하나의 글에 해당
	    
	    sql = new StringBuffer();
	    sql.append(" SELECT bbsno, wname, title, content, viewcnt, wdate");
	    sql.append(" FROM bbs");
	    sql.append(" WHERE bbsno = ?");
	   
	    try{
	      pstmt = con.prepareStatement(sql.toString());
	      pstmt.setInt(1, bbsno);
	      
	      rs = pstmt.executeQuery();
	      
	      if(rs.next() == true){
	        String title = rs.getString("title");
	        String content = rs.getString("content");
	        String wname = rs.getString("wname");
	        int viewcnt = rs.getInt("viewcnt");
	        String wdate = rs.getString("wdate");
	        
	        dto = new BbsDTO();         // 하나의 레코드를 하나의 객체로 변환
	        dto.setBbsno(bbsno);
	        dto.setWname(wname);
	        dto.setTitle(title);
	        dto.setContent(content);
	        dto.setViewcnt(viewcnt);
	        dto.setWdate(wdate);
	      
	      }
	    }catch(Exception e){
	      e.printStackTrace();
	    }finally{
	      DBClose.close(con, pstmt, rs);
	    }
	    
	    return dto;
	  }
	 
	  /**
	   * 조회수 증가
	   * @param memono 조회수 증가할 글 번호
	   */
	  public void increaseViewcnt(int bbsno){
	    Connection con = DBOpen.getConnection();
	    PreparedStatement pstmt = null;
	    StringBuffer sql = null; // String 보다 처리 속도가 수만배 빠름.
	    
	    sql = new StringBuffer();
	    sql.append(" UPDATE bbs");
	    sql.append(" SET viewcnt = viewcnt + 1");
	    sql.append(" WHERE bbsno = ?");
	   
	    try{
	      pstmt = con.prepareStatement(sql.toString());
	      pstmt.setInt(1, bbsno);
	      
	      pstmt.executeUpdate();
	      
	    }catch(Exception e){
	      e.printStackTrace();
	    }finally{
	      DBClose.close(con, pstmt);
	    }    
	  }
	  
	  /**
	   * 패스워드를 검사합니다.
	   * @param bbsno 글 번호
	   * @param passwd 패스워드 
	   * @return 0: 패스워드 일치하지 않음, 1: 패스워드 일치
	   */
	  public int checkPasswd(int bbsno, String passwd){
	    Connection con = DBOpen.getConnection();
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    StringBuffer sql = null; // String 보다 처리 속도가 수만배 빠름.
	    int cnt = 0;             // 레코드 갯수
	    
	    sql = new StringBuffer();
	    sql.append(" SELECT COUNT(bbsno) as cnt");
	    sql.append(" FROM bbs");
	    sql.append(" WHERE bbsno=? AND passwd=?");
	   
	    try{
	      pstmt = con.prepareStatement(sql.toString());
	      pstmt.setInt(1, bbsno);
	      pstmt.setString(2, passwd);
	      
	      rs = pstmt.executeQuery();
	      
	      if(rs.next() == true){
	        cnt = rs.getInt("cnt");
	      }
	    }catch(Exception e){
	      e.printStackTrace();
	    }finally{
	      DBClose.close(con, pstmt, rs);
	    }
	    
	    return cnt;
	  }
	  
	  /**
	   * 메모를 수정합니다.
	   * @param vo 수정할 데이터가 있는 객체
	   * @return 저장된 레코드 갯수
	   */
	  public int update(BbsDTO dto){
	    Connection con = DBOpen.getConnection();
	    PreparedStatement pstmt = null;
	    StringBuffer sql = null; // String 보다 처리 속도가 수만배 빠름.
	    int cnt = 0;             // return 할 레코드 갯수
	    
	    sql = new StringBuffer();
	    sql.append(" UPDATE bbs");
	    sql.append(" SET wname=?, title=?, content=?");
	    sql.append(" WHERE bbsno = ?");
	   
	    try{
	      pstmt = con.prepareStatement(sql.toString());
	      pstmt.setString(1, dto.getWname());
	      pstmt.setString(2, dto.getTitle());
	      pstmt.setString(3, dto.getContent());
	      pstmt.setInt(4, dto.getBbsno());
	      
	      cnt = pstmt.executeUpdate(); // 0 or 1
	    }catch(Exception e){
	      System.out.println(e.toString());
	    }finally{
	      DBClose.close(con, pstmt);
	    }
	    
	    return cnt;
	  }
	  /**   * 글을 삭제합니다.
	   * @param 삭제할 글 번호
	   * @return 삭제된 레코드 갯수
	   */
	  public int delete(int bbsno){
	    Connection con = DBOpen.getConnection();
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    StringBuffer sql = null; // String 보다 처리 속도가 수만배 빠름.
	    int cnt = 0;             // return 할 레코드 갯수
	    
	    sql = new StringBuffer();
	    sql.append(" DELETE FROM bbs");
	    sql.append(" WHERE bbsno = ?");
	   
	    try{
	      pstmt = con.prepareStatement(sql.toString());
	      pstmt.setInt(1, bbsno);
	      
	      cnt = pstmt.executeUpdate(); // 0 or 1
	    }catch(Exception e){
	      System.out.println(e.toString());
	    }finally{
	      DBClose.close(con, pstmt);
	    }
	    
	    return cnt;
	  }

	  /**
	   * 답변을 위한 조회
	   * @param bbsno 조회할 글 번호
	   * @return dto -bbsno,title,grpno,indent,ansnum
	   */
	  public BbsDTO readReply(int bbsno){
		  Connection con = DBOpen.getConnection();
		    PreparedStatement pstmt = null;
		    ResultSet rs = null;
		    StringBuffer sql = null; // String 보다 처리 속도가 수만배 빠름.
		    BbsDTO dto = null; 
	    sql = new StringBuffer();
	    sql.append(" SELECT bbsno,title,grpno,indent,ansnum ");
	    sql.append(" FROM bbs");
	    sql.append(" WHERE bbsno = ?");
	   
	    try{
	      pstmt = con.prepareStatement(sql.toString());
	      pstmt.setInt(1, bbsno);
	      
	      rs = pstmt.executeQuery();
	      
	      if(rs.next() == true){
	        String title = rs.getString("title"); 
	        int grpno = rs.getInt("grpno");
	        int indent = rs.getInt("indent");
	        int ansnum = rs.getInt("ansnum");
	        
	        dto = new BbsDTO();         // 하나의 레코드를 하나의 객체로 변환
	        dto.setBbsno(bbsno);
	        dto.setTitle(title);
	        dto.setGrpno(grpno);
	        dto.setIndent(indent);
	        dto.setAnsnum(ansnum);
	      
	      }
	    }catch(Exception e){
	      e.printStackTrace();
	    }finally{
	      DBClose.close(con, pstmt, rs);
	    }
	    
	    return dto;
	  }
	  /** 
	   * 답변 등록, 등록한 레코드 갯수 리턴: 0 , 1 
	   *  
	   * @param dto 
	   *          저장할 객체 
	   * @return 저장된 레코드 수 
	   */ 
	  public int reply(BbsDTO dto) { 
	    Connection con = DBOpen.getConnection(); // DBMS 연결 
	    PreparedStatement pstmt = null; 
	    int cnt = 0; 

	    try { 
	      StringBuffer sql = new StringBuffer(); 
	      sql.append(" INSERT INTO bbs(bbsno, wname, title, content, passwd, viewcnt, wdate, grpno, indent, ansnum)"); 
	      sql.append(" VALUES((SELECT NVL(MAX(bbsno), 0) + 1 as bbsno FROM bbs), ?, ?, ?, ?, 0, sysdate, ?, ?, ?)"); 

	      pstmt = con.prepareStatement(sql.toString()); 
	      pstmt.setString(1, dto.getWname()); 
	      pstmt.setString(2, dto.getTitle()); 
	      pstmt.setString(3, dto.getContent()); 
	      pstmt.setString(4, dto.getPasswd()); 
	      pstmt.setInt(5, dto.getGrpno()); // 부모의그룹번호 
	      pstmt.setInt(6, dto.getIndent()+1); 
	      pstmt.setInt(7, dto.getAnsnum()+1); 

	      cnt = pstmt.executeUpdate(); 
	    } catch (Exception e) { 
	      System.out.println(e.toString()); 
	    } finally { 
	      DBClose.close(con, pstmt); 
	    } 

	    return cnt; 
	  } 

	  /** 
	   * 답변 순서 증가 
	   * @param grpno 그룹 번호 
	   * @param ansnum 답변 순서 
	   */ 
	  public void addAnsnum(int grpno, int ansnum){ 
	    Connection con = DBOpen.getConnection();  // DBMS 연결 
	    PreparedStatement pstmt = null; 
	     
	    try{ 
	      StringBuffer sql = new StringBuffer(); 
	      sql.append(" UPDATE bbs" ); 
	      sql.append(" SET ansnum = ansnum + 1" ); 
	      sql.append(" WHERE grpno=? AND ansnum >?" ); 
 
	      pstmt = con.prepareStatement(sql.toString()); 
	      pstmt.setInt(1, grpno); 
	      pstmt.setInt(2, ansnum); 

	      pstmt.executeUpdate(); 
	    }catch(Exception e){ 
	      System.out.println(e.toString()); 
	    }finally{ 
	      DBClose.close(con, pstmt); 
	    } 
	     
	  }   

	  
} 