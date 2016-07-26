package spring.sts.ten;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.model.survey.SurveyDAO;
import spring.model.survey.SurveyDTO;



@Controller
public class SurveyController {
	@Autowired
	public SurveyDAO dao;

//	@RequestMapping(value = "/survey/create", method = RequestMethod.POST)
//	public String create(SurveyDTO dto) {
//		if (dao.create(dto) > 0) {
//			return "redirect:/survey/list";
//		} else {
//			return "error/error";
//		}
//
//	}
		
     	}


