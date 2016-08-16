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

import spring.model.question.*;
import spring.utility.ten.*;

@Controller
public class QuestionController {
	@Autowired
	private QuestionDAO dao;
	
	@RequestMapping(value = "/question/create", method = RequestMethod.GET)
	public String create() {
		return "/question/create";
	}
	
	@RequestMapping(value = "/question/create", method = RequestMethod.POST)
	public String create(QuestionDTO dto) {
		if(dao.create(dto) > 0) {
			return "redirect:/question/list";
		} else {
			return "/error/error";
		}
	}
	
	@RequestMapping(value="/question/delete", method=RequestMethod.GET)
	public String delete(){
		
		return "/question/delete";
	}
	
	@RequestMapping(value="/question/delete", method=RequestMethod.POST)
	public String delete(int qno, String id, Model model,HttpServletRequest request){
		if(dao.delete(qno) > 0){
			model.addAttribute("col", request.getParameter("col"));
			model.addAttribute("word", request.getParameter("word"));
			model.addAttribute("nowPage", request.getParameter("nowPage"));
			return "redirect:/question/list";
		}else{
		return "error/error";
		}
	}
	
	@RequestMapping(value="/question/update", method=RequestMethod.GET)
	public String update(int qno,Model model){
		
		model.addAttribute("dto", dao.read(qno));
		
		return "/question/update";
	}
	
	@RequestMapping(value="/question/update", method=RequestMethod.POST)
	public String update(QuestionDTO dto, Model model, HttpServletRequest request){
		if(dao.update(dto) > 0){
			model.addAttribute("col", request.getParameter("col"));
			model.addAttribute("word", request.getParameter("word"));
			model.addAttribute("nowPage", request.getParameter("nowPage"));
			return "redirect:/question/list";
		}else{
			return "error/error";
		}
		
	}
	
	@RequestMapping(value = "/question/reply", method = RequestMethod.POST)
	public String reply(QuestionDTO dto, HttpServletRequest request, Model model) {

		dao.addAnsnum(dto.getGroupno(), dto.getAnsnum());
		if (dao.reply(dto) > 0) {
			model.addAttribute("nowPage", request.getParameter("nowPage"));
			model.addAttribute("col", request.getParameter("col"));
			model.addAttribute("word", request.getParameter("word"));
			return "redirect:/question/list";
		} else {
			return "error/error";
		}

	}

	@RequestMapping(value = "/question/reply", method = RequestMethod.GET)
	public String reply(int qno, Model model) {

		model.addAttribute("dto", dao.readReply(qno));

		return "/ks/question/reply";
	}
	
	@RequestMapping("/question/read")
	public String read(int qno, Model model){
		dao.increaseViewcnt(qno);
		model.addAttribute("dto", dao.read(qno));
		
		return "/question/read";
	}
	
	@RequestMapping("/question/list")
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

		List<QuestionDTO> list = dao.list(map);

		int total = dao.total(col, word);

		String paging = new Paging().paging3(total, nowPage, recordPerPage, col, word);

		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("col", col);
		model.addAttribute("word", word);
		model.addAttribute("nowPage", nowPage);

		return "/question/list";
	}
}
