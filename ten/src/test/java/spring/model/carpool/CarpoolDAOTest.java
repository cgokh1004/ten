package spring.model.carpool;

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

import spring.model.carpool.CarpoolDAO;
import spring.model.carpool.CarpoolDTO;

public class CarpoolDAOTest {
	
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
	public void testCreate() {
		CarpoolDAO dao= (CarpoolDAO) beans.getBean("carpooldao");
		CarpoolDTO dto=new CarpoolDTO();
		dto.setCarpoolno(2);
		dto.setId("ktw3722");
		dto.setCarpooldate("2016-07-19");
		dto.setC_start("서울");
		dto.setC_startv("123.423123");
		dto.setC_end("부산");
		dto.setC_endv("123.234132");
		dto.setVia("");
		dto.setViav("");
		dto.setPurpose("여행");
		dto.setC_type("정기카풀");
		dto.setKind("태워주세요");
		dto.setStartdate("2016-07-20");
		dto.setSeat(2);
		dto.setPrice(3000);
		dto.setSmoke("흡연");
		dto.setC_comment("가자!!");
		try {
			assertEquals(1,dao.create(dto));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Test @Ignore
	public void testRead() {
		CarpoolDAO dao= (CarpoolDAO) beans.getBean("carpooldao");
		CarpoolDTO dto;
		try {
			dto = (CarpoolDTO) dao.read(2);
			assertEquals(2, dto.getCarpoolno());
			assertEquals("ktw3722", dto.getId());
			assertEquals("2016-07-25 00:00:00.0", dto.getCarpooldate());
			assertEquals("서울", dto.getC_start());
			assertEquals("부산",dto.getC_end());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Test @Ignore
	public void testUpdate() {
		CarpoolDAO dao= (CarpoolDAO) beans.getBean("carpooldao");
		CarpoolDTO dto=new CarpoolDTO();
		dto.setC_start("부산");
		dto.setC_startv("123.423123");
		dto.setC_end("서울");
		dto.setC_endv("123.234132");
		dto.setVia("");
		dto.setViav("");
		dto.setPurpose("여행");
		dto.setC_type("정기카풀");
		dto.setKind("태워주세요");
		dto.setStartdate("2016-07-20");
		dto.setSeat(2);
		dto.setPrice(3000);
		dto.setSmoke("비흡연");
		dto.setC_comment("가자!!");
		dto.setCarpoolno(2);
		try {
			assertEquals(1, dao.update(dto));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Test @Ignore
	public void testDelete() {
		CarpoolDAO dao= (CarpoolDAO) beans.getBean("carpooldao");
		try {
			assertEquals(1, dao.delete(2));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Test @Ignore
	public void testList() {
		CarpoolDAO dao= (CarpoolDAO) beans.getBean("carpooldao");
		Map map=new HashMap();
		map.put("col", "");
		map.put("word", "");
		map.put("sno", 1);
		map.put("eno", 5);
		List<CarpoolDTO> list;
		try {
			list = dao.list(map);
			assertEquals(1, list.size());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Test @Ignore
	public void testTotal() {
		CarpoolDAO dao= (CarpoolDAO) beans.getBean("carpooldao");
		Map map=new HashMap();
		map.put("col", "");
		map.put("word", "");
		try {
			assertEquals(1, dao.total(map));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
