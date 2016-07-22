package spring.model.car_booked;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class Car_BookedDAO {

	private SqlSessionTemplate mybatis;
	
public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
}
	
public int create(Car_BookedDTO dto){
	
	return mybatis.insert("car_booked.create", dto);
	
}

public Car_BookedDTO read(String carbook_no){
	
	return mybatis.selectOne("car_booked.read", carbook_no);
	
}

public int update(Car_BookedDTO dto){
	
	return mybatis.update("car_booked.update", dto);
	
}

public int delete(String carbook_no){
	
	return mybatis.delete("car_booked.delete", carbook_no);
	
}

public List<Car_BookedDTO> list(Map map){
	
	return mybatis.selectList("car_booked.list", map);
	
}

public int total(){
	
	return mybatis.selectOne("car_booked.total", "");
	
}

}
