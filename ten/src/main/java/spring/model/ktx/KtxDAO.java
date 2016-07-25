package spring.model.ktx;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import spring.model.ktx.KtxDTO;

@Component
public class KtxDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int create(KtxDTO dto){
		return mybatis.insert("ktx.create", dto);
	}
	
	public KtxDTO read(int ktx_no){
		return mybatis.selectOne("ktx.read", ktx_no);
	}

	
	public int update(KtxDTO dto){
		return mybatis.update("ktx.update", dto);

	}

	
	public int delete(int ktx_no){
		return mybatis.delete("ktx.delete", ktx_no);
	}

	
	public List<KtxDTO> list(Map map){
		return mybatis.selectList("ktx.list",map);
	}

}
