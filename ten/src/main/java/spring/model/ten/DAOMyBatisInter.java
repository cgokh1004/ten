package spring.model.ten;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public interface DAOMyBatisInter {
	public int create(Object dto) throws Exception;

	public List list(Map map) throws Exception;

	public Object read(Object pk) throws Exception;

	public int update(Object dto) throws Exception;

	public int delete(Object pk) throws Exception;

	public int total(Map map) throws Exception;
}