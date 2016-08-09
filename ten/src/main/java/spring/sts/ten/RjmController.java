package spring.sts.ten;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import spring.model.tra_reply.Tra_ReplyDAO;
import spring.model.tra_reply.Tra_ReplyDTO;
import spring.model.travel.TraDAO;
import spring.model.travel.TraDTO;
import spring.utility.ten.Paging;
import spring.utility.ten.Utility;

@Controller
public class RjmController {


	@Autowired
	private TraDAO dao;
	
	@Autowired
	private Tra_ReplyDAO tra_Replydao;  
	
	@RequestMapping("/travel/rdelete")
	public String rdelete(int treply_no,int tra_no, int nowPage,int nPage, String col, String word,Model model){ 
	 
	int total = tra_Replydao.total(tra_no);//댓글전체레코드값을 가져와서
	int totalPage = (int)(Math.ceil((double)total/3)); // 전체 페이지  
	if(tra_Replydao.delete(treply_no)){
	if(nPage!=1&&nPage==totalPage&&total%3==1){//마지막페이지의 마지막레코드이면(3은 한페이지당보여줄 레코드 갯수)
	nPage=nPage-1;  //현재의 페이지값에서 1을 빼자 
	}
	model.addAttribute("tra_no", tra_no);
	model.addAttribute("nowPage", nowPage);
	model.addAttribute("nPage", nPage);
	model.addAttribute("col", col);
	model.addAttribute("word", word);
	 
	}else{
	return "error/error";
	}
	 
	return "redirect:./read";
	}
	 
	@RequestMapping("/travel/rupdate")
	public String rupdate(Tra_ReplyDTO dto,int nowPage,int nPage, String col, String word,Model model){
	if(tra_Replydao.update(dto)){
	model.addAttribute("tra_no", dto.getTra_no());
	model.addAttribute("nowPage", nowPage);
	model.addAttribute("nPage", nPage);
	model.addAttribute("col", col);
	model.addAttribute("word", word);
	}else{
	return "error/error";
	}
	 
	return "redirect:./read";
	}
	@RequestMapping("/travel/rcreate")
	public String rcreate(Tra_ReplyDTO dto,int nowPage,String col, String word,Model model){
	 
	if(tra_Replydao.create(dto)){
	model.addAttribute("tra_no", dto.getTra_no());
	model.addAttribute("nowPage", nowPage);
	model.addAttribute("col", col);
	model.addAttribute("word", word);
	}else{
	return "error/error";
	}
	 
	return "redirect:./read";
	}
	
	/*-------------------------댓글*/
	
	@RequestMapping(value = "/travel/list")
	public String list(HttpServletRequest request, Model model) {

		String col = Utility.nullCheck(request.getParameter("col"));
		String word = Utility.nullCheck(request.getParameter("word"));
		if (col.equals("total"))
			word = "";
		int nowPage = 1;
		int recordPerPage = 5;

		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}

		int sno = ((nowPage - 1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage;

		Map map = new HashMap();
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("col", col);
		map.put("word", word);

		List<TraDTO> list = dao.list(map);
		int total = dao.total(col, word);

		String paging = new Paging().paging3(total, nowPage, recordPerPage, col, word);

		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("col", col);
		model.addAttribute("word", word);
		model.addAttribute("nowPage", nowPage);

		return "/travel/list";
	}

	@RequestMapping("/travel/read")
	public String read(int nowPage, String col, String word, int tra_no, Model model, HttpServletRequest request) {

		TraDTO dto = dao.read(tra_no);
		String content = dto.getContent();
		content = content.replaceAll("\r\n", "<br>");

		dto.setContent(content);

		model.addAttribute("dto", dto);
		
		String url = "read";
		int nPage= 1; //시작 페이지 번호는 1부터 
		 
		if (request.getParameter("nPage") != null) { 
		nPage= Integer.parseInt(request.getParameter("nPage"));  
		}
		int recordPerPage = 3; // 한페이지당 출력할 레코드 갯수
		 
		int sno = ((nPage-1) * recordPerPage) + 1; // 
		int eno = nPage * recordPerPage;
		 
		Map map = new HashMap();
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("bbsno", tra_no);
		 
		List<Tra_ReplyDTO> list = tra_Replydao.list(map);
		 
		int total = tra_Replydao.total(tra_no);
		 
		String paging = Utility.paging(total, nPage, recordPerPage, url,tra_no,nowPage, col,word);
		 
		model.addAttribute("rlist",list);
		model.addAttribute("paging",paging);
		model.addAttribute("nPage",nPage);
		 
		/* 댓글 관련 끝 */ 
		
		
		return "/travel/read";
	}

	@RequestMapping(value = "/travel/create", method = RequestMethod.POST)
	public String create(TraDTO dto, HttpServletRequest request, Model model) {

		String basePath = request.getRealPath("/storage");

		int size = (int) dto.getFnameMF().getSize();
		String filename = "member.jpg";
		if (size > 0) {
			filename = Utility.saveFile(dto.getFnameMF(), basePath);
		}
		dto.setFilename(filename);

		if (dao.create(dto) > 0) {
			return "redirect:/travel/list";
		} else {
			return "error/error";
		}
	}

	@RequestMapping(value = "/travel/create", method = RequestMethod.GET)
	public String create() {

		return "/travel/create";
	}

	@RequestMapping(value = "/travel/update", method = RequestMethod.POST)
	public String update(TraDTO dto, int tra_no, String passwd, String oldfile, MultipartFile fnameMF,
			HttpServletRequest request) {

		String basePath = request.getRealPath("/storage");
		String filename = "";
		int size = (int) fnameMF.getSize();

		if (size > 0) {
			Utility.deleteFile(basePath, oldfile);
			filename = Utility.saveFile(fnameMF, basePath);
		}

		dto.setFilename(filename);

		if (dao.update(dto) > 0 && dao.updateFile(filename, tra_no) > 0) {
			return "redirect:/travel/list";
		} else {
			return "error/error";
		}
	}

	@RequestMapping(value = "/travel/update", method = RequestMethod.GET)
	public String update(int tra_no, Model model) {

		TraDTO dto = dao.read(tra_no);

		model.addAttribute("dto", dto);

		return "/travel/update";
	}

	@RequestMapping(value = "/travel/delete", method = RequestMethod.POST)
	public String delete(int tra_no, String oldfile, HttpServletRequest request, HttpSession session) {

		String upDir = request.getRealPath("/storage");

		if (dao.delete(tra_no) > 0) {
			Utility.deleteFile(upDir, oldfile);
			session.invalidate();
			return "redirect:/travel/list";
		} else {
			return "error/error";
		}

	}

	@RequestMapping(value = "/travel/delete", method = RequestMethod.GET)
	public String delete(String tra_no, String oldfile, Model model) {

		model.addAttribute("tra_no", tra_no);
		model.addAttribute("oldfile", oldfile);

		return "/travel/delete";
	}

}