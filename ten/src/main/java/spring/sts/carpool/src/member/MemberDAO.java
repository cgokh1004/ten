package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.sun.corba.se.spi.orbutil.fsm.Guard.Result;

import utility.DBClose;
import utility.DBOpen;
public class MemberDAO {
	
	public String pwFind(String id,String mname){
		String passwd="";
		Connection con= DBOpen.getConnection();
		 PreparedStatement pstmt = null;
		 ResultSet rs = null;
		 
		 StringBuffer sql = new StringBuffer();
		 sql.append(" SELECT passwd FROM member ");
		 sql.append(" WHERE id =? and mname=? ");
		
		 try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			pstmt.setString(2, mname);
			
			rs=pstmt.executeQuery();
			if(rs.next()){
				passwd=rs.getString("passwd");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBClose.close(con, pstmt, rs);
		}
		return passwd;
	}
	public String idFind(String mname,String email){
		String id="";
		Connection con= DBOpen.getConnection();
		 PreparedStatement pstmt = null;
		 ResultSet rs = null;
		 
		 StringBuffer sql = new StringBuffer();
		 sql.append(" SELECT id FROM member ");
		 sql.append(" WHERE mname =? and email=? ");
		
		 try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, mname);
			pstmt.setString(2, email);
		rs=pstmt.executeQuery();
		if(rs.next()){
			id=rs.getString("id");
		}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBClose.close(con, pstmt, rs);
		}
		return id;
	}
	
	 public String getGrade(String id){
		 String grade = null;
		 Connection con= DBOpen.getConnection();
		 PreparedStatement pstmt = null;
		 ResultSet rs = null;
		 
		 StringBuffer sql = new StringBuffer();
		 sql.append(" SELECT grade FROM member ");
		 sql.append(" WHERE id = ? ");
		 
		 try {
		pstmt = con.prepareStatement(sql.toString());
		pstmt.setString(1, id);
		 
		rs = pstmt.executeQuery();
		 
		if(rs.next()){
		grade = rs.getString("grade");
		}
		 
		} catch (SQLException e) {
		e.printStackTrace();
		}finally{
			DBClose.close(con, pstmt, rs);
		}

		 return grade;
		 }
	 
	 
	public int loginCheck(String id,String passwd){
		int cnt=0;
		Connection con=DBOpen.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		StringBuffer sql=new StringBuffer();
		sql.append(" select count(id) from member ");
		sql.append(" where id=? and passwd=? ");
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			pstmt.setString(2, passwd);
			rs=pstmt.executeQuery();
			if(rs.next()){
				cnt=rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBClose.close(con, pstmt, rs);
		}
		
		
		return cnt;
	}
	public int delete(String id){
		int cnt=0;
		Connection con=DBOpen.getConnection();
		PreparedStatement pstmt=null;
		
		StringBuffer sql=new StringBuffer();
		sql.append(" delete from member ");
		sql.append(" where id=? ");
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			
			cnt=pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBClose.close(con, pstmt);
		}
		return cnt;
	}
	public String getFname(String id){
		String fname=null;
		Connection con=DBOpen.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		StringBuffer sql=new StringBuffer();
		sql.append(" select fname from member ");
		sql.append(" where id=? ");
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()){
				fname=rs.getString("fname");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBClose.close(con, pstmt, rs);
		}
		return fname;
	}
	public int update(MemberDTO dto){
		int cnt=0;
		  Connection con=DBOpen.getConnection();
		  PreparedStatement pstmt=null;
		  
		  StringBuffer sql=new StringBuffer();
		  sql.append(" update member      ");
		  sql.append(" set    tel=?,      ");
		  sql.append(" 		  email=?,    ");
		  sql.append(" 		  zipcode=?,   ");
		  sql.append(" 		  address1=?, ");
		  sql.append(" 		  address2=?, ");
		  sql.append(" 		  job=?       ");
		  sql.append(" where  id=?        ");
		  
		  try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getTel());
			pstmt.setString(2, dto.getEmail());
			pstmt.setString(3, dto.getZipcode());
			pstmt.setString(4, dto.getAddress1());
			pstmt.setString(5, dto.getAddress2());
			pstmt.setString(6, dto.getJob());
			pstmt.setString(7, dto.getId());
			
			cnt=pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBClose.close(con, pstmt);
		}
		  
		  return cnt;
	}
	
  public int updatePasswd(String id,String passwd){
	  int cnt=0;
	  Connection con=DBOpen.getConnection();
	  PreparedStatement pstmt=null;
	  
	  StringBuffer sql=new StringBuffer();
	  sql.append(" update member ");
	  sql.append(" set passwd=? ");
	  sql.append(" where id=? ");
	  
	  try {
		pstmt=con.prepareStatement(sql.toString());
		pstmt.setString(1, passwd);
		pstmt.setString(2, id);
		cnt=pstmt.executeUpdate();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally{
		DBClose.close(con, pstmt);
	}
	  return cnt;
  }
	
	public int updateFile(String id,String fname){
		int cnt=0;
		Connection con=DBOpen.getConnection();
		PreparedStatement pstmt=null;
		
		StringBuffer sql=new StringBuffer();
		sql.append(" update member ");
		sql.append(" set fname=? ");
		sql.append(" where id=? ");
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, fname);
			pstmt.setString(2, id);
			
			cnt=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBClose.close(con, pstmt);
		}
		
		
		return cnt;
	}
	
	public MemberDTO read(String id){
		MemberDTO dto=null;
		Connection con=DBOpen.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		StringBuffer sql=new StringBuffer();
		sql.append(" select * From member ");
		sql.append(" where id=? ");
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				dto=new MemberDTO();
				dto.setId(rs.getString("id"));
				dto.setTel(rs.getString("tel"));
				dto.setEmail(rs.getString("email"));
				dto.setJob(rs.getString("job"));
				dto.setZipcode(rs.getString("zipcode"));
				dto.setFname(rs.getString("fname"));
				dto.setAddress1(rs.getString("address1"));
				dto.setAddress2(rs.getString("address2"));
				dto.setMdate(rs.getString("mdate"));
				dto.setMname(rs.getString("mname"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBClose.close(con, pstmt, rs);
		}
		return dto;
	}
	
	public int total(String col,String word){
		int total=0;
		Connection con=DBOpen.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		StringBuffer sql=new StringBuffer();
		sql.append(" select count(*) From member ");
		if(word.trim().length()>0)
			sql.append(" where "+col+" like '%'||?||'%' ");
		
		try {

			pstmt=con.prepareStatement(sql.toString());
			if(word.trim().length()>0)
				pstmt.setString(1, word);
			
			rs=pstmt.executeQuery();
			if(rs.next()){
				total=rs.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBClose.close(con, pstmt, rs);
		}
		
		
		return total;
	}
	
	public List<MemberDTO> list(Map map){
		List<MemberDTO> list=new ArrayList<MemberDTO>();
		Connection con=DBOpen.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int sno=(Integer)map.get("sno");
		int eno=(Integer)map.get("eno");
		String col=(String)map.get("col");
		String word=(String)map.get("word");
		StringBuffer sql=new StringBuffer();
		sql.append("SELECT id, mname, tel, email,  address1, address2, fname, r ");
		sql.append("from( ");
		sql.append("	SELECT id, mname, tel, email,  address1, address2, fname, rownum r ");
		sql.append("	 from( ");
		sql.append("			SELECT id, mname, tel, email,  address1, address2, fname  ");
		sql.append("			FROM member ");
		if(word.trim().length()>0)
		sql.append("			where "+col+" like '%'||?||'%' ");
		sql.append("			ORDER BY id ASC ");
		sql.append("	 	) ");
		sql.append("	 ) ");
		sql.append("where r>=? and r<=? ");
		
		try {
			int i=0;
			pstmt=con.prepareStatement(sql.toString());
			if(word.trim().length()>0)
				pstmt.setString(++i, word);
				pstmt.setInt(++i, sno);
				pstmt.setInt(++i, eno);
				
				rs=pstmt.executeQuery();
				
			while(rs.next()){
				MemberDTO dto=new MemberDTO();
				dto.setId(rs.getString("id"));
				dto.setMname(rs.getString("mname"));
				dto.setFname(rs.getString("fname"));
				dto.setEmail(rs.getString("email"));
				dto.setAddress1(rs.getString("address1"));
				dto.setAddress2(rs.getString("address2"));
				dto.setTel(rs.getString("tel"));
				list.add(dto);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBClose.close(con, pstmt, rs);
		}
		
		return list;
	}
	
	
public int create(MemberDTO dto){ 
    Connection con = DBOpen.getConnection(); 
    PreparedStatement pstmt = null; 
    StringBuffer sql = new StringBuffer(); 
    int cnt = 0; 
     
    try{ 
      sql.append(" INSERT INTO member(id, passwd, mname, tel, email, zipcode, "); 
      sql.append("                    address1, address2, job, mdate, fname)"); 
      sql.append(" VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate, ?)"); 
       
      pstmt = con.prepareStatement(sql.toString()); 
      pstmt.setString(1, dto.getId()); 
      pstmt.setString(2, dto.getPasswd()); 
      pstmt.setString(3, dto.getMname()); 
      pstmt.setString(4, dto.getTel()); 
      pstmt.setString(5, dto.getEmail()); 
      pstmt.setString(6, dto.getZipcode()); 
      pstmt.setString(7, dto.getAddress1()); 
      pstmt.setString(8, dto.getAddress2()); 
      pstmt.setString(9, dto.getJob()); 
      pstmt.setString(10, dto.getFname()); 
      
      cnt = pstmt.executeUpdate(); 
       
    }catch(Exception e){ 
      System.out.println(e.toString()); 
    }finally{ 
      DBClose.close(con, pstmt); 
    } 
    return cnt; 
  } 


	public int duplicateEmail(String email){
		int cnt=0;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		StringBuffer sql=new StringBuffer();
		sql.append(" select count(email) From member ");
		sql.append(" where email=? ");
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, email);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				cnt=rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBClose.close(con, pstmt, rs);
		}
		return cnt;
	}
	public int duplicateID(String id){
		int cnt=0;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		StringBuffer sql=new StringBuffer();
		sql.append(" select count(id) From member ");
		sql.append(" where id=? ");
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				cnt=rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBClose.close(con, pstmt, rs);
		}
		return cnt;
	}
		
}
