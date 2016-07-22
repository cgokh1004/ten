package spring.model.fes_reply;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class Fes_ReplyDAO {

	@Autowired 
	private SqlSessionTemplate mybatis;
	
	
	public void setMybatis(SqlSessionTemplate mybatis){
		this.mybatis=mybatis;
	}
	
	
	
	public int create(Fes_ReplyDTO dto){
		
		return mybatis.insert("fes_reply.create", dto);
	}
	
	
	public Fes_ReplyDTO read(int freply_no){
		
		return mybatis.selectOne("fes_reply.read", freply_no);
	}
	
	
	public int update(Fes_ReplyDTO dto){
		return mybatis.update("fes_reply.update",dto);
	}
		
	public int delete(int freply_no){
				
		return mybatis.delete("fes_reply.delete",freply_no);
	}

	public List<Fes_ReplyDTO> list(Map map){
		
		return mybatis.selectList("fes_reply.list", map);
	}
	
}
