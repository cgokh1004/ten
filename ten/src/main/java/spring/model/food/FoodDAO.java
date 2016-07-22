package spring.model.food;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import spring.model.ten.DAOMyBatisInter;

public class FoodDAO implements DAOMyBatisInter {

	@Override
	public int create(Object dto, SqlSessionTemplate mybatis) throws Exception {
		// TODO Auto-generated method stub
		//동시테스트
		//테스트1
		//테스트2
		//테스트3
		//테스트4
		//테스트5

		return mybatis.insert("food.create", dto);
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
