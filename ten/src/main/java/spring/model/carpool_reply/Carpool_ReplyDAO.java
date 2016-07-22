package spring.model.carpool_reply;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

@Component
public class Carpool_ReplyDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}
	
	public int create(Carpool_ReplyDTO carpool_replyDTO){
		return mybatis.insert("carpool_reply.create", carpool_replyDTO);
	}
	
	public Carpool_ReplyDTO read(int crep_no){
		return mybatis.selectOne("carpool_reply.read", crep_no);
	}
	
	public int update(Carpool_ReplyDTO carpool_replyDTO){
		return mybatis.update("carpool_reply.update", carpool_replyDTO);
	}
	
	public int delete(int crep_no){
		return mybatis.delete("carpool_reply.delete", crep_no);
	}
	
	public List<Carpool_ReplyDTO> list(Map map){
		return mybatis.selectList("carpool_reply.list", map);
	}
	
	public int total(String col,String word){
		Map map=new HashMap();
		map.put("col", "");
		map.put("word", "");
		return mybatis.selectOne("carpool_reply.total", map);
	}
}
