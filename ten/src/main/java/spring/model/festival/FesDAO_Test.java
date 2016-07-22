package spring.model.festival;



import static org.junit.Assert.assertEquals;
import static org.junit.Assert.fail;

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


public class FesDAO_Test {

	
	private static BeanFactory beans;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		
		Resource resource = new ClassPathResource("rjm.xml");
		
		beans = new XmlBeanFactory(resource);
		
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
			FesDAO dao = (FesDAO) beans.getBean("fesdao");
			FesDTO dto = new FesDTO();
			dto.setTitle("전주 고고");
			dto.setLocation("전주");
			dto.setFilename("사진");
			dto.setContent("재미있다?");
			assertEquals(1, dao.create(dto));
			
	}

	@Test @Ignore
	public void testRead() {
		
		FesDAO dao = (FesDAO)beans.getBean("fesdao");
		FesDTO dto = dao.read(1);
		assertEquals("만두먹기 축제",dto.getTitle());
		assertEquals("전라북도 전주",dto.getLocation());
		assertEquals("gg",dto.getFilename());
		assertEquals("여기는 만두가 맛있어요!ㅋ",dto.getContent());
		
		
	}

	@Test  @Ignore
	public void testUpdate() {

		FesDAO dao = (FesDAO)beans.getBean("fesdao");
		FesDTO dto = new FesDTO();
		dto.setTitle("전주 가지마");
		dto.setLocation("평양");
		dto.setFilename("사진");
		dto.setContent("날래오라우");
		dto.setFes_no(2);
		assertEquals(1, dao.update(dto));
		
		
		
	}

	@Test  @Ignore
	public void testDelete() {
		FesDAO dao = (FesDAO)beans.getBean("fesdao");
		assertEquals(1, dao.delete(5));
		
		
	}

	@Test  @Ignore
	public void testList() {
		FesDAO dao = (FesDAO)beans.getBean("fesdao");
		Map map = new HashMap();
		map.put("col", "title");
		map.put("word", "test");
		map.put("sno", 1);
		map.put("eno", 5);
		List<FesDTO> list = dao.list(map);
	}

	@Test  @Ignore
	public void testTotal() {
		FesDAO dao = (FesDAO)beans.getBean("fesdao");
		assertEquals(4, dao.total("title", ""));
		
		
	}

}
