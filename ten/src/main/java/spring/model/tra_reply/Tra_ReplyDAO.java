package spring.model.tra_reply;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class Tra_ReplyDAO {

	@Autowired 
	private SqlSessionTemplate mybatis;
	
	
	public void setMybatis(SqlSessionTemplate mybatis){
		this.mybatis=mybatis;
	}
	
	
	
	public int create(Tra_ReplyDTO dto){
		
		return mybatis.insert("tra_reply.create", dto);
	}
	
	
	public Tra_ReplyDTO read(int treply_no){
		
		return mybatis.selectOne("tra_reply.read", treply_no);
	}
	
	
	public int update(Tra_ReplyDTO dto){
		return mybatis.update("tra_reply.update",dto);
	}
		
	public int delete(int treply_no){
				
		return mybatis.delete("tra_reply.delete",treply_no);
	}

	public List<Tra_ReplyDTO> list(Map map){
		
		return mybatis.selectList("tra_reply.list", map);
	}
}
