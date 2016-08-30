package spring.sts.ten;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import spring.model.member.MemberDAO;
import spring.model.member.MemberDTO;
import spring.utility.ten.Utility;

@Controller
public class MypageController {
	@Autowired
	MemberDAO memberDAO;
	
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
	public String mypage_update(Model model,MemberDTO dto,HttpServletRequest request,HttpSession session,
			MultipartFile mfileMF,MultipartFile passportMF,String old_mfile,String old_passport){
		 try {
			 String basePath=request.getRealPath("/storage");
				int msize = (int)mfileMF.getSize();
				int psize = (int)passportMF.getSize();
				System.out.println(msize+","+psize);
				String mfile="사진.jpg";
				String passport="passport.jpg";
				if(msize>0){
					System.out.println("m0아님");
					if(old_mfile!=null&&!old_mfile.equals("사진.jpg")){
						Utility.deleteFile(basePath, old_mfile);
						System.out.println("m지움");
					}
					mfile=Utility.saveFile(mfileMF, basePath);
					System.out.println("m저장");
				}else{
					System.out.println("m0임");
					if(!old_mfile.equals("사진.jpg")){
						mfile=old_mfile;
					}
				}
				dto.setMfile(mfile);
				System.out.println(dto.getMfile());
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
				System.out.println(dto.getPassport());
				System.out.println(dto.getMfile());
				if(memberDAO.loginCheck(dto.getId(), dto.getPasswd())>0){
					model.addAttribute("memberDTO", dto);
					return "redirect:/mypage";
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 return "/error/error";
	}
	
}
