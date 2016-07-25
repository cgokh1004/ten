package spring.model.ktx_booked;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import spring.model.ktx_booked.Ktx_BookedDTO;

@Component
public class Ktx_BookedDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<Ktx_BookedDTO> list(Map map){		
		return mybatis.selectList("ktx_booked.list",map);		
	}
	
	public int delete(int booked_no){		
		return mybatis.delete("ktx_booked.delete", booked_no);
	}
	
	public int update(Ktx_BookedDTO dto){
		return mybatis.update("ktx_booked.update", dto);
	}
	
	public Ktx_BookedDTO read(int booked_no){
		return mybatis.selectOne("ktx_booked.read", booked_no);
	}
	
	public int create(Ktx_BookedDTO dto){
		return mybatis.insert("ktx_booked.create", dto);
	}
	
}
