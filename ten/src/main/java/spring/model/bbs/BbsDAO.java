package spring.model.bbs;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class BbsDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;

	
	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}

	/**
	 * 전체 레코드 갯수를 가져옴
	 * @param col
	 * @param word
	 * @return int total
	 */
	
 public int total(String col, String word){
	 Map map=new HashMap();
	 map.put("col", col);
	 map.put("word", word);
	 return mybatis.selectOne("bbs.total", map);
 }
	

	public int create(BbsDTO dto){
		return mybatis.insert("bbs.create", dto);
	}

	  /**  * 목록  
	  * @return List 목록
	  */
	 public List<BbsDTO> list(Map map){   
	   return mybatis.selectList("bbs.list", map);
	 }
   
	 /**
	   * 조회
	   * @param bbsno 조회할 글 번호
	   * @return
	   */
	  public BbsDTO read(int bbsno){
	    return mybatis.selectOne("bbs.read", bbsno);
	  }
	 
	  /**
	   * 조회수 증가
	   * @param memono 조회수 증가할 글 번호
	   */
	  public void increaseViewcnt(int bbsno){
	   mybatis.update("bbs.increaseViewcnt", bbsno);
	  }
	  
	  /**
	   * 패스워드를 검사합니다.
	   * @param bbsno 글 번호
	   * @param passwd 패스워드 
	   * @return 0: 패스워드 일치하지 않음, 1: 패스워드 일치
	   */
	  public int checkPasswd(int bbsno, String passwd){
		  Map map=new HashMap();
		  map.put("bbsno", bbsno);
		  map.put("passwd", passwd);
	    return mybatis.selectOne("bbs.checkPasswd", map);
	  }
	  
	  /**
	   * 메모를 수정합니다.
	   * @param vo 수정할 데이터가 있는 객체
	   * @return 저장된 레코드 갯수
	   */
	  public int update(BbsDTO dto){	   
	    return mybatis.update("bbs.update", dto);
	  }
	  /**   * 글을 삭제합니다.
	   * @param 삭제할 글 번호
	   * @return 삭제된 레코드 갯수
	   */
	  public int delete(int bbsno){
	    return mybatis.delete("bbs.delete", bbsno);
	  }

	  /**
	   * 답변을 위한 조회
	   * @param bbsno 조회할 글 번호
	   * @return dto -bbsno,title,grpno,indent,ansnum
	   */
	  public BbsDTO readReply(int bbsno){
	    return mybatis.selectOne("bbs.readReply", bbsno);
	  }
	  /** 
	   * 답변 등록, 등록한 레코드 갯수 리턴: 0 , 1 
	   *  
	   * @param dto 
	   *          저장할 객체 
	   * @return 저장된 레코드 수 
	   */ 
	  public int reply(BbsDTO dto) { 
	     return mybatis.insert("bbs.reply", dto); 
	  } 

	  /** 
	   * 답변 순서 증가 
	   * @param grpno 그룹 번호 
	   * @param ansnum 답변 순서 
	   */ 
	  public void addAnsnum(int grpno, int ansnum){ 
		  Map map=new HashMap();
		  map.put("grpno", grpno);
		  map.put("ansnum", ansnum);
		  mybatis.update("bbs.addAnsnum", map);
	  }   

	  
} 