package spring.model.sulconfirm;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import spring.model.ten.DAOMyBatisInter;


@Component
public class SulconfirmDAO implements DAOMyBatisInter {
   @Autowired
    private SqlSessionTemplate mybatis;
   
   
	public void setMybatis(SqlSessionTemplate mybatis) {
	this.mybatis = mybatis;
}

	@Override
	public int create(Object dto) throws Exception {
		return mybatis.insert("sulconfirm.create", dto);
	}

	@Override
	public List list(Map map) throws Exception {
		return mybatis.selectList("sulconfirm.list", map);
	}

	@Override
	public Object read(Object pk) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	public Object read1(Object pk, SqlSessionTemplate mybatis) throws Exception {
		return mybatis.selectOne("sulconfirm.read1", pk);
	}
	public Object read2(Object pk, SqlSessionTemplate mybatis) throws Exception {
		return mybatis.selectOne("sulconfirm.read2", pk);
	}
	
	@Override
	public int update(Object dto) throws Exception {
		return mybatis.update("sulconfirm.update", dto);
	}

	@Override
	public int delete(Object pk) throws Exception {
		return mybatis.delete("sulconfirm.delete", pk);
	}

	@Override
	public int total(Map map) throws Exception {
		return mybatis.selectOne("sulconfirm.total", map);
	}

}
