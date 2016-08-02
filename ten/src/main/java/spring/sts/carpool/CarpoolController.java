package spring.sts.carpool;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.model.carpool.CarpoolDAO;
import spring.model.carpool.CarpoolDTO;
import spring.model.member.MemberDTO;
import spring.utility.ten.Paging;
import spring.utility.ten.Utility;

/**
 * Handles requests for the application home page.
 */
@Controller
public class CarpoolController {
	
	@Autowired
	CarpoolDAO carpoolDAO;
	@Autowired
	CarpoolDAO MemberDAO;
	
	@RequestMapping("/carpool/list")
	public String list(HttpServletRequest request,Model model){
		int nowPage=1;//현재페이지
		if(request.getParameter("nowPage")!=null){
			nowPage=Integer.parseInt(request.getParameter("nowPage"));
		}
		int recordPerPage = 5;//한페이지당 보여줄 레코드 개수
		int sno=((nowPage-1)*recordPerPage)+1;
		int eno= nowPage*recordPerPage;
		//검색관련 변수 선언
		String kind1=Utility.nullCheck(request.getParameter("kind1"));
		String kind2=Utility.nullCheck(request.getParameter("kind2"));
		String word1=Utility.nullCheck(request.getParameter("word1"));
		String word2=Utility.nullCheck(request.getParameter("word2"));

		Map map=new HashMap();
		map.put("kind1",kind1);
		map.put("kind2",kind2);
		map.put("word1",word1);
		map.put("word2",word2);
		map.put("sno", sno);
		map.put("eno", eno);
		
		List<CarpoolDTO> list;
		int total;
		try {
			list = carpoolDAO.list(map);
			model.addAttribute("list", list);
			total = carpoolDAO.total(map);
			String paging=new Paging().paging2(total, nowPage, recordPerPage, kind1, kind2, word1, word2);
			model.addAttribute("paging", paging);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		model.addAttribute("kind1", kind1);
		model.addAttribute("kind2", kind2);
		model.addAttribute("word1", word1);
		model.addAttribute("word2", word2);
		model.addAttribute("nowPage", nowPage);
		return "/carpool/list";
	}
	@RequestMapping("/carpool/create1")
	public String read(){
		return "/carpool/create1";
	}
}
