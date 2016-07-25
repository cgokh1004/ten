package spring.model.carpool_review;

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

import spring.model.carpool_review.Carpool_ReviewDAO;
import spring.model.carpool_review.Carpool_ReviewDTO;

public class Carpool_ReviewDAOTest {
	private static BeanFactory beans;
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		Resource resource = new ClassPathResource("ksb.xml");
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

	@Test @Ignore
	public void testCreate() {
		Carpool_ReviewDAO dao=(Carpool_ReviewDAO) beans.getBean("carpool_reviewdao");
		Carpool_ReviewDTO dto=new Carpool_ReviewDTO();
		
		dto.setContent("좋아요");
		dto.setScore(4);
		dto.setCarpoolno(1);
		dto.setId("ktw3722");
		
		assertEquals(1,dao.create(dto));
	}

	@Test @Ignore
	public void testRead() {
		Carpool_ReviewDAO dao=(Carpool_ReviewDAO) beans.getBean("carpool_reviewdao");
		Carpool_ReviewDTO dto=dao.read(2);
		assertEquals(2, dto.getCrev_no());
		assertEquals(4, dto.getScore());
		assertEquals(1, dto.getCarpoolno());
		assertEquals("ktw3722", dto.getId());
		assertEquals("좋아요", dto.getContent());
		
	}

	@Test @Ignore
	public void testUpdate() {
		Carpool_ReviewDAO dao=(Carpool_ReviewDAO) beans.getBean("carpool_reviewdao");
		Carpool_ReviewDTO dto=new Carpool_ReviewDTO();
		
		dto.setContent("좋아요");
		dto.setScore(5);
		dto.setCrev_no(2);
		assertEquals(1, dao.update(dto));
	}

	@Test @Ignore
	public void testDelete() {
		Carpool_ReviewDAO dao=(Carpool_ReviewDAO) beans.getBean("carpool_reviewdao");
		assertEquals(1, dao.delete(1));
	}

	@Test @Ignore
	public void testList() {
		Carpool_ReviewDAO dao=(Carpool_ReviewDAO) beans.getBean("carpool_reviewdao");
		Map map = new HashMap();
		map.put("col", "");
		map.put("word", "");
		map.put("sno", 1);
		map.put("eno", 5);
		List<Carpool_ReviewDTO> list=dao.list(map);
		assertEquals(1, list.size());
	}

	@Test @Ignore
	public void testTotal() {
		Carpool_ReviewDAO dao=(Carpool_ReviewDAO) beans.getBean("carpool_reviewdao");
		assertEquals(1, dao.total("", ""));
	}

}
