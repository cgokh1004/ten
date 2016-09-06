package spring.model.tra_reply;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

@Repository
public class Tra_ReplyDAO {

	@Autowired 
	private SqlSessionTemplate sqlSessionTemplate;
	
	
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate){
		
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	
	public boolean create(Tra_ReplyDTO dto){
		
		boolean flag = false;

		int cnt = sqlSessionTemplate.insert("tra_reply.create", dto);
		if (cnt > 0)
			flag = true;

		return flag;
	}
	
	
	public Tra_ReplyDTO read(int treply_no){
		
		return (Tra_ReplyDTO)sqlSessionTemplate.selectOne("tra_reply.read", treply_no );
	}
	

	public int total(int tra_no) {

		return (Integer) sqlSessionTemplate.selectOne("tra_reply.total", tra_no);
		
	}

	public List<Tra_ReplyDTO> list(Map map) {
		
		return sqlSessionTemplate.selectList("tra_reply.list", map);
	}

	public boolean delete(int treply_no) {
		
		boolean flag = false;
		int cnt = sqlSessionTemplate.delete("tra_reply.delete", treply_no);
		if(cnt>0)flag=true;
		
		return flag;
	}

	public boolean update(Tra_ReplyDTO dto) {
		
		boolean flag = false;
		
		int cnt = sqlSessionTemplate.update("tra_reply.update", dto);
		if(cnt>0)flag = true;
		
		return flag;
	}


	public boolean rdelete(int treply_no) {
		// TODO Auto-generated method stub
		return false;
	}

}
