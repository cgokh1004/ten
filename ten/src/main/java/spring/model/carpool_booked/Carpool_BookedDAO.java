package spring.model.carpool_booked;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

@Component
public class Carpool_BookedDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}

	public int create(Carpool_BookedDTO carpool_bookedDTO) {
		return mybatis.insert("carpool_booked.create", carpool_bookedDTO);
	}

	public Carpool_BookedDTO read(int cp_bookedno) {
		return mybatis.selectOne("carpool_booked.read", cp_bookedno);
	}

	public int update(Carpool_BookedDTO carpool_bookedDTO) {
		return mybatis.update("carpool_booked.update", carpool_bookedDTO);
	}

	public int delete(int cp_bookedno) {
		return mybatis.delete("carpool_booked.delete", cp_bookedno);
	}

	public List<Carpool_BookedDTO> list(Map map) {
		return mybatis.selectList("carpool_booked.list", map);
	}

	public int total(String col, String word) {
		Map map = new HashMap();
		map.put("col", "");
		map.put("word", "");
		return mybatis.selectOne("carpool_booked.total", map);
	}
}
