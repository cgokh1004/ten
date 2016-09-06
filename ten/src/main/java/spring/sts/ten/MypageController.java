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

import spring.model.carpool.CarpoolDAO;
import spring.model.carpool.CarpoolDTO;
import spring.model.carpool_booked.Carpool_BookedDAO;
import spring.model.carpool_booked.Carpool_BookedDTO;
import spring.model.carpool_review.Carpool_ReviewDAO;
import spring.model.carpool_review.Carpool_ReviewDTO;
import spring.model.member.MemberDAO;
import spring.model.member.MemberDTO;
import spring.utility.ten.Paging;
import spring.utility.ten.Utility;

@Controller
public class MypageController {
	
	@Autowired
	MemberDAO memberDAO;
	
	@Autowired
	CarpoolDAO carpoolDAO;
	
	@Autowired
	Carpool_BookedDAO carpool_bookedDAO;
	
	@Autowired
	Carpool_ReviewDAO carpool_reviewDAO;
	
	@RequestMapping(value="/mypage",method=RequestMethod.GET)
	public String mypage(HttpSession session,Model model){
		Object pk=(Object) session.getAttribute("id");
		try {
			MemberDTO dto = (MemberDTO) memberDAO.read(pk);
			model.addAttribute("memberDTO", dto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/mypage";
	}
	
	@RequestMapping(value="/mypage",method=RequestMethod.POST)
	public String mypage_update(MemberDTO dto,HttpServletRequest request,HttpSession session,
			MultipartFile mfileMF,MultipartFile passportMF,String old_mfile,String old_passport){
		 try {
			 String basePath=request.getRealPath("/storage");
				int msize = (int)mfileMF.getSize();
				int psize = (int)passportMF.getSize();
				String mfile="사진.jpg";
				String passport="passport.jpg";
				if(msize>0){
					if(old_mfile!=null&&!old_mfile.equals("사진.jpg")){
						Utility.deleteFile(basePath, old_mfile);
					}
					mfile=Utility.saveFile(mfileMF, basePath);
				}else{
					if(!old_mfile.equals("사진.jpg")){
						mfile=old_mfile;
					}
				}
				dto.setMfile(mfile);
				session.setAttribute("mfile", mfile);
				if(psize>0){
					if(old_passport!=null&&!old_passport.equals("passport.jpg")){
						Utility.deleteFile(basePath, old_passport);
					}
					passport=Utility.saveFile(passportMF, basePath);
				}else{
					if(!old_passport.equals("passport.jpg")){
						passport=old_passport;
					}
					
				}
				dto.setPassport(passport);
			 
			if(memberDAO.update1(dto)>0){
				if(memberDAO.loginCheck(dto.getId(), dto.getPasswd())>0){
					return "redirect:/mypage";
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 return "/error/error";
	}
	
	@RequestMapping("/mywrite")
	public String mywrite(HttpSession session,HttpServletRequest request,Model model){
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
		try {
			Map map1=new HashMap();
			map1.put("id", session.getAttribute("id"));
			map1.put("kind1",kind1);
			map1.put("kind2",kind2);
			map1.put("word1",word1);
			map1.put("word2",word2);
			map1.put("sno", sno);
			map1.put("eno", eno);
			List<CarpoolDTO> list=(List<CarpoolDTO>) carpoolDAO.read_id(map1);

			model.addAttribute("list",list);
			
			int total = carpoolDAO.total_id((String) session.getAttribute("id"));
			String paging=new Paging().paging1(total, nowPage, recordPerPage, kind1, kind2, word1, word2);
			model.addAttribute("paging", paging);
			
			model.addAttribute("kind1", kind1);
			model.addAttribute("kind2", kind2);
			model.addAttribute("word1", word1);
			model.addAttribute("word2", word2);
			model.addAttribute("nowPage", nowPage);
			return "/mywrite";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			return "error/error";
	}
	
	@RequestMapping("/reserving")
	public String reserving(HttpSession session,HttpServletRequest request,Model model){
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
		
		Map map = new HashMap();
		map.put("id", session.getAttribute("id"));
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);
		
		try {
			List<Carpool_BookedDTO> list = carpool_bookedDAO.read_reserving(map);
			model.addAttribute("list",list);
			
			int total = carpool_bookedDAO.total_reserving(map);
			String paging=new Paging().paging3(total, nowPage, recordPerPage, col,word);
			model.addAttribute("paging", paging);
			
			if(col==""){
				word="";
			}
			model.addAttribute("col", col);
			model.addAttribute("word", word);
			model.addAttribute("nowPage", nowPage);
			return "/reserving";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "error/error";
	}
	
	@RequestMapping("/reserved")
	public String reserved(HttpSession session,HttpServletRequest request,Model model){
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
		
		Map map = new HashMap();
		map.put("id", session.getAttribute("id"));
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);
		
		try {
			List<Carpool_BookedDTO> list = carpool_bookedDAO.read_reserved(map);
			model.addAttribute("list",list);
			
			int total = carpool_bookedDAO.total_reserved(map);
			String paging=new Paging().paging4(total, nowPage, recordPerPage, col,word);
			model.addAttribute("paging", paging);
			
			if(col==""){
				word="";
			}
			model.addAttribute("col", col);
			model.addAttribute("word", word);
			model.addAttribute("nowPage", nowPage);
			return "/reserved";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "error/error";
	}
	
	@RequestMapping("/review")
	public String review(HttpSession session,HttpServletRequest request,Model model){
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
		
		Map map = new HashMap();
		map.put("id", session.getAttribute("id"));
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);
		
		try {
			List<Carpool_ReviewDTO> list = carpool_reviewDAO.list(map);
			model.addAttribute("list",list);
			
			int total = carpool_reviewDAO.total_id((String) session.getAttribute("id"));
			String paging=new Paging().paging4(total, nowPage, recordPerPage, col,word);
			model.addAttribute("paging", paging);
			
			if(col==""){
				word="";
			}
			model.addAttribute("col", col);
			model.addAttribute("word", word);
			model.addAttribute("nowPage", nowPage);
			return "/review";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "error/error";
	}
}
