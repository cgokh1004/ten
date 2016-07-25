package spring.model.schedule;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import spring.model.sulconfirm.SulconfirmDTO;
import spring.model.ten.DAOMyBatisInter;

public class SchedulerDAO implements DAOMyBatisInter {

	@Override
	public int create(Object dto, SqlSessionTemplate mybatis) throws Exception {
		return mybatis.insert("scheduler.insertEvent", dto);	
	}

	@Override
	public List<SchedulerVO> list(Map map, SqlSessionTemplate mybatis) throws Exception {
		return mybatis.selectList("scheduler.list", map);
	}

	@Override
	public Object read(Object pk, SqlSessionTemplate mybatis) throws Exception {
		return mybatis.selectOne("scheduler.getEvent", pk);
	}

	@Override
	public int update(Object dto, SqlSessionTemplate mybatis) throws Exception {
		return mybatis.update("scheduler.updateEvent", dto);
	}

	@Override
	public int delete(Object pk, SqlSessionTemplate mybatis) throws Exception {
		return mybatis.delete("scheduler.deleteEvent", pk);
	}

	@Override
	public int total(Map map, SqlSessionTemplate mybatis) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}
