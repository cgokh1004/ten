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

import spring.model.bbs.BbsDAO;
import spring.model.bbs.BbsDTO;
import spring.model.bbs.BbsService;
import spring.model.bbs.ReplyDAO;
import spring.model.bbs.ReplyDTO;
import spring.utility.ten.Paging;
import spring.utility.ten.Utility;


@Controller
public class BbsController {
	@Autowired
	private BbsService service; //추가
	@Autowired
	private ReplyDAO rdao;
	 
	@RequestMapping("/bbs/rdelete")
	public String rdelete(int rnum,int bbsno, int nowPage,int nPage, String col, String word,Model model){ 
	 
	int total = rdao.total(bbsno);//댓글전체레코드값을 가져와서
	int totalPage = (int)(Math.ceil((double)total/3)); // 전체 페이지  
	if(rdao.delete(rnum)){
	if(nPage!=1&&nPage==totalPage&&total%3==1){//마지막페이지의 마지막레코드이면(3은 한페이지당보여줄 레코드 갯수)
	nPage=nPage-1;  //현재의 페이지값에서 1을 빼자 
	}
	model.addAttribute("bbsno", bbsno);
	model.addAttribute("nowPage", nowPage);
	model.addAttribute("nPage", nPage);
	model.addAttribute("col", col);
	model.addAttribute("word", word);
	 
	}else{
	return "error/error";
	}
	 
	return "redirect:./read";
	}
	 
	@RequestMapping("/bbs/rupdate")
	public String rupdate(ReplyDTO dto,int nowPage,int nPage, String col, String word,Model model){
	if(rdao.update(dto)){
	model.addAttribute("bbsno", dto.getBbsno());
	model.addAttribute("nowPage", nowPage);
	model.addAttribute("nPage", nPage);
	model.addAttribute("col", col);
	model.addAttribute("word", word);
	}else{
	return "error/error";
	}
	 
	return "redirect:./read";
	}
	@RequestMapping("/bbs/rcreate")
	public String rcreate(ReplyDTO dto,int nowPage,String col, String word,Model model){
	 
	if(rdao.create(dto)){
	model.addAttribute("bbsno", dto.getBbsno());
	model.addAttribute("nowPage", nowPage);
	model.addAttribute("col", col);
	model.addAttribute("word", word);
	}else{
	return "error/error";
	}
	 
	return "redirect:./read";
	}
	@Autowired
	BbsDAO dao;
	
	@RequestMapping(value="/bbs/delete",method=RequestMethod.POST)
	public String delete(int bbsno,String passwd,Model model,String col,String word,int nowPage){
		String url = "/error/passwdError";
		if(dao.checkPasswd(bbsno, passwd)>0){
			try{ 
//	                rdao.bdelete(bbsno);//게시판글의 댓글들 삭제
//	                dao.delete(bbsno);//게시판글 삭제
	                  service.delete(bbsno);
	                  model.addAttribute("nowPage", nowPage);
	                  model.addAttribute("word", word);
	                  model.addAttribute("col", col);
	                  url = "redirect:/bbs/list";
	            }catch(Exception e){
	                 e.printStackTrace();
	                url = "/error/error";
	           }
		}
		return url;
	}
	@RequestMapping(value="/bbs/delete",method=RequestMethod.GET)
	public String delete(){
		
		return "/bbs/delete";
	}
	@RequestMapping(value="bbs/reply",method=RequestMethod.POST)
	public String reply(BbsDTO dto,Model model,String col,String word,int nowPage){
			dao.addAnsnum(dto.getGrpno(), dto.getAnsnum());
		if(dao.reply(dto)>0){
			model.addAttribute("col",col);
			model.addAttribute("word",word);
			model.addAttribute("nowPage",nowPage);
		return "redirect:/bbs/list";
		}else{
			return "/error/error";
		}
	}
	@RequestMapping(value="bbs/reply",method=RequestMethod.GET)
	public String reply(int bbsno,Model model){
		BbsDTO dto=dao.readReply(bbsno);
		model.addAttribute("dto", dto);
		return "/bbs/reply";
	}
	
	@RequestMapping(value = "/bbs/update", method = RequestMethod.POST)
	public String update(BbsDTO dto,Model model,String col,String word,int nowPage) {

		int checkpw = dao.checkPasswd(dto.getBbsno(), dto.getPasswd());
		if (checkpw == 1) {
			if (dao.update(dto) > 0) {
				model.addAttribute("col",col);
				model.addAttribute("word",word);
				model.addAttribute("nowPage",nowPage);
				return "redirect:/bbs/list";
		} else {
			return "/error/error";
		}
		}else{
			model.addAttribute("col",col);
			model.addAttribute("word",word);
			model.addAttribute("nowPage",nowPage);
			return"/error/passwdError";
		}
	}
	@RequestMapping(value="/bbs/update",method=RequestMethod.GET)
	public String update(int bbsno,Model model){
		
		BbsDTO dto=dao.read(bbsno);
		model.addAttribute("dto", dto);
		return "/bbs/update";
	}
	@RequestMapping(value="/bbs/create",method=RequestMethod.POST)
	public String create(BbsDTO dto,Model model){
		int cnt=dao.create(dto);
		if(cnt==1){
		model.addAttribute("cnt", cnt);
		return "redirect:/bbs/list";
		}else{
			return "/error/error";
		}
	}
	@RequestMapping(value="/bbs/create",method=RequestMethod.GET)
	public String create(){
		
		return "/bbs/create";
	}
	
	@RequestMapping("/bbs/read")
	public String read(int nowPage, String col, String word, int bbsno, Model model, HttpServletRequest request){

		dao.increaseViewcnt(bbsno);
		 BbsDTO dto=dao.read(bbsno);
         String content=dto.getContent();
		 content=content.replaceAll("\r\n", "<br>");
		 
		 dto.setContent(content);
		 
		 model.addAttribute("dto", dto);
		 /* 댓글 관련  시작 */
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
		 map.put("bbsno", bbsno);
		  
		 List<ReplyDTO> list = rdao.list(map);
		  
		 int total = rdao.total(bbsno);
		  
		 String paging = Utility.paging1(total, nPage, recordPerPage, url,bbsno,nowPage, col,word);
		  
		 model.addAttribute("rlist",list);
		 model.addAttribute("paging",paging);
		 model.addAttribute("nPage",nPage);
		 /* 댓글 관련 끝 */ 
		return "/bbs/read";
	}
	@RequestMapping("/bbs/list")
	public String list(HttpServletRequest request,Model model){
		int nowPage=1;//현재페이지
		if(request.getParameter("nowPage")!=null){
			nowPage=Integer.parseInt(request.getParameter("nowPage"));
		}
		int recordPerPage = 5;//한페이지당 보여줄 레코드 개수
		int sno=((nowPage-1)*recordPerPage)+1;
		int eno= nowPage*recordPerPage;
		//검색관련 변수 선언
		String col=Utility.nullCheck(request.getParameter("col"));
		String word=Utility.nullCheck(request.getParameter("word"));

		if(col.equals("total")) word="";

		Map map=new HashMap();
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("col",col);
		map.put("word",word);
		
		List<BbsDTO> list=dao.list(map);
		int total=dao.total(col,word);
		
		String paging=new Paging().paging3(total, nowPage, recordPerPage, col, word);
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("col", col);
		model.addAttribute("word", word);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("rdao", rdao); //댓글갯수를 위한 rdao
		return "/bbs/list";
	}

}
