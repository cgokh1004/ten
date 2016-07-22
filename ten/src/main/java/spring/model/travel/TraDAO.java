package spring.model.travel;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class TraDAO {

	@Autowired
	private SqlSessionTemplate mybatis;	

	public void setMybatis(SqlSessionTemplate mybatis){
		this.mybatis=mybatis;
	}

	
}
