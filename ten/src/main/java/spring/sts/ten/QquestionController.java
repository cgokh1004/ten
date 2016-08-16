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

import spring.model.qquestion.*;
import spring.utility.ten.*;

@Controller
public class QquestionController {

	@Autowired
	private QquestionDAO dao;
	
	@RequestMapping(value="/qquestion/create", method=RequestMethod.POST)
	public String create(QquestionDTO dto) {
		if(dao.create(dto)>0){
			return "redirect:/qquestion/list";
		} else{
			return "error/error";
		}
	}
	
	@RequestMapping(value="/qquestion/create", method=RequestMethod.GET)
	public String create() {
		return "/qquestion/create";
	}
	
	@RequestMapping("/qquestion/read")
	public String read(int qqno, Model model) {
		dao.upViewcnt(qqno);
		model.addAttribute("dto", dao.read(qqno));
		
		return "/qquestion/read";
	}
	
	@RequestMapping(value="/qquestion/delete", method=RequestMethod.GET)
	public String delete(){
		
		return "/qquestion/delete";
	}
	
	@RequestMapping(value="/qquestion/delete", method=RequestMethod.POST)
	public String delete(int qqno,Model model,HttpServletRequest request){
		
		if(dao.delete(qqno)>0){
			model.addAttribute("col", request.getParameter("col"));
			model.addAttribute("word", request.getParameter("word"));
			model.addAttribute("nowPage", request.getParameter("nowPage"));
			return "redirect:/qquestion/list";
		}else{
		return "error/error";
		}
	}
	
	@RequestMapping(value="/qquestion/update", method=RequestMethod.GET)
	public String update(int qqno,Model model){
		
		model.addAttribute("dto", dao.read(qqno));
		
		return "/qquestion/update";
	}
	
	@RequestMapping(value="/qquestion/update", method=RequestMethod.POST)
	public String update(QquestionDTO dto, Model model, HttpServletRequest request){
		
		if(dao.update(dto)>0){
			model.addAttribute("col", request.getParameter("col"));
			model.addAttribute("word", request.getParameter("word"));
			model.addAttribute("nowPage", request.getParameter("nowPage"));
			return "redirect:/qquestion/list";
		}else{
			return "error/error";
		}
		
	}
	
	@RequestMapping("/qquestion/list")
	public String list(HttpServletRequest request, Model model){
		
		String col =Utility.nullCheck(request.getParameter("col"));
		String word =Utility.nullCheck(request.getParameter("word"));
		
		if(col.equals("total"))word="";
		//paging 관련
		
		
		int nowPage=1;//현재 페이지
		if(request.getParameter("nowPage")!=null){
			nowPage= Integer.parseInt(request.getParameter("nowPage"));
		}
		int recordPerPage= 5;//한페이지당 보여줄 레코드(글의)갯수
		
		int sno=((nowPage-1)*recordPerPage)+1;
		int eno=nowPage*recordPerPage;

		Map map= new HashMap();
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("col", col);
		map.put("word", word);

		List<QquestionDTO> list =dao.list(map);
		
		int total = dao.total(map);
		
		String paging =new Paging().paging3(total, nowPage, recordPerPage, col, word);
		
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("col", col);
		model.addAttribute("word", word);
		model.addAttribute("nowPage", nowPage);
		
		return "/qquestion/list";
	}
}
