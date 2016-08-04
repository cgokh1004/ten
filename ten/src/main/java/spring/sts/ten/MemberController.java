package spring.sts.ten;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.model.member.*;

@Controller
public class MemberController {
	@Autowired
	private MemberDAO dao;
	
	@RequestMapping(value = "/member/login", method = RequestMethod.GET)
	public String create() {
		return "/member/login";
	}
}
