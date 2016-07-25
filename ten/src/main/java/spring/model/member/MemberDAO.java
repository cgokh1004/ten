package spring.model.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import spring.model.ten.DAOMyBatisInter;
@Component
public class MemberDAO implements DAOMyBatisInter {
	@Autowired
	private SqlSessionTemplate mybatis;

	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}
	@Override
	public int create(Object dto) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	public int create1(MemberDTO memberDTO) {
		return mybatis.insert("member.create1", memberDTO);
	}
	
	public int create2(String id) throws Exception{
		return mybatis.update("member.create2", id);		 
	}
	@Override
	public List list(Map map) throws Exception {
		return mybatis.selectList("member.list", map);
	}

	@Override
	public Object read(Object pk) throws Exception {
		return mybatis.selectOne("member.read", pk);
	}

	@Override
	public int update(Object dto) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	
	public int update1(MemberDTO memberDTO) throws Exception{
		return mybatis.update("member.update1", memberDTO);
	}
	
	public int update2(String id) throws Exception{
		return mybatis.update("member.update2", id);
	}
	
	@Override
	public int delete(Object pk) throws Exception {
		return mybatis.delete("member.delete", pk);
	}

	@Override
	public int total(Map map) throws Exception {
		return mybatis.selectOne("member.total", map);
	}

}
