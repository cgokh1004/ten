package spring.sts.ten;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class YyjController {
	
	@RequestMapping("/food/list")
	public String list(HttpServletRequest request, Model model) {
		return "/food/list";
	}

}
