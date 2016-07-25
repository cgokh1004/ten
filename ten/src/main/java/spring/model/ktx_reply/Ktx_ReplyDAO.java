package spring.model.ktx_reply;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import spring.model.ktx_reply.Ktx_ReplyDTO;

@Component
public class Ktx_ReplyDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	

	public List<Ktx_ReplyDTO> list(Map map){
		return mybatis.selectList("ktx_reply.list",map);
	}
	
	public int delete(int ktxrep_no){
		return mybatis.delete("memo.delete", memono);
	}
	public int update(MemoVO vo){
		return mybatis.update("memo.update", vo);
	}
	
	public MemoVO read(int memono){
		return mybatis.selectOne("memo.read", memono);
	}
	
	public int create(MemoVO vo){
		return mybatis.insert("memo.create", vo);
	}
	
	public int total(Map map) {
		return mybatis.selectOne("memo.total", map);
	}
	
	public int total(String col, String word) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
}
