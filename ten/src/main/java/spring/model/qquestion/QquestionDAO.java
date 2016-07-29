package spring.model.qquestion;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class QquestionDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public SqlSessionTemplate getMybatis() {
		return mybatis;
	}
	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}

	public int total(Map map){
		
		return mybatis.selectOne("qquestion.total", map);
	}
	
	public void upViewcnt(int qqno){

		mybatis.update("qquestion.increaseViewcnt", qqno);
	}
	
	public List<QquestionDTO> list(Map map){// 밑에 where r>=? and r<=?가 map에 들어감
		
		return mybatis.selectList("qquestion.list", map);
	}
	
	public int delete(int qqno){
		
		return mybatis.delete("qquestion.delete", qqno);
	}
	
	public int update(QquestionDTO dto){
		
		return mybatis.update("qquestion.update", dto);
	}
	
	
	public QquestionDTO read(int qqno) {
		
		return mybatis.selectOne("qquestion.read", qqno);
	}

	public int create(QquestionDTO dto) {
		
		return mybatis.insert("qquestion.create", dto);
	}
}
