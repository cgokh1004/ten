package spring.model.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;


@Component
public class MemberDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;

	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}
	
	public int create1(MemberDTO memberDTO){
		return mybatis.insert("member.create1", memberDTO);
	}
	
	public int create2(String id){
		return mybatis.update("member.create2", id);		 
	}
	
	
	
	public MemberDTO read(String id){
		return mybatis.selectOne("member.read", id);
	}
	
	
	
	public int update1(MemberDTO memberDTO){
		return mybatis.update("member.update1", memberDTO);
	}
	public int update2(String id){
		return mybatis.update("member.update2", id);
	}
	
	
	
	public int delete(String id){
		return mybatis.delete("member.delete", id);
	}
	
	
	public List<MemberDTO> list(Map map){
		return mybatis.selectList("member.list", map);
	}
	
	public int total(String col,String word){
		Map map=new HashMap();
		map.put("col", col);
		map.put("word", word);
		return mybatis.selectOne("member.total", map);
	}
}
