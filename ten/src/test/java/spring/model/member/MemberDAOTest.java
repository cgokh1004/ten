package spring.model.member;

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
import spring.model.member.MemberDAO;
import spring.model.member.MemberDTO;

public class MemberDAOTest {
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
	public void testCreate1() {
		MemberDAO dao= (MemberDAO) beans.getBean("memberdao");
		MemberDTO dto=new MemberDTO();
		dto.setId("user1");
		dto.setName("홍길동");
		dto.setGender("남");
		dto.setMem_type("개인");
		dto.setPhone_certi(1);
		dto.setAddr_certi(1);
		dto.setMail_certi(1);
		dto.setPassport_certi(1);
		dto.setSns_certi(1);
		assertEquals(1,dao.create1(dto));
	}

	@Test @Ignore
	public void testCreate2() {
		MemberDAO dao= (MemberDAO) beans.getBean("memberdao");
		assertEquals(1, dao.create2("user1"));
	}

	@Test @Ignore
	public void testRead() {
		MemberDAO dao= (MemberDAO) beans.getBean("memberdao");
		MemberDTO dto=dao.read("user1");
		assertEquals("user1",dto.getId());
		assertEquals("남",dto.getGender());
		assertEquals("개인",dto.getMem_type());
		assertEquals("홍길동",dto.getName());
	}

	@Test @Ignore
	public void testUpdate1() {
		MemberDAO dao= (MemberDAO) beans.getBean("memberdao");
		MemberDTO dto=new MemberDTO();
		dto.setPhone_certi(1);
		dto.setAddr_certi(1);
		dto.setMail_certi(1);
		dto.setPassport_certi(1);
		dto.setSns_certi(0);
		dto.setId("user1");
		assertEquals(1, dao.update1(dto));
	}

	@Test @Ignore
	public void testUpdate2() {
		MemberDAO dao= (MemberDAO) beans.getBean("memberdao");
		assertEquals(1, dao.update2("user1"));
	}

	@Test @Ignore
	public void testDelete() {
		MemberDAO dao= (MemberDAO) beans.getBean("memberdao");
		assertEquals(1, dao.delete("user1"));
	}

	@Test @Ignore
	public void testList() {
		MemberDAO dao= (MemberDAO) beans.getBean("memberdao");
		Map map= new HashMap();
		map.put("col", "");
		map.put("word", "");
		map.put("sno", 1);
		map.put("eno", 5);
		List<MemberDTO> list= dao.list(map);
		assertEquals(1, list.size());
	}

	@Test //@Ignore
	public void testTotal() {
		MemberDAO dao= (MemberDAO) beans.getBean("memberdao");
		assertEquals(1, dao.total("", ""));
	}

}
