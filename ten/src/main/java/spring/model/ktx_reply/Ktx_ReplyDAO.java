package spring.model.ktx_reply;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import spring.model.ten.DAOMyBatisInter;

public class Ktx_ReplyDAO implements DAOMyBatisInter {

	@Override
	public boolean create(Object dto, SqlSessionTemplate mybatis) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List list(Map map, SqlSessionTemplate mybatis) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object read(Object pk, SqlSessionTemplate mybatis) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean update(Object dto, SqlSessionTemplate mybatis) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(Object pk, SqlSessionTemplate mybatis) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int total(Map map, SqlSessionTemplate mybatis) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}
