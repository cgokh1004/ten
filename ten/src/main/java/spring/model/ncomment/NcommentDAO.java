package spring.model.ncomment;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class NcommentDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public SqlSessionTemplate getMybatis() {
		return mybatis;
	}
	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}

	public int total(Map map){
		
		return mybatis.selectOne("ncomment.total", map);
	}
	
	public List<NcommentDTO> list(Map map){// 밑에 where r>=? and r<=?가 map에 들어감
		
		return mybatis.selectList("ncomment.list", map);
	}
	
	public int delete(int noticeno){
		
		return mybatis.delete("ncomment.delete", noticeno);
	}
	
	public int update(NcommentDTO dto){
		
		return mybatis.update("ncomment.update", dto);
	}
	
	
	public NcommentDTO read(int noticeno) {
		return mybatis.selectOne("ncomment.read", noticeno);
	}

	public int create(NcommentDTO dto) {
		return mybatis.insert("ncomment.create", dto);
	}
}