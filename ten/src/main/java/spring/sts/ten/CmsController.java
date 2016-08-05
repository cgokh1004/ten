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

import spring.model.car.CarDAO;
import spring.model.car.CarDTO;
import spring.utility.ten.Paging;
import spring.utility.ten.Utility;


@Controller
public class CmsController {

	@Autowired
	private CarDAO dao;
	
	
	@RequestMapping("/rentcar/rentcar")
	public String rent(HttpServletRequest request, Model model){
		
		int nowPage = 1;
		if(request.getParameter("nowPage")!=null){
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		int recordPerPage =5;
		
		int sno =((nowPage-1)*recordPerPage)+1;
		int eno =nowPage * recordPerPage;
		
		String col = Utility.nullCheck(request.getParameter("col"));
		String word =Utility.nullCheck(request.getParameter("word"));
		
		if(col.equals("total"))
			word="";
		
		Map map =new HashMap();
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("col", col);
		map.put("word", word);
		
		List<CarDTO> carlist = dao.list(map);
		
		int total =dao.total(col, word);
		
		String paging = new Paging().paging3(total, nowPage, recordPerPage, col, word);
		
		model.addAttribute("carlist", carlist);
		model.addAttribute("paging" , paging);
		model.addAttribute("col" , col);
		model.addAttribute("word" , word);
		model.addAttribute("nowPage" , nowPage);
		
		return "/rentcar/rentcar";
		 
	}
	
	
	@RequestMapping(value="/rentcar/regist", method=RequestMethod.POST)
	public String create(CarDTO dto, HttpServletRequest request){
		
		String basePath = request.getRealPath("./storage");
		
		String filename =null;
		
		int fsize = (int)dto.getFilenameMF().getSize();
		
		if(fsize>0){
			filename =Utility.saveFile(dto.getFilenameMF(), basePath);
		}else{
			filename="imgfornull.jpg";
		}
		
		dto.setFilename(filename);
		
		if(dao.create(dto)>0){
			return "redirect:/rentcar/carlist";
		}else{
			return "error";
		}
	}
	
	@RequestMapping(value ="/rentcar/regist", method= RequestMethod.GET)
	public String create(){
		
		return "/rentcar/regist";
	}
	
	@RequestMapping("/rentcar/carlist")
	public String list(HttpServletRequest request, Model model){
		
		int nowPage = 1;
		if(request.getParameter("nowPage")!=null){
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		int recordPerPage =5;
		
		int sno =((nowPage-1)*recordPerPage)+1;
		int eno =nowPage * recordPerPage;
		
		String col = Utility.nullCheck(request.getParameter("col"));
		String word =Utility.nullCheck(request.getParameter("word"));
		
		if(col.equals("total"))
			word="";
		
		Map map =new HashMap();
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("col", col);
		map.put("word", word);
		
		List<CarDTO> carlist = dao.list(map);
		
		int total =dao.total(col, word);
		
		String paging = new Paging().paging3(total, nowPage, recordPerPage, col, word);
		
		model.addAttribute("carlist", carlist);
		model.addAttribute("paging" , paging);
		model.addAttribute("col" , col);
		model.addAttribute("word" , word);
		model.addAttribute("nowPage" , nowPage);
		
		return "/rentcar/carlist";
	}
	
	@RequestMapping("/rentcar/read")
	public String read(int nowPage, String col, String word, String carno, Model model, HttpServletRequest request){
		
		CarDTO dto = dao.read(carno);
		
		model.addAttribute("dto", dto);
		
		return "/rentcar/read";
	}
	
	@RequestMapping(value="/rentcar/update", method=RequestMethod.POST)
	public String update(CarDTO dto, HttpServletRequest request, Model model){
		
		int cnt = dao.checkPasswd(dto.getCarno(), dto.getPasswd());
		
		if(cnt==1){
			if(dao.update(dto)>0){

			return "redirect:/rentcar/carlist";
			
			}
			else{
				return "error/error";
			}
		}else{
			return "error/passwdError";
		}
		
		
	}
	@RequestMapping(value="/rentcar/update", method=RequestMethod.GET)
	public String update(String carno, Model model){


		model.addAttribute("dto", dao.read(carno));
		
		
		return "/rentcar/update";
	}
	
	@RequestMapping(value="/rentcar/delete", method=RequestMethod.GET)
	public String delete(String carno){
		
		return "/rentcar/delete";

	}
	@RequestMapping(value="/rentcar/delete", method=RequestMethod.POST)
	public String delete(String carno, String passwd){
		
		int cnt = dao.checkPasswd(carno, passwd);
		if(cnt==1){
			if(dao.delete(carno)>0){
				
				return "/rentcar/carlist";
			}else{
				
				return "/error/error";
			}
		}else{
			
			return "/error/passwdError";
		}
	
		
	}
	
}
