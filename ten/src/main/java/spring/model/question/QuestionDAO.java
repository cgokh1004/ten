package spring.model.question;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class QuestionDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	public SqlSessionTemplate getMybatis() {
		return mybatis;
	}

	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}

	public boolean bdelete(int qno){
	     boolean flag = false;
	     int cnt = mybatis.delete("reply.bdelete", qno);
	     if(cnt>0) flag = true;
	 
	     return flag;
	}
	
	public int total(String col, String word){
		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		
		return mybatis.selectOne("question.total", map);
	}

	public int create(QuestionDTO dto) {
		
		return mybatis.insert("question.create", dto);
	}

	public List<QuestionDTO> list(Map map) {

		return mybatis.selectList("question.list", map);
	}

	public QuestionDTO read(int qno) {
				
		return mybatis.selectOne("question.read", qno);
	}

	  public void increaseViewcnt(int qno){
		  
	    mybatis.update("question.increaseViewcnt", qno);
	    
	  }  
 
	  public int reply(QuestionDTO dto) { 
		  
	   return mybatis.insert("question.reply", dto); 
	  } 

	  public void addAnsnum(int groupno, int ansnum){
		  
		  Map map = new HashMap();
		  map.put("groupno", groupno);
		  map.put("ansnum", ansnum);
		  
	    mybatis.update("question.addAnsnum", map);
	     
	  }   

	  public QuestionDTO readReply(int qno){
		 return mybatis.selectOne("question.readReply", qno);
	  }
	  
	  
	public int delete(int qno) {
		
		return mybatis.delete("question.delete", qno);
	}
	
	public int update(QuestionDTO dto){
		
		return mybatis.update("question.update", dto);
	}

	  public int checkID(int qno, String id){
		  
		  Map map = new HashMap();
		  map.put("qno", qno);
		  map.put("id", id);
		  
	    return mybatis.selectOne("question.checkID", map);
	  }
}
