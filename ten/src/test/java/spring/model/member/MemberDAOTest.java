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

	@Test @Ignore
	public void testCreate1() {
		MemberDAO dao= (MemberDAO) beans.getBean("memberdao");
		MemberDTO dto=new MemberDTO();
		dto.setId("user2");
		dto.setName("홍길동");
		dto.setGender("남");
		dto.setMem_type("개인");
		dto.setMfile("홍길동.jpg");
		dto.setLicense_type("1종보통");
		dto.setPhone_num("010-2352-2343");
		dto.setPhone_certi(1);
		dto.setAddress1("이쪽");
		dto.setAddress2("저쪽");
		dto.setAddr_certi(1);
		dto.setMail("kdsf@naver.com");
		dto.setMail_certi(1);
		dto.setPassport("홍여권.jpg");
		dto.setPassport_certi(1);
		dto.setSns("instagram");
		dto.setSns_certi(1);
		try {
			assertEquals(1,dao.create1(dto));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Test @Ignore
	public void testCreate2() {
		MemberDAO dao= (MemberDAO) beans.getBean("memberdao");
		try {
			assertEquals(1, dao.create2("user1"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Test @Ignore
	public void testRead() {
		MemberDAO dao= (MemberDAO) beans.getBean("memberdao");
		MemberDTO dto;
		try {
			dto = (MemberDTO) dao.read("user1");
			assertEquals("user1",dto.getId());
			assertEquals("남",dto.getGender());
			assertEquals("개인",dto.getMem_type());
			assertEquals("홍길동",dto.getName());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Test @Ignore
	public void testUpdate1() {
		MemberDAO dao= (MemberDAO) beans.getBean("memberdao");
		MemberDTO dto=new MemberDTO();
		dto.setMfile("사진.jpg");
		dto.setLicense_type("2종보통");
		dto.setPhone_num("010-2343-2351");
		dto.setAddress1("여기");
		dto.setAddress2("저기");
		dto.setSns("twitter");
		dto.setMail("ktw3722");
		dto.setPassport("파일");
		dto.setPhone_certi(1);
		dto.setAddr_certi(1);
		dto.setMail_certi(1);
		dto.setPassport_certi(1);
		dto.setSns_certi(0);
		dto.setId("user1");
		try {
			assertEquals(1, dao.update1(dto));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Test @Ignore
	public void testUpdate2() {
		MemberDAO dao= (MemberDAO) beans.getBean("memberdao");
		try {
			assertEquals(1, dao.update2("user1"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Test @Ignore
	public void testDelete() {
		MemberDAO dao= (MemberDAO) beans.getBean("memberdao");
		try {
			assertEquals(1, dao.delete("user2"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Test //@Ignore
	public void testList() {
		MemberDAO dao= (MemberDAO) beans.getBean("memberdao");
		Map map= new HashMap();
		map.put("col", "");
		map.put("word", "");
		map.put("sno", 1);
		map.put("eno", 5);
		List<MemberDTO> list;
		try {
			list = dao.list(map);
			assertEquals(2, list.size());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Test @Ignore
	public void testTotal() {
		MemberDAO dao= (MemberDAO) beans.getBean("memberdao");
		Map map= new HashMap();
		map.put("col", "");
		map.put("word", "");
		try {
			assertEquals(2, dao.total(map));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
