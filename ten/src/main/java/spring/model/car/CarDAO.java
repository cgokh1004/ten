package spring.model.car;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class CarDAO {

	@Autowired
	private SqlSessionTemplate mybatis;


public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
}
	
public int create(CarDTO dto){
	
	return mybatis.insert("car.create", dto);
	
}

public CarDTO read(String carno){
	
	return mybatis.selectOne("car.read", carno);
	
}

public int update(CarDTO dto){
	
	return mybatis.update("car.update", dto);
}

public int delete(String carno){
	
	return mybatis.delete("car.delete", carno);
}

public List<CarDTO> list(Map map){
	
	return mybatis.selectList("car.list", map);

}

public int total(String col, String word){
	
	Map map = new HashMap();
	map.put("col", col);
	map.put("word", word);
	
	return mybatis.selectOne("car.total", map);
	
}

}
