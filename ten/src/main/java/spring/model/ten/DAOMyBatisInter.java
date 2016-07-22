package spring.model.ten;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public interface DAOMyBatisInter {
public boolean create(Object dto,SqlSessionTemplate mybatis) throws Exception;
public List list(Map map, SqlSessionTemplate mybatis) throws Exception;
public Object read(Object pk,SqlSessionTemplate mybatis) throws Exception;
public boolean update(Object dto, SqlSessionTemplate mybatis) throws Exception;
public boolean delete(Object pk, SqlSessionTemplate mybatis) throws Exception;
public int total(Map map, SqlSessionTemplate mybatis) throws Exception;
 
}