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

import spring.model.advise.*;
import spring.utility.ten.*;

@Controller
public class AdviseController {
	@Autowired
	private AdviseDAO dao;
	
	@RequestMapping(value = "/advise/create", method = RequestMethod.GET)
	public String create() {
		return "/advise/create";
	}
	
	@RequestMapping(value = "/advise/create", method = RequestMethod.POST)
	public String create(AdviseDTO dto) {
		if(dao.create(dto) > 0) {
			return "redirect:/advise/list";
		} else {
			return "/error/error";
		}
	}
	
	@RequestMapping(value="/advise/delete", method=RequestMethod.GET)
	public String delete(){
		
		return "/advise/delete";
	}
	
	@RequestMapping(value="/advise/delete", method=RequestMethod.POST)
	public String delete(int advno, String id, Model model,HttpServletRequest request){
		if(dao.delete(advno) > 0){
			model.addAttribute("col", request.getParameter("col"));
			model.addAttribute("word", request.getParameter("word"));
			model.addAttribute("nowPage", request.getParameter("nowPage"));
			return "redirect:/advise/list";
		}else{
		return "error/error";
		}
	}
	
	@RequestMapping(value="/advise/update", method=RequestMethod.GET)
	public String update(int advno,Model model){
		
		model.addAttribute("dto", dao.read(advno));
		
		return "/advise/update";
	}
	
	@RequestMapping(value="/advise/update", method=RequestMethod.POST)
	public String update(int advno, String id, AdviseDTO dto, Model model, HttpServletRequest request){
		if(dao.update(dto) > 0){
			model.addAttribute("col", request.getParameter("col"));
			model.addAttribute("word", request.getParameter("word"));
			model.addAttribute("nowPage", request.getParameter("nowPage"));
			return "redirect:/advise/list";
		}else{
			return "error/error";
		}
		
	}
	
	@RequestMapping(value = "/advise/reply", method = RequestMethod.POST)
	public String reply(AdviseDTO dto, HttpServletRequest request, Model model) {

		dao.addAnsnum(dto.getGroupno(), dto.getAnsnum());
		if (dao.reply(dto) > 0) {
			model.addAttribute("nowPage", request.getParameter("nowPage"));
			model.addAttribute("col", request.getParameter("col"));
			model.addAttribute("word", request.getParameter("word"));
			return "redirect:/advise/list";
		} else {
			return "error/error";
		}

	}

	@RequestMapping(value = "/advise/reply", method = RequestMethod.GET)
	public String reply(int advno, Model model) {

		model.addAttribute("dto", dao.readReply(advno));

		return "/advise/reply";
	}
	
	@RequestMapping("/advise/read")
	public String read(int advno, Model model){
		dao.increaseViewcnt(advno);
		model.addAttribute("dto", dao.read(advno));
		
		return "/advise/read";
	}
	
	@RequestMapping("/advise/list")
	public String list(HttpServletRequest request, Model model) {

		int nowPage = 1;// 현재 페이지
		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		
		int recordPerPage = 5;// 한페이지당 보여줄 레코드(글의)갯수

		int sno = ((nowPage - 1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage;

		// 검색관련 변수 선언
		String col = Utility.nullCheck(request.getParameter("col"));
		String word = Utility.nullCheck(request.getParameter("word"));

		if (col.equals("total"))
			word = "";

		Map map = new HashMap();
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("col", col);
		map.put("word", word);

		List<AdviseDTO> list = dao.list(map);

		int total = dao.total(col, word);

		String paging = new Paging().paging3(total, nowPage, recordPerPage, col, word);

		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("col", col);
		model.addAttribute("word", word);
		model.addAttribute("nowPage", nowPage);

		return "/advise/list";
	}
}
