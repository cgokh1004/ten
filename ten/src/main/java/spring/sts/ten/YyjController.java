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
	
	@RequestMapping(value = "/food/ajaxlist", method = RequestMethod.GET)
	public String keke(HttpServletRequest request, Model model, FoodDTO dto) {
		
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
		
	
	
		Map map = new HashMap();
		map.put("faddress", dto.getFaddress());
		List<Food_ReviewDTO> list;
		try {
			list = food_ReviewDAO.list(map);
			model.addAttribute("list", list);
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/yyj/ajaxlistresult";
	}
	
	
	@RequestMapping("/food/create")
	public String create(Food_ReviewDTO dto, Model model) {
		try {
			food_ReviewDAO.create(dto);
			System.out.println("자식테이블 생성 완료");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
//		System.out.println(dto.getId());
//		System.out.println(dto.getContent());
//		System.out.println(dto.getFaddress());
//		System.out.println(dto.getScore());
		
		return "redirect:./list";
	}
}
