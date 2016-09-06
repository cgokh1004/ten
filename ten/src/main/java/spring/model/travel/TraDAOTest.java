package spring.model.travel;

import static org.junit.Assert.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Ignore;
import org.junit.Test;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

public class TraDAOTest {

	private static BeanFactory beans;
	
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		
		Resource resource = new ClassPathResource("tent.xml");
		
		beans=new XmlBeanFactory(resource);
		
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {		
	}

	@Before
	public void setUp() throws Exception {
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test //@Ignore
	public void testCreate() {
		TraDAO dao=(TraDAO)beans.getBean("tradao");
		TraDTO dto=new TraDTO();
		dto.setTitle("전주에 놀러오세요");
		dto.setLocation("전주");
		dto.setFilename("dd");
		dto.setContent("여기는 밥이 맛있어요!ㅋ");
		assertEquals(13, dao.create(dto));
		
		
	}

	@Test @Ignore
	public void testRead() {
		TraDAO dao = (TraDAO)beans.getBean("tradao");
		TraDTO dto = dao.read(1);
		dto.setTitle("전주에 놀러오세요");
		dto.setLocation("전주");
		dto.setFilename("dd");
		dto.setContent("여기는 밥이 맛있어요!ㅋ");
	}

	@Test @Ignore
	public void testUpdate() {
		TraDAO dao=(TraDAO)beans.getBean("tradao");
		TraDTO dto=new TraDTO();
		dto.setTitle("전주에 오지마");
		dto.setLocation("평양");
		dto.setFilename("ㅋㅋ");
		dto.setContent("평양 gogo?");
		dto.setTra_no(2);
		assertEquals(1, dao.update(dto));
	}

	@Test @Ignore
	public void testDelete() {
		TraDAO dao=(TraDAO)beans.getBean("tradao");
		assertEquals(1, dao.delete(6));
		
	}

	@Test @Ignore
	public void testList() {
		TraDAO dao=(TraDAO)beans.getBean("tradao");
		Map map = new HashMap();
		map.put("col", "title");
		map.put("word", "test");
		map.put("sno", 1);
		map.put("eno", 5);
		List<TraDTO> list = dao.list(map);
	}

	@Test @Ignore
	public void testTotal() {
		TraDAO dao=(TraDAO)beans.getBean("tradao");
		assertEquals(13, dao.total("title", "전주"));
	}

}
