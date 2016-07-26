package spring.sts.carpool;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.model.carpool.CarpoolDAO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class CarpoolController {
	
	@Autowired
	CarpoolDAO capoolDAO;
	
	@RequestMapping("/carpool/list")
	public String list(Model model){
		return "/carpool/list";
	}
	
}
