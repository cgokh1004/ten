package spring.sts.ten;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.model.food.FoodDAO;
import spring.model.food.FoodDTO;
import spring.model.food_review.Food_ReviewDAO;
import spring.model.food_review.Food_ReviewDTO;
import spring.utility.ten.Paging;


@Controller
public class YyjController {
	@Autowired
	private FoodDAO foodDAO;	
	@Autowired
	private Food_ReviewDAO food_ReviewDAO;	
	
	@RequestMapping("/food/list")
	public String list(HttpServletRequest request, Model model) {
		return "/food/list";
	}
	
	
	//페이징 리스트
	@RequestMapping(value = "/food/paginglist", method = RequestMethod.GET)
	public String paginglist(Model model, FoodDTO dto) {
		
		return "/yyj/ajaxlistresult";
	}
	
	
	@RequestMapping(value = "/food/ajaxlist", method = RequestMethod.GET)
	public String reviewlist(Model model, FoodDTO dto) {
		//클릭하면 부모테이블을 만들지 말지 결정해서 만들고,
		try {
			if(foodDAO.madecheckread(dto.getFaddress()) == 0){
				foodDAO.create(dto);
				System.out.println("부모테이블 생성 완료");
			}
			else{
				System.out.println("부모테이블 이미 생성됨");
			}
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
	
		//리스트 호출
		getlist(dto.getFaddress(), model);
		return "/yyj/ajaxlistresult";
	}
	
	@RequestMapping("/food/create")
	public String create(Food_ReviewDTO dto, Model model) {
		//리뷰 입력
		try {
			int result = food_ReviewDAO.create(dto);
			model.addAttribute("result", result);
			System.out.println("자식테이블 생성 완료");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//리스트 호출
		getlist(dto.getFaddress(), model);
		return "/yyj/ajaxlistresult";
	}
	
	public Model getlist(String faddress, Model model){
		int nowPage = 1; // 현재페이지
		int recordPerPage = 10; // 한페이지당 보여줄 글 개수
		
		int sno = ((nowPage - 1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage;
		
		Map map = new HashMap();
		map.put("faddress", faddress);
		map.put("sno", sno);
		map.put("eno", eno);
		List list;
		int total;
		String paging;
		
		try {
			total = food_ReviewDAO.total(map);
			System.out.println("토탈 갯수는: " + total);
			paging = new Paging().foodpaging(total, 1, recordPerPage, faddress);
			model.addAttribute("paging", paging);
			System.out.println(paging);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		try {
			list = food_ReviewDAO.list(map);
			
			//DB에 저장되는 줄바꿈 명령어는 \r\n이고 JSP에서 줄바꿈은 <br> 이기 때문에, 리스트에 담긴 각각 컨텐트의 \r\n을 <br>로 변경
			for(int i=0; i<list.size(); i++){
				String content = ((Food_ReviewDTO)list.get(i)).getContent();
				content = content.replaceAll("\r\n", "<br>");
				((Food_ReviewDTO)list.get(i)).setContent(content);
			}
			model.addAttribute("list", list);
			
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return model;
	}
}
