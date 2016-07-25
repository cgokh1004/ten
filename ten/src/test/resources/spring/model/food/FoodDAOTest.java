package spring.model.food;

import static org.junit.Assert.assertEquals;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

import javassist.bytecode.stackmap.BasicBlock.Catch;

public class FoodDAOTest {
	
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

	@Test
	public void testCreate() {
		FoodDAO foodDAO = (FoodDAO) beans.getBean("fooddao");
		FoodDTO foodDTO = new FoodDTO();
		foodDTO.setFoodname("빠네파스타 1호점");
		foodDTO.setFaddress("(37.56282302589018, 126.98557123804406)");	
		try {
			assertEquals(1, foodDAO.create(foodDTO));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
