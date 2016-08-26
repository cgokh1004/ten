package spring.sts.ten;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.model.member.MemberDAO;

@Controller
public class Mypage {
	@Autowired
	MemberDAO memberDAO;
	
	@RequestMapping("/mypage")
	public String mypage(){
		
		return "/mypage";
	}
	
}
