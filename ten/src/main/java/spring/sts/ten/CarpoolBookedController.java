package spring.sts.ten;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.model.carpool.CarpoolDAO;
import spring.model.carpool.CarpoolDTO;
import spring.model.carpool_booked.Carpool_BookedDAO;
import spring.model.carpool_booked.Carpool_BookedDTO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class CarpoolBookedController {
	
	@Autowired
	private Carpool_BookedDAO carpool_bookedDAO;
	@Autowired
	private CarpoolDAO carpoolDAO;
	
	@RequestMapping(value="/carpool_booked/create", method=RequestMethod.POST)
	public @ResponseBody int create(Carpool_BookedDTO dto,Model model,HttpSession session){
		try {
			System.out.println(dto.getAppli_seat()+"신청수");
			Object pk=(Object)dto.getCarpoolno();
			CarpoolDTO cdto=(CarpoolDTO) carpoolDAO.read(pk);
			System.out.println(cdto.getNow_seat()+"누적수");
			Map map = new HashMap();
			map.put("carpoolno", dto.getCarpoolno());
			map.put("now_seat",cdto.getNow_seat()+dto.getAppli_seat());
			if(carpoolDAO.now_seat(map)>0){
				cdto=(CarpoolDTO) carpoolDAO.read(pk);
			System.out.println(cdto.getNow_seat()+"누적결과");
				if(carpool_bookedDAO.create(dto)>0){
					int result=cdto.getSeat()-cdto.getNow_seat();
			System.out.println(result+"남은좌석");
					return result;
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return -1;
	}
}