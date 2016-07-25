package spring.model.food_review;

import static org.junit.Assert.assertEquals;

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

public class Food_ReviewDAOTest {

	private static BeanFactory beans;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		Resource resource = new ClassPathResource("tent.xml");
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

	@Test @Ignore
	public void testList() {
		Food_ReviewDAO food_reviewDAO = (Food_ReviewDAO) beans.getBean("food_reviewdao");
		Map map = new HashMap();
		map.put("faddress", "(37.56282302589018, 126.98557123804406)");
		List<Food_ReviewDTO> list;
		try {
			list = food_reviewDAO.list(map);
			assertEquals(1,list.size());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Test @Ignore
	public void testTotal() {
		Food_ReviewDAO food_reviewDAO = (Food_ReviewDAO) beans.getBean("food_reviewdao");
		Map map = new HashMap();
		map.put("faddress", "(37.56282302589018, 126.98557123804406)");
		try {
			assertEquals(1,food_reviewDAO.total(map));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Test @Ignore
	public void testCreate() {
		Food_ReviewDAO food_reviewDAO = (Food_ReviewDAO) beans.getBean("food_reviewdao");	
		Food_ReviewDTO food_reviewDTO = new Food_ReviewDTO();
		food_reviewDTO.setContent("여기는 맛이없습니다.");
		food_reviewDTO.setId("guest");
		food_reviewDTO.setScore(3);
		food_reviewDTO.setFaddress("(37.56282302589018, 126.98557123804406)");	
		try {
			assertEquals(1, food_reviewDAO.create(food_reviewDTO));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Test //@Ignore
	public void testUpdate() {
		Food_ReviewDAO food_reviewDAO = (Food_ReviewDAO) beans.getBean("food_reviewdao");	
		Food_ReviewDTO food_reviewDTO = new Food_ReviewDTO();
		food_reviewDTO.setContent("꿀맛입니다.");
		food_reviewDTO.setScore(1);
		food_reviewDTO.setFrev_no(1);
		try {
			assertEquals(1, food_reviewDAO.update(food_reviewDTO));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Test @Ignore
	public void testDelete() {
		Food_ReviewDAO food_reviewDAO = (Food_ReviewDAO) beans.getBean("food_reviewdao");	
		try {
			assertEquals(1, food_reviewDAO.delete(1));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}	
}
