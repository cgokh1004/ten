package spring.model.sulmunr;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import spring.model.ten.DAOMyBatisInter;

public class SulmunrDAO implements DAOMyBatisInter {
//테스트
	//커밋1
	//커밋2
	//커밋3
	//커밋4

	@Override
	public int create(Object dto, SqlSessionTemplate mybatis) throws Exception {
		// TODO Auto-generated method stub
		return 0;
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
	public int update(Object dto, SqlSessionTemplate mybatis) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(Object pk, SqlSessionTemplate mybatis) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int total(Map map, SqlSessionTemplate mybatis) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}
