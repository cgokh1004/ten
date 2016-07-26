package spring.model.schedule;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.fail;

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

public class SchedulerDAOTest {

	 private static BeanFactory beans;
	 
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		
		   Resource resource = new ClassPathResource("tent.xml");
			
		   beans = new XmlBeanFactory(resource); //매게변수가 되어야함
		
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

	@Test// @Ignore
	public void testCreate() {
		SchedulerDAO dao = (SchedulerDAO)beans.getBean("schedulerdao");
		SchedulerVO vo = new SchedulerVO();
		vo.setEvent_id(7);		
		vo.setEvent_name("1");
		vo.setStart_date("20160725");
		vo.setEnd_date("20160725");
		vo.setId("ktw3722");

	    try {
	    	System.out.println("제발");
			assertEquals(1, dao.create(vo));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	}

	@Test @Ignore
	public void testList() {
		fail("Not yet implemented");
	}

	@Test @Ignore
	public void testRead() {
		fail("Not yet implemented");
	}

	@Test @Ignore
	public void testUpdate() {
		fail("Not yet implemented");
	}

	@Test @Ignore
	public void testDelete() {
		fail("Not yet implemented");
	}

	@Test @Ignore
	public void testTotal() {
		fail("Not yet implemented");
	}

}
