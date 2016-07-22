package spring.model.ten;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public interface DAOMyBatisInter {
public int create(Object dto,SqlSessionTemplate mybatis) throws Exception;
public List list(Map map, SqlSessionTemplate mybatis) throws Exception;
public Object read(Object pk,SqlSessionTemplate mybatis) throws Exception;
public int update(Object dto, SqlSessionTemplate mybatis) throws Exception;
public int delete(Object pk, SqlSessionTemplate mybatis) throws Exception;
public int total(Map map, SqlSessionTemplate mybatis) throws Exception;
 
}