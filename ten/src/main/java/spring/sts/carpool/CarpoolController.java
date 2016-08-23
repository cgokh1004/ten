package spring.sts.carpool;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.model.carpool.CarpoolDAO;
import spring.model.carpool.CarpoolDTO;
import spring.model.carpool_reply.Carpool_ReplyDAO;
import spring.model.carpool_reply.Carpool_ReplyDTO;
import spring.model.member.MemberDAO;
import spring.utility.ten.Paging;
import spring.utility.ten.Utility;

/**
 * Handles requests for the application home page.
 */
@Controller
public class CarpoolController {
	
	@Autowired
	private CarpoolDAO carpoolDAO;
	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private Carpool_ReplyDAO carpool_replyDAO;
	
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
	@RequestMapping(value="/carpool/create3",method=RequestMethod.POST)
	public String create3(CarpoolDTO dto,Model model){
		model.addAttribute("carpoolDTO",dto);
		return "/carpool/create3";
	}
	@RequestMapping(value="/carpool/create",method=RequestMethod.POST)
	public String create(CarpoolDTO dto,Model model,HttpSession session){
		try {
			dto.setId((String)session.getAttribute("id"));
			int cnt=carpoolDAO.create(dto);
			if(cnt==1){
				return "redirect:/carpool/list";
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/error/error";
	}
	
	@RequestMapping("/carpool/read")
	public String read1(int carpoolno,int nowPage,String kind1,String kind2,String word1,String word2,
			Model model,HttpServletRequest request){
		try {
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
			map.put("carpoolno", carpoolno);
			 
			List<Carpool_ReplyDTO> list = carpool_replyDAO.list(map);
			Map map1= new HashMap();
			map1.put("carpoolno", carpoolno);
			int total = carpool_replyDAO.total(map1);
			 
			String paging = Utility.paging(total, nPage, recordPerPage, url,carpoolno,nowPage, kind1,kind2,word1,word2);
			 
			model.addAttribute("rlist",list);
			model.addAttribute("paging",paging);
			model.addAttribute("nPage",nPage);
			 
			/* 댓글 관련 끝 */ 
			Object pk=(Object)carpoolno;
			CarpoolDTO carpoolDTO=(CarpoolDTO) carpoolDAO.read(pk);
			String c_comment=carpoolDTO.getC_comment().replaceAll("\r\n", "<BR>");
			carpoolDTO.setC_comment(c_comment);
			carpoolDTO.setCarpoolno(carpoolno);
			model.addAttribute("carpoolDTO",carpoolDTO);
			model.addAttribute("kind1",kind1);
			model.addAttribute("kind2",kind2);
			model.addAttribute("word1",word1);
			model.addAttribute("word2",word2);
			
			if(carpoolDTO.getC_type().equals("정기카풀")){	
				if(carpoolDTO.getKind().equals("타세요")){
					return "/carpool/read1-1";
				}
				if(carpoolDTO.getKind().equals("태워주세요")){
					return "/carpool/read1-2";
				}
			}
			if(carpoolDTO.getC_type().equals("단기카풀")){
				if(carpoolDTO.getKind().equals("타세요")){
					return "/carpool/read2-1";
				}
				if(carpoolDTO.getKind().equals("태워주세요")){
					return "/carpool/read2-1";
				}
			}
			if(carpoolDTO.getC_type().equals("여성전용카풀")){				
				if(carpoolDTO.getKind().equals("타세요")){
					return "/carpool/read3-1";
				}
				if(carpoolDTO.getKind().equals("태워주세요")){
					return "/carpool/read3-2";
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/error/error";
	}
	
	@RequestMapping(value="/carpool/update_s",method=RequestMethod.POST)
	public String update_s(CarpoolDTO dto,Model model){
		String c_comment=dto.getC_comment().replaceAll("<BR>", "\n");
		dto.setC_comment(c_comment);
		model.addAttribute("carpoolDTO",dto);
		return "/carpool/update_s";
	}
	
	@RequestMapping(value="/carpool/update",method=RequestMethod.POST)
	public String update(CarpoolDTO dto,Model model){
		String c_comment=dto.getC_comment().replaceAll("\r\n", "<BR>");
		dto.setC_comment(c_comment);
		try {
				if(carpoolDAO.update(dto)>0){
					model.addAttribute("carpoolDTO", dto);
				}
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(dto.getC_type().equals("정기카풀")){
			if(dto.getKind().equals("타세요")){
				return "/carpool/read1-1";
			}
			if(dto.getKind().equals("태워주세요")){
				return "/carpool/read1-2";
			}
		}
		if(dto.getC_type().equals("단기카풀")){
			if(dto.getKind().equals("타세요")){
				return "/carpool/read2-1";
			}
			if(dto.getKind().equals("태워주세요")){
				return "/carpool/read2-2";
			}
		}
		if(dto.getC_type().equals("여성전용카풀")){				
			if(dto.getKind().equals("타세요")){
				return "/carpool/read3-1";
			}
			if(dto.getKind().equals("태워주세요")){
				return "/carpool/read3-2";
			}
		}
		return "error/error";
	}
	
	@RequestMapping(value="/carpool/delete",method=RequestMethod.GET)
	public String delete(int carpoolno){
		try {
			Object pk = (Object)carpoolno;
			if(carpoolDAO.delete(pk)>0){
				return "redirect:/carpool/list";
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "error/error";
	}
	
	@RequestMapping("/carpool/rdelete")
	public String rdelete(int crep_no,int carpoolno, int nowPage,int nPage, String kind1,String kind2, 
			String word1,String word2,Model model){ 
	try {
		Object pk=(Object) crep_no;
		Map map=new HashMap();
		map.put("carpoolno", carpoolno);
		int total;
		total = carpool_replyDAO.total(map);
		int totalPage = (int)(Math.ceil((double)total/3)); // 전체 페이지  
		//댓글전체레코드값을 가져와서
		if(carpool_replyDAO.delete(pk)>0){
			if(nPage!=1&&nPage==totalPage&&total%3==1){//마지막페이지의 마지막레코드이면(3은 한페이지당보여줄 레코드 갯수)
				nPage=nPage-1;  //현재의 페이지값에서 1을 빼자 
			}
			model.addAttribute("carpoolno", carpoolno);
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("nPage", nPage);
			model.addAttribute("kind1", kind1);
			model.addAttribute("kind2", kind2);
			model.addAttribute("word1", word1);
			model.addAttribute("word2", word2);
			
			return "redirect:./read";
		}else{
			return "error/error";
		}
		
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	    return "error/error";
	}
	 
	@RequestMapping("/carpool/rupdate")
	public @ResponseBody List<Carpool_ReplyDTO> rupdate(Carpool_ReplyDTO dto,int nowPage,int nPage, String kind1,String kind2, 
			String word1,String word2,Model model){
	try {
		dto.setContent(dto.getContent().replaceAll("\r\n", "<BR>"));
		dto.setContent(dto.getContent().replaceAll("\u0020", "&nbsp"));
		if(carpool_replyDAO.update(dto)>0){
			Map map = new HashMap();
			map.put("sno", 1);
			map.put("eno", 3);
			map.put("carpoolno", dto.getCarpoolno());
			List<Carpool_ReplyDTO> list = carpool_replyDAO.list(map);
		return list;
		}
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}	 
		return null;
	}
	
	@RequestMapping(value="/carpool/rcreate", method=RequestMethod.POST)
	public @ResponseBody List<Carpool_ReplyDTO> rcreate(Carpool_ReplyDTO dto,int nowPage,String kind1,String kind2, 
			String word1,String word2,Model model,HttpSession session){
	 
	try {
		dto.setId((String)session.getAttribute("id"));
		dto.setContent(dto.getContent().replaceAll("\r\n", "<BR>"));
		dto.setContent(dto.getContent().replaceAll("\u0020", "&nbsp"));
		if(carpool_replyDAO.create(dto)>0){
			Map map = new HashMap();
			map.put("sno", 1);
			map.put("eno", 3);
			map.put("carpoolno", dto.getCarpoolno());
			List<Carpool_ReplyDTO> list = carpool_replyDAO.list(map);
		return list;
	} 
		}catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		return null;
	}	
}
