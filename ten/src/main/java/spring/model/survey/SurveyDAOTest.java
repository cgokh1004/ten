package spring.model.survey;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.fail;

import java.util.List;

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

import spring.model.sulmunr.SulmunrDTO;

public class SurveyDAOTest {
	
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

	@Test @Ignore
	public void test() {
		fail("Not yet implemented");
	}
	
	@Test  //@Ignore
	public void testReadlist() {
		System.out.println("zadf");
		SurveyDAO dao = (SurveyDAO)beans.getBean("surveydao");
		List list = dao.readlist("1조");
		
		for(int i = 0; i<list.size(); i++){			
			System.out.print(((SurveyDTO)list.get(i)).getSulno());
			System.out.println(((SurveyDTO)list.get(i)).getAskcontent());
			for(int j=0; j<((SurveyDTO)list.get(i)).getSulmunrdtoList().size(); j++){
				System.out.print("     " + ((SulmunrDTO)((SurveyDTO)list.get(i)).getSulmunrdtoList().get(j)).getSulmunrno());
				System.out.print("     " + ((SulmunrDTO)((SurveyDTO)list.get(i)).getSulmunrdtoList().get(j)).getChono());
				System.out.println("     " + ((SulmunrDTO)((SurveyDTO)list.get(i)).getSulmunrdtoList().get(j)).getChocontent());
			}
		}
			
//		assertEquals("개선할 점이 있으면 기재해주세요.",  dto.getAskcontent());
//		//assertEquals("첫설문",  dto.getSulgroupname());
		assertEquals(3, list.size());
//		assertEquals("몰라시붕", sulmunrDTO.getChocontent());
//		assertEquals(3,  list.size());
	
	}
	
		
		
		@Test  @Ignore
		public void testResultreadlist() {
			System.out.println("zadf");
			SurveyDAO dao = (SurveyDAO)beans.getBean("surveydao");
			List list = dao.resultreadlist("건강");
			
			for(int i = 0; i<list.size(); i++){			
				System.out.print(((SurveyDTO)list.get(i)).getSulno());
				System.out.println(((SurveyDTO)list.get(i)).getAskcontent());
				for(int j=0; j<((SurveyDTO)list.get(i)).getSulmunrdtoList().size(); j++){
					System.out.print(((SulmunrDTO)((SurveyDTO)list.get(i)).getSulmunrdtoList().get(j)).getChono());
					System.out.print("        " + ((SulmunrDTO)((SurveyDTO)list.get(i)).getSulmunrdtoList().get(j)).getChocontent());
					System.out.print("        " + ((SulmunrDTO)((SurveyDTO)list.get(i)).getSulmunrdtoList().get(j)).getThenumber());
					System.out.println("        " + ((SulmunrDTO)((SurveyDTO)list.get(i)).getSulmunrdtoList().get(j)).getTheratio());
				}
			}
		
//		assertEquals("개선할 점이 있으면 기재해주세요.",  dto.getAskcontent());
//		//assertEquals("첫설문",  dto.getSulgroupname());
		assertEquals(2, list.size());
//		assertEquals("몰라시붕", sulmunrDTO.getChocontent());
//		assertEquals(3,  list.size());
		}
}
