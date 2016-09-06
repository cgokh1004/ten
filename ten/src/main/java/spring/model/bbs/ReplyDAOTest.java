package spring.model.bbs;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

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

public class ReplyDAOTest {
	private static BeanFactory beans;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		Resource resource = new ClassPathResource("blog.xml");
		
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
	public void testRcount() {
		ReplyDAO dao = (ReplyDAO)beans.getBean("rdao");
		assertEquals(0, dao.rcount(16));
	}

	@Test @Ignore
	public void testCreate() {
		ReplyDAO dao = (ReplyDAO)beans.getBean("rdao");
		ReplyDTO dto=new ReplyDTO();
		dto.setBbsno(1);
		dto.setContent("댓글2");
		dto.setId("ktw3722");
		assertTrue(dao.create(dto));
	}

	@Test @Ignore
	public void testRead() {
		ReplyDAO dao = (ReplyDAO)beans.getBean("rdao");
		ReplyDTO dto=dao.read(12);
		assertEquals(1, dto.getBbsno());
		assertEquals("댓글2", dto.getContent());
		assertEquals("ktw3722", dto.getId());
	}

	@Test @Ignore
	public void testUpdate() {
		ReplyDAO dao = (ReplyDAO)beans.getBean("rdao");
		ReplyDTO dto=new ReplyDTO();
		dto.setBbsno(1);
		dto.setRnum(12);
		dto.setContent("댓글 변경");
		dto.setId("ktw3722");
		
		assertTrue(dao.update(dto));
	}

	@Test @Ignore
	public void testList() {
		ReplyDAO dao = (ReplyDAO)beans.getBean("rdao");
		Map map= new HashMap();
		map.put("bbsno",1);
		map.put("sno",1);
		map.put("eno", 3);
		
		List<ReplyDTO> list= dao.list(map);
		
		assertEquals(1, list.size());
		
	}

	@Test @Ignore
	public void testTotal() {
		ReplyDAO dao = (ReplyDAO)beans.getBean("rdao");
		int bbsno= 1;
		assertEquals(1, dao.total(bbsno));
	}

	@Test @Ignore
	public void testDelete() {
		ReplyDAO dao = (ReplyDAO)beans.getBean("rdao");
		assertTrue(dao.delete(12));
		
	}

	@Test @Ignore
	public void testBdelete() {
		ReplyDAO dao = (ReplyDAO)beans.getBean("rdao");
		try {
			assertEquals(5, dao.bdelete(16));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
