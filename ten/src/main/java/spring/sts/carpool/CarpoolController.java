package spring.sts.carpool;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	public String create1(CarpoolDTO dto,Model model){
		model.addAttribute("carpoolDTO",dto);
		return "/carpool/create1";
	}
	@RequestMapping("/carpool/create2")
	public String create2(CarpoolDTO dto,Model model){
		model.addAttribute("carpoolDTO",dto);
		return "/carpool/create2";
	}
	@RequestMapping(value="/carpool/create",method=RequestMethod.POST)
	public String create(CarpoolDTO dto,Model model){
		try {
			System.out.println("----------------------------------------------------------");
			Map map = model.asMap();
			System.out.println("모델에서뽑아오기나오냐?" + ((CarpoolDTO)map.get("carpoolDTO")).getSeat());
			dto.setId("ktw3722");
			System.out.println("----------------------------------------------------------");
			System.out.println(dto.getC_comment());
			System.out.println(dto.getC_end());
			System.out.println(dto.getC_endv());
			System.out.println(dto.getC_start());
			System.out.println(dto.getC_startv());
			System.out.println(dto.getC_type());
			System.out.println(dto.getCarpooldate());
			System.out.println(dto.getCarpoolno());
			System.out.println(dto.getId());
			System.out.println(dto.getKind());
			System.out.println(dto.getPrice());
			System.out.println(dto.getPurpose());
			System.out.println(dto.getSeat());
			System.out.println(dto.getSmoke());
			System.out.println(dto.getStartdate());
			System.out.println(dto.getVia());
			System.out.println(dto.getViav());
			int cnt=carpoolDAO.create(dto);
			if(cnt==1){
				model.addAttribute("cnt", cnt);
				return "redirect:/bbs/list";
				}else{
					return "/error/error";
				}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/error/error";
	}
	@RequestMapping(value="/carpool/create3",method=RequestMethod.POST)
	public String create3(CarpoolDTO dto,Model model){
		model.addAttribute("carpoolDTO",dto);
		return "/carpool/create3";
	}
}
