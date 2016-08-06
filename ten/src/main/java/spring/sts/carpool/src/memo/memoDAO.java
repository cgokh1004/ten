package memo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import utility.DBClose;
import utility.DBOpen;



public class memoDAO {//Data Access Object :데이터베이스 처리
	public int total(String col,String word){
		int total=0;
		Connection con=DBOpen.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		StringBuffer sql=new StringBuffer();
		sql.append(" select count(*) from memo ");
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
		}
		
		return total;
	}
	
	public void upViewcnt(int memono){
		Connection con=DBOpen.getConnection();
		PreparedStatement pstmt=null;
		StringBuffer sql=new StringBuffer();
		sql.append("update memo   ");
		sql.append("set viewcnt = viewcnt + 1   ");
		sql.append("where memono = ?   ");
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, memono);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBClose.close(con, pstmt);
		}
		
		
	}
	public List<memoVO> list(Map map){
		List<memoVO> list=new ArrayList<memoVO>();
		Connection con=DBOpen.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int sno= (Integer) map.get("sno");
		int eno= (Integer) map.get("eno");
		String col=(String) map.get("col");
		String word=(String) map.get("word");
		
		StringBuffer sql=new StringBuffer();
		sql.append("select memono, title, viewcnt,to_char(wdate,'yyyy-mm-dd')wdate, r ");
		sql.append("from( ");
		sql.append("	select memono, title, viewcnt,wdate,rownum r ");
		sql.append("	from( ");
		sql.append("		select memono, title, viewcnt,wdate ");
		sql.append("		from MEMO ");
		if(word.trim().length()>0)
			sql.append(" where "+col+" like '%'||?||'%' ");
		sql.append("		order by memono desc ");
		sql.append("	 ) ");
		sql.append(" ) ");
		sql.append("	 where r>=? and r<=? ");
		
		try {
			int i=1;
			pstmt=con.prepareStatement(sql.toString());
			if(word.trim().length()>0)
				pstmt.setString(i++, word);
			pstmt.setInt(i++, sno);
			pstmt.setInt(i++, eno);

			rs=pstmt.executeQuery();
			while(rs.next()){
				memoVO vo=new memoVO();
				vo.setMemono(rs.getInt("memono"));
				vo.setTitle(rs.getString("title"));
				vo.setViewcnt(rs.getInt("viewcnt"));
				vo.setWdate(rs.getString("wdate"));
				
				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBClose.close(con, pstmt, rs);
		}
		
		
		
		return list;
	}
	
	public int delete(int memono){
		int cnt=0;
		Connection con=DBOpen.getConnection();
		PreparedStatement pstmt=null;
		StringBuffer sql=new StringBuffer();
		sql.append("delete from memo ");
		sql.append("where memono=? ");
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, memono);
			
			cnt=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBClose.close(con, pstmt);
		}
		return cnt;
	}
	
	public int update(memoVO vo){
		int cnt=0;
		Connection con=DBOpen.getConnection();
		PreparedStatement pstmt=null;
		StringBuffer sql=new StringBuffer();
		sql.append("UPDATE memo ");
		sql.append("SET title = ?, ");
		sql.append("content = ? ");
		sql.append("WHERE memono = ? ");
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setInt(3, vo.getMemono());
			
			cnt=pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBClose.close(con, pstmt);
		}
		
		return cnt;
	}

		public memoVO read(int memono){
			memoVO vo=null;
			Connection con=DBOpen.getConnection();
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			StringBuffer sql=new StringBuffer();
			sql.append("select * From memo Where memono = ? ");
			try {
				pstmt=con.prepareStatement(sql.toString());
				pstmt.setInt(1, memono);
				rs=pstmt.executeQuery();
				
				if(rs.next()){
					vo=new memoVO();
					vo.setMemono(rs.getInt("memono"));
					vo.setTitle(rs.getString("title"));
					vo.setContent(rs.getString("content"));
					vo.setViewcnt(rs.getInt("viewcnt"));
					vo.setWdate(rs.getString("wdate"));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				DBClose.close(con, pstmt, rs);
			}
			return vo;
			

			
		}
		public int create(memoVO vo){
		int cnt=0;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt=null;
		StringBuffer sql= new StringBuffer();
		
		sql.append(" INSERT INTO memo(memono, title, content, wdate) ");
		sql.append(" values(memo_seq.nextval, ?, ?, sysdate) ");
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2,vo.getContent());
			
			cnt=pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBClose.close(con,pstmt);
		}
		
		return cnt;
	}
}
