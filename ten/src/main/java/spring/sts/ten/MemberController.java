package spring.sts.ten;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.model.member.MemberDAO;
import spring.model.member.MemberDTO;
import spring.utility.ten.Utility;

@Controller
public class MemberController {
	@Autowired
	MemberDAO memberDAO;
	
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
		String mfile="photo.jpg";
		String passport="photo.jpg";
		String basePath=request.getRealPath("/storage");
		if(filesize1>0&&!flag){
			mfile=Utility.saveFile(dto.getMfileMF(), basePath);
		}
		if(filesize2>0&&!flag){
			passport=Utility.saveFile(dto.getPassportMF(), basePath);
		}
		dto.setMfile(mfile);
		dto.setPassport(passport);
		System.out.println(dto.getAddr_certi());
		System.out.println(dto.getAddress1());
		System.out.println(dto.getAddress2());
		System.out.println(dto.getCerti_num());
		System.out.println(dto.getGender());
		System.out.println(dto.getId());
		System.out.println(dto.getLicense_type());
		System.out.println(dto.getMail());
		System.out.println(dto.getMail_certi());
		System.out.println(dto.getMem_type());
		System.out.println(dto.getMfile());
		System.out.println(dto.getName());
		System.out.println(dto.getPassport());
		System.out.println(dto.getPassport_certi());
		System.out.println(dto.getPasswd());
		System.out.println(dto.getPhone_certi());
		System.out.println(dto.getPhone_num());
		System.out.println(dto.getSns());
		System.out.println(dto.getSns_certi());
		System.out.println(dto.getZipcode());
		System.out.println(dto.getMfileMF());
		System.out.println(dto.getPassportMF());
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
