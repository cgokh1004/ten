package spring.model.bbs;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReplyDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	public int rcount(int bbsno){
	    return sqlSessionTemplate.selectOne("reply.rcount", bbsno);
	}
	
	public boolean create(ReplyDTO dto) {
		boolean flag = false;

		int cnt = sqlSessionTemplate.insert("reply.create", dto);
		if (cnt > 0)
			flag = true;

		return flag;
	}

	public ReplyDTO read(int rnum) {

		return  sqlSessionTemplate.selectOne("reply.read", rnum);

	}

	public boolean update(ReplyDTO dto) {
		boolean flag = false;

		int cnt = sqlSessionTemplate.update("reply.update", dto);
		if (cnt > 0)
			flag = true;

		return flag;
	}

	public List<ReplyDTO> list(Map map) {

		return sqlSessionTemplate.selectList("reply.list", map);
	}

	public int total(int bbsno) {
		return sqlSessionTemplate.selectOne("reply.total", bbsno);
	}

	public boolean delete(int rnum) {
		boolean flag = false;
		int cnt = sqlSessionTemplate.delete("reply.delete", rnum);
		if (cnt > 0)
			flag = true;

		return flag;
	}

	/** 하나의 글의 여러댓글들 삭제 */
	public int bdelete(int bbsno) throws Exception {
		return sqlSessionTemplate.delete("reply.bdelete", bbsno);

	}
}