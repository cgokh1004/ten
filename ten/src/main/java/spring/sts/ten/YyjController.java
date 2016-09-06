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
	
	
	
	@RequestMapping("/food/update")
	public String update(Food_ReviewDTO dto, Model model, HttpServletRequest request) {
		//리뷰 삭제
		try {
			int result = food_ReviewDAO.update(dto);
			System.out.println(dto.getFrev_no());
			System.out.println(dto.getContent());
			System.out.println(dto.getFaddress());
			model.addAttribute("result", result);
			System.out.println("자식테이블 수정 완료");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		
		//리스트 호출(삭제이므로, 나우페이지를 현재페이지로 호출)
		
		int nowPage = 1; // 현재페이지를 처음에는 1로 초기화.
		
		// 현재페이지가 있으면 받아오기.
		if (request.getParameter("nowPage") != null && request.getParameter("nowPage") != "") {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		getlist(dto.getFaddress(), model, nowPage);
		return "/yyj/ajaxlistresult";
	}
	
	@RequestMapping("/food/delete")
	public String delete(Food_ReviewDTO dto, Model model, HttpServletRequest request) {
		//리뷰 삭제
		try {
			int result = food_ReviewDAO.delete(dto.getFrev_no());
			model.addAttribute("result", result);
			System.out.println("자식테이블 삭제 완료");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		
		//리스트 호출(삭제이므로, 나우페이지를 현재페이지로 호출)
		
		int nowPage = 1; // 현재페이지를 처음에는 1로 초기화.
		
		// 현재페이지가 있으면 받아오기.
		if (request.getParameter("nowPage") != null && request.getParameter("nowPage") != "") {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		
		getlist(dto.getFaddress(), model, nowPage);
		return "/yyj/ajaxlistresult";
	}
	
	
	@RequestMapping("/food/create")
	public String create(Food_ReviewDTO dto, Model model) {
		//리뷰 입력
		try {
			dto.setContent(dto.getContent().replaceAll("<br>", "<br>&nbsp&nbsp&nbsp&nbsp&nbsp"));
			dto.setContent(dto.getContent().replaceAll("\u0020", "&nbsp"));
			int result = food_ReviewDAO.create(dto);
			model.addAttribute("result", result);
			System.out.println("자식테이블 생성 완료");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		//리스트 호출(크리에이트 이므로, 나우페이지를 1로 호출)
		getlist(dto.getFaddress(), model, 1);
		return "/yyj/ajaxlistresult";
	}
	
	
	@RequestMapping(value = "/food/ajaxlist", method = RequestMethod.GET)
	public String reviewlist(Model model, FoodDTO dto, HttpServletRequest request) {
		int nowPage = 1; // 현재페이지를 처음에는 1로 초기화.
		
		// 현재페이지가 있으면 받아오기.
		if (request.getParameter("nowPage") != null && request.getParameter("nowPage") != "") {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		
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
		getlist(dto.getFaddress(), model, nowPage);
		return "/yyj/ajaxlistresult";
	}
	
	public Model getlist(String faddress, Model model, int nowPage){
		int recordPerPage = 10; // 한페이지당 보여줄 글 개수
		
		int sno = ((nowPage - 1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage;
		
		Map map = new HashMap();
		map.put("faddress", faddress);
		map.put("sno", sno);
		map.put("eno", eno);
		List list;
		int total;
		double avgscore;
		String paging;
		
		try {
			//총 리뷰 갯수
			total = food_ReviewDAO.total(map);
			model.addAttribute("total", total);
			//System.out.println("토탈 갯수는: " + total);
			
			
			//하나라도 글이 있을 경우에만 해야할 것 들
			if(total != 0){
				//마지막 페이지 삭제 검증
				if (total < sno) {
					//System.out.println("나우페이지 -1 작업수행");
					nowPage = nowPage - 1;
					
					//sno eno 나우페이지에 맞게 바꿔주기
					sno = ((nowPage - 1) * recordPerPage) + 1;
					eno = nowPage * recordPerPage;
					
					map.put("sno", sno);
					map.put("eno", eno);
				}
				
				//페이징
				paging = new Paging().foodpaging(total, nowPage, recordPerPage, faddress);
				model.addAttribute("paging", paging);
				//System.out.println(paging);
				
				//총평점
				avgscore = food_ReviewDAO.avgscore(map);
				model.addAttribute("avgscore", avgscore);
				//System.out.println("총 평점: " + avgscore);
			}
	
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
