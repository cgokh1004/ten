package spring.model.notice;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class NoticeDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public SqlSessionTemplate getMybatis() {
		return mybatis;
	}
	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}

	public int total(Map map){
		
		return mybatis.selectOne("notice.total", map);
	}
	
	public void upViewcnt(int noticeno){

		mybatis.update("notice.increaseViewcnt", noticeno);
	}
	
	public List<NoticeDTO> list(Map map){// 밑에 where r>=? and r<=?가 map에 들어감
		
		return mybatis.selectList("notice.list", map);
	}
	
	public int delete(int noticeno){
		
		return mybatis.delete("notice.delete", noticeno);
	}
	
	public int update(NoticeDTO dto){
		
		return mybatis.update("notice.update", dto);
	}
	
	
	public NoticeDTO read(int noticeno) {
		return mybatis.selectOne("notice.read", noticeno);
	}

	public int create(NoticeDTO dto) {
		return mybatis.insert("notice.create", dto);
	}
}
