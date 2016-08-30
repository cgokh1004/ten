package spring.sts.ten;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import spring.model.member.MemberDAO;
import spring.model.member.MemberDTO;
import spring.utility.ten.Utility;

@Controller
public class MemberController {
	@Autowired
	MemberDAO memberDAO;
	
	@RequestMapping(value="/member/login",method=RequestMethod.POST)
	public String login(String id,String passwd,HttpServletRequest request,String c_id,
			int carpoolno,
			int nowPage, 
			int nPage,
			String col, 
			String word,
			String flag,
			HttpSession session,HttpServletResponse response,Model model){
	
		int cnt = 0;
		String mem_type = "U"; //회원 등급
		String name = "";
		String mfile = "사진.jsp";
		String gender = "";
		cnt = memberDAO.loginCheck(id, passwd);
		
		if(cnt==1){
			
			mem_type = memberDAO.getMem_type(id);
			name = memberDAO.getName(id);
			mfile = memberDAO.getMfile(id);
			gender = memberDAO.getGender(id);
			session.setAttribute("id", id);
			session.setAttribute("mem_type", mem_type);
			session.setAttribute("name", name);
			session.setAttribute("mfile", mfile);
			session.setAttribute("gender", gender);
		    // ---------------------------------------------- 
		    // Cookie 저장, Checkbox는 선택하지 않으면 null 임 
		    // ---------------------------------------------- 
		    Cookie cookie = null; 
		       
		    if (c_id != null){  // 처음에는 값이 없음으로 null 체크로 처리
		      cookie = new Cookie("c_id", "Y");    // 아이디 저장 여부 쿠키 
		      cookie.setMaxAge(120);               // 2 분 유지 
		      response.addCookie(cookie);          // 쿠키 기록 
		   
		      cookie = new Cookie("c_id_val", id); // 아이디 값 저장 쿠키  
		      cookie.setMaxAge(120);               // 2 분 유지 
		      response.addCookie(cookie);          // 쿠키 기록  
		         
		    }else{ 
		      cookie = new Cookie("c_id", "");     // 쿠키 삭제 
		      cookie.setMaxAge(0); 
		      response.addCookie(cookie); 
		         
		      cookie = new Cookie("c_id_val", ""); // 쿠키 삭제 
		      cookie.setMaxAge(0); 
		      response.addCookie(cookie); 
		    } 
		    // --------------------------------------------- 
		 
		}
		
		model.addAttribute("cnt", cnt);
		String url = "./error/passwdError";
		if(cnt==1){
			url = "redirect:/";
			if(!flag.equals("")){
				model.addAttribute("carpoolno", carpoolno);
				model.addAttribute("nowPage", nowPage);
				model.addAttribute("nPage", nPage);
				model.addAttribute("col", col);
				model.addAttribute("word", word);
				url = "redirect:"+flag;
			}
		}
		 
		return url;
	}
	@RequestMapping(value="/member/login",method=RequestMethod.GET)
	public String login(HttpServletRequest request,Model model,
			@RequestParam(value="carpoolno",defaultValue="0")int carpoolno,
			@RequestParam(value="nowPage",defaultValue="0")int nowPage, 
			@RequestParam(value="nPage",defaultValue="0")int nPage
			){
		String c_id = "";     // ID 저장 여부를 저장하는 변수, Y
		String c_id_val = ""; // ID 값
		
		Cookie[] cookies = request.getCookies(); 
		Cookie cookie=null; 
		
		if (cookies != null){ 
			for (int i = 0; i < cookies.length; i++) { 
				cookie = cookies[i]; 
				
				if (cookie.getName().equals("c_id")){ 
					c_id = cookie.getValue();     // Y 
				}else if(cookie.getName().equals("c_id_val")){ 
					c_id_val = cookie.getValue(); // user1... 
				} 
			} 
		}
		model.addAttribute("c_id", c_id);
		model.addAttribute("c_id_val", c_id_val);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("nPage", nPage);
		request.setAttribute("carpoolno", carpoolno);
		return "/member/login";
	}
	
	@RequestMapping("/member/logout")
	public String logout(HttpSession session){
		session.invalidate();//모든 세션변수 제거
		return "redirect:/";
	}
	
	@RequestMapping("/member/agree")
	public String agree(){
		return "/member/agree";
	}
	@RequestMapping(value="/member/createForm",method=RequestMethod.POST)
	public String createForm(){
		
		return "/member/create";
	}
	@RequestMapping(value="/member/create",method=RequestMethod.POST)
	public String create(MemberDTO dto,HttpServletRequest request){
		boolean flag=false;
		if(memberDAO.duplicateID(dto.getId())>0||memberDAO.duplicateEmail(dto.getMail())>0){
			flag=true;
		}
		int filesize1=(int)dto.getMfileMF().getSize();
		int filesize2=(int)dto.getPassportMF().getSize();
		String mfile="사진.jpg";
		String passport="passport.jpg";
		String basePath=request.getRealPath("/storage");
		if(filesize1>0&&!flag){
			mfile=Utility.saveFile(dto.getMfileMF(), basePath);
		}
		if(filesize2>0&&!flag){
			passport=Utility.saveFile(dto.getPassportMF(), basePath);
		}
		dto.setMfile(mfile);
		dto.setPassport(passport);
		    if(!flag){	    	
		    	try {
					if(memberDAO.create1(dto)>0){
						return "redirect:/carpool/list";
					};
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		    }
		return "error/error";
	}
	
	@RequestMapping("/member/id_form")
	public String id_form(String id,Model model){

		return "member/id_form";
	}
	
	@RequestMapping("/member/id_proc")
	public String id_proc(String id,Model model){
		
		int cnt=memberDAO.duplicateID(id);
		model.addAttribute("cnt",cnt);
		return "member/id_proc";
	}
	
	@RequestMapping("/member/email_form")
	public String email_form(){
		
		return "member/email_form";
	}
	
	@RequestMapping("/member/email_proc")
	public String email_proc(String mail,Model model){
		int cnt=memberDAO.duplicateEmail(mail);
		model.addAttribute("cnt", cnt);
		return "member/email_proc";
	}
}
