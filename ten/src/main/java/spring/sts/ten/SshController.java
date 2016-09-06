package spring.sts.ten;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.model.ktx.KtxDAO;
import spring.model.ktx.KtxDTO;
import spring.model.ktx_booked.Ktx_BookedDAO;
import spring.model.ktx_booked.Ktx_BookedDTO;



@Controller
public class SshController {
	
	@Autowired
	private KtxDAO dao;
	@Autowired
	private Ktx_BookedDAO bdao;

	@RequestMapping(value = "/ktx/list")
	public String list(HttpServletRequest request, Model model) {		
		
		List<KtxDTO> list;
		Map map = new HashMap();
		map.put("sno", 1);
		map.put("eno", 10);
		try {
			list = dao.list(map);
			model.addAttribute("list", list);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "/ktx/list";
	}
	
	@RequestMapping(value = "ktx/create", method = RequestMethod.POST)
	public String create(KtxDTO dto, HttpServletRequest request,HttpSession session){

		String s_date = request.getParameter("start_date").substring(0, 4);
		s_date = s_date + request.getParameter("start_date").substring(6, 8);
		s_date = s_date + request.getParameter("start_date").substring(10, 12);
		s_date = s_date + request.getParameter("start_hour");

		dto.setS_date(s_date);
		dto.setId((String)session.getAttribute("id"));
        try {
			if(dao.create(dto)>0){	
				System.out.println("되나?");
				return "redirect:/ktx/list";
			}else{
				return "error/error";
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	@RequestMapping(value = "ktx/create", method = RequestMethod.GET)
	public String create() {

		return "/ktx/create";
	}
	
	@RequestMapping(value = "/ktx/read")
	public String read(KtxDTO dto,int ktx_no, Model model) {
		try {
			Object pk=(Object)ktx_no;
			dto = (KtxDTO) dao.read(pk);			
			model.addAttribute("dto", dto);
			int yseat=dto.getSeat()-dto.getApply_seat();
			model.addAttribute("yseat", yseat);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "/ktx/read";
	}

	@RequestMapping(value = "ktx/update", method = RequestMethod.GET)
	public String update(int ktx_no, Model model,KtxDTO dto) {
		try {
			model.addAttribute("dto", dao.read(ktx_no));
			model.addAttribute("dto", dao.read(dto));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "/ktx/update";
	}
	
	@RequestMapping(value = "ktx/update", method = RequestMethod.POST)
	public String update(KtxDTO dto, Model model, HttpServletRequest request) {
		
		String s_date = request.getParameter("start_date").substring(0, 4);
		s_date = s_date + request.getParameter("start_date").substring(6, 8);
		s_date = s_date + request.getParameter("start_date").substring(10, 12);
		s_date = s_date + request.getParameter("start_hour");
		
		dto.setS_date(s_date);
		
		try {
			if (dao.update(dto) > 0) {
				return "redirect:/ktx/list";
			} else {
				return "error/error";
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	@RequestMapping(value = "ktx/delete", method = RequestMethod.GET)
	public String delete(int ktx_no, Model model) {

			try{ 
				if(dao.delete(ktx_no)>0){
	             return "redirect:/ktx/list";
				}else{
					return "error/error";
				}
	        }catch(Exception e){
	             e.printStackTrace();
	       }
			
		return null;
	}
	@RequestMapping(value = "/booked/create")
	public @ResponseBody int booked_create(Ktx_BookedDTO dto) {		
					try {
						Object pk=(Object)dto.getKtx_no();
						KtxDTO kdto=(KtxDTO) dao.read(pk);
						Map map = new HashMap();
						map.put("ktx_no", dto.getKtx_no());
						map.put("apply_seat",kdto.getApply_seat()+dto.getAppli_seat());
						if(dao.now_seat(map)>0){
							kdto=(KtxDTO) dao.read(pk);
							if(bdao.create(dto)>0){
								int result=kdto.getSeat()-kdto.getApply_seat();
								return result;
							}
						}
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
		return -1;
	}
	
	@RequestMapping(value = "/booked/list")
	public String list(Model model) {		
		
		List<Ktx_BookedDTO> list;
		Map map = new HashMap();
		map.put("sno", 1);
		map.put("eno", 10);
		try {
			list = dao.list(map);
			model.addAttribute("list", list);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "/booked/list";
	}
	
}