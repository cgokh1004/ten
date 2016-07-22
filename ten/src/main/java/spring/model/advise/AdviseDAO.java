package spring.model.advise;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class AdviseDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	public SqlSessionTemplate getMybatis() {
		return mybatis;
	}

	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}

	public boolean bdelete(int advno){
	     boolean flag = false;
	     int cnt = mybatis.delete("reply.bdelete", advno);
	     if(cnt>0) flag = true;
	 
	     return flag;
	}
	
	public int total(String col, String word){
		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		
		return mybatis.selectOne("advise.total", map);
	}

	public int create(AdviseDTO dto) {
		
		return mybatis.insert("advise.create", dto);
	}

	public List<AdviseDTO> list(Map map) {

		return mybatis.selectList("advise.list", map);
	}

	public AdviseDTO read(int advno) {
				
		return mybatis.selectOne("advise.read", advno);
	}

	  public void increaseViewcnt(int advno){
		  
	    mybatis.update("advise.increaseViewcnt", advno);
	    
	  }  
 
	  public int reply(AdviseDTO dto) { 
		  
	   return mybatis.insert("advise.reply", dto); 
	  } 

	  public void addAnsnum(int grpno, int ansnum){
		  
		  Map map = new HashMap();
		  map.put("groupno", grpno);
		  map.put("ansnum", ansnum);
		  
	    mybatis.update("advise.addAnsnum", map);
	     
	  }   

	  public AdviseDTO readReply(int advno){
		 return mybatis.selectOne("advise.readReply", advno);
	  }
	  
	  
	public int delete(int advno) {
		
		return mybatis.delete("bbs.delete", advno);
	}
	
	public int update(AdviseDTO dto){
		
		return mybatis.update("bbs.update", dto);
	}

	  public int checkID(int advno, String id){
		  
		  Map map = new HashMap();
		  map.put("advno", advno);
		  map.put("id", id);
		  
	    return mybatis.selectOne("bbs.checkID", map);
	  }
}
