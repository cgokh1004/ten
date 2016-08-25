package spring.sts.carpool;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.model.carpool_review.Carpool_ReviewDAO;
import spring.model.carpool_review.Carpool_ReviewDTO;
import spring.model.member.MemberDAO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class CarpoolReviewController {
	
	@Autowired
	private Carpool_ReviewDAO carpool_reviewDAO;
	
	@RequestMapping(value="/carpool_review/create", method=RequestMethod.GET)
	public String createReview(int carpoolno, int score,Model model){
		Carpool_ReviewDTO dto = new Carpool_ReviewDTO();
		dto.setCarpoolno(carpoolno);
		dto.setScore(score);
		model.addAttribute("carpool_reviewDTO", dto);
		return "ksb/CarpoolReview";
	}
	@RequestMapping(value="/carpool_review/create", method=RequestMethod.POST)
	public String createReview(Carpool_ReviewDTO dto,Model model,HttpSession session){
		try {
			dto.setId((String)session.getAttribute("id"));
			int cnt=carpool_reviewDAO.create(dto);
			if(cnt==1){
				model.addAttribute("cnt", 1);
				return "ksb/CarpoolReview";
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "error/error";
	}
}
