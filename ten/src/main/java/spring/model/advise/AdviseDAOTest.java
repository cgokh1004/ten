package spring.model.advise;

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

public class AdviseDAOTest {
	private static BeanFactory beans;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		Resource resource = new ClassPathResource("ks.xml");
		 
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

	@Test
	public void testGetMybatis() {
	}

	@Test
	public void testSetMybatis() {
	}
	
	@Test @Ignore
	public void testTotal() {
		AdviseDAO dao = (AdviseDAO) beans.getBean("advisedao");
		assertEquals(2,dao.total("", ""));
	}

	@Test @Ignore
	public void testCreate() {
		AdviseDAO dao = (AdviseDAO) beans.getBean("advisedao");
		AdviseDTO dto = new AdviseDTO();
		dto.setTitle("제목");
		dto.setContent("내용");
		dto.setId("user1");
		assertEquals(1,dao.create(dto));
	}

	@Test @Ignore
	public void testList() {
		AdviseDAO dao = (AdviseDAO) beans.getBean("advisedao");
		Map map = new HashMap();
		map.put("col", "title");
		map.put("word", "제목");
		map.put("sno", 1);
		map.put("eno", 5);
		List<AdviseDTO> list = dao.list(map);
		assertEquals(1,list.size());
	}

	@Test //@Ignore
	public void testRead() {
		AdviseDAO dao = (AdviseDAO) beans.getBean("advisedao");
		AdviseDTO dto = dao.read(4);
		assertEquals("제목",dto.getTitle());
		assertEquals("내용",dto.getContent());
	}

	@Test //@Ignore
	public void testIncreaseViewcnt() {
		AdviseDAO dao = (AdviseDAO) beans.getBean("advisedao");
		dao.increaseViewcnt(4);
		AdviseDTO dto = dao.read(4);
		assertEquals(1,dto.getViewcnt());
	}

	@Test //@Ignore
	public void testReply() {
		AdviseDAO dao = (AdviseDAO) beans.getBean("advisedao");
		AdviseDTO dto = new AdviseDTO();
		dto.setTitle("제목");
		dto.setContent("내용");
		dto.setId("user1");
		dto.setAnsnum(0);
		dto.setIndent(0);
		dto.setGroupno(4);
		assertEquals(1,dao.reply(dto));
	}

	@Test //@Ignore
	public void testAddAnsnum() {
		AdviseDAO dao = (AdviseDAO) beans.getBean("advisedao");
		dao.addAnsnum(4, 0);
		AdviseDTO dto = dao.readReply(4);
		assertEquals(1,dto.getAnsnum());
	}

	@Test //@Ignore
	public void testReadReply() {
		AdviseDAO dao = (AdviseDAO) beans.getBean("advisedao");
		AdviseDTO dto = dao.readReply(4);
		assertEquals(0,dto.getIndent());
		assertEquals(0,dto.getAnsnum());
		assertEquals(4,dto.getGroupno());
		assertEquals("제목",dto.getTitle());
	}

	@Test //@Ignore
	public void testDelete() {
		AdviseDAO dao = (AdviseDAO) beans.getBean("advisedao");
		assertEquals(1,dao.delete(3));
	}

	@Test //@Ignore
	public void testUpdate() {
		AdviseDAO dao = (AdviseDAO) beans.getBean("advisedao");
		AdviseDTO dto = new AdviseDTO();
		dto.setTitle("리스트");
		dto.setContent("리스트");
		dto.setId("user1");
		dto.setAdvno(2);
		assertEquals(1,dao.update(dto));
	}

	@Test //@Ignore
	public void testCheckID() {
		AdviseDAO dao = (AdviseDAO) beans.getBean("advisedao");
		assertEquals(1,dao.checkID(4, "user1"));
	}

}
