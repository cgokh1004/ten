package spring.sts.ten;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.model.sulconfirm.SulconfirmDAO;
import spring.model.sulconfirm.SulconfirmDTO;
import spring.model.sulmunr.SulmunrDAO;
import spring.model.sulmunr.SulmunrDTO;
import spring.model.survey.SurveyDAO;
import spring.model.survey.SurveyDTO;
import spring.utility.ten.Paging;
import spring.utility.ten.Utility;

@Controller
public class SurveyController {
   
	@Autowired
	private SurveyDAO surveyDAO;
	@Autowired
	private SulmunrDAO sulmunrDAO;
	@Autowired
	private SulconfirmDAO sulconfirmDAO;	
	
	
	//1.설문리스트
	@RequestMapping(value ="/survey/list")
	
	public String list(Model model, HttpServletRequest request) {
		
		// 검색관련
				String col = Utility.nullCheck(request.getParameter("col"));
				String word = Utility.nullCheck(request.getParameter("word"));

				if (col.equals("total"))
					word = "";

				// paging 관련
				int nowPage = 1; // 현재페이지
				int recordPerPage = 100; // 한페이지당 보여줄 레코드 갯수
				if (request.getParameter("nowPage") != null) {
					nowPage = Integer.parseInt(request.getParameter("nowPage"));
				}

				int sno = ((nowPage - 1) * recordPerPage) + 1;
				int eno = nowPage * recordPerPage;	
		
		
		Map map = new HashMap();	
		map.put("col","");
		map.put("word","");
		map.put("sno",sno);
		map.put("eno",eno);
   
		int total = surveyDAO.total(col, word);
        		
		String paging = new Paging().paging3(total, nowPage, recordPerPage, col, word);
		List<SurveyDTO> list;
		try {
			list = surveyDAO.list(map);
			model.addAttribute("list", list );
			model.addAttribute("col", col);
		    model.addAttribute("word", word);
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("paging", paging);


		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "/survey/list";
	}

	//2. 설문하기(설문리스트 ▶ 설문주제 ▶제목클릭)
	//2-1. 설문하기 체크하기(설문리스트 ▶ 설문주제 ▶제목클릭▶설문항목 체크하기)
	@RequestMapping(value = "/survey/read" ,method=RequestMethod.GET)
	public String read(String sulstate, String sulgroupname,HttpSession session, Model model, int nowPage, String col, String word) {
		//System.out.println(nowPage);
		List list = surveyDAO.readlist(sulgroupname);		
		model.addAttribute("list", list);
		model.addAttribute("sulgroupname", sulgroupname);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("col",col);
		model.addAttribute("word", word);
		model.addAttribute("sulstate", sulstate);
		return "/survey/read";
	}
	@RequestMapping(value = "/survey/read" ,method=RequestMethod.POST)
	public String read(SulconfirmDTO dto, String hapresult, int nowPage, Model model, String col, String word) {
				
				//밑에가 슬러시가 몇갠지 뽑아오는 작업(총 몇번의 크레이트를 결정하기 위하여)
				System.out.println(hapresult);
				int slushhap=0;
				char temphapresult[] = hapresult.toCharArray();
				
				for(int i=0; i<temphapresult.length; i++){
					if(temphapresult[i] == '/'){
						slushhap = slushhap+1;
					}
				}
				
				
				boolean createcheck = true;
				
				// 슬러시 갯수만큼 크리에이트를 하는 포문
				for(int i=0; i<slushhap; i++){
					dto.setId("ktw3722");
					int commaloc =  hapresult.indexOf(",");
					int slushloc = hapresult.indexOf("/",1);
					dto.setSulno(Integer.parseInt(hapresult.substring(2, commaloc)));
					System.out.println("dto에 설넘이 잘 담겼냐?" + dto.getSulno());
					
					if(slushloc != -1){
						dto.setSelno(Integer.parseInt(hapresult.substring(commaloc+1, slushloc)));
						System.out.println("dto에 끝이아닌 셀넘이 잘 담겼냐?" + dto.getSelno());
						hapresult = hapresult.substring(slushloc);
					}else{
						dto.setSelno(Integer.parseInt(hapresult.substring(commaloc+1)));
						System.out.println("dto에 끝인 셀넘이 잘 담겼냐?" + dto.getSelno());
					}
					
					try {
						if(sulconfirmDAO.create(dto)==0){
							createcheck = false;
						}
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}

				}
				
				if(createcheck){
					return "redirect:/survey/list";
				}
				
		return "/survey/read";
	}	

	
	//3. 설문지등록하기(설문지등록 ▶ 질문, 보기, 제목 등 입력 ▶1번 추가(1질문4보기씩)
	@RequestMapping(value = "/survey/create", method=RequestMethod.POST)
	public String create(SurveyDTO dto, HttpServletRequest request, SulmunrDTO rdto, int numscore, String sulgroupname, Model model) {
//		System.out.println(numscore);
//		
//		System.out.println(dto.getSulgroupname());
//		System.out.println(dto.getSulstate());
//		System.out.println(dto.getAskcontent());
//		System.out.println();
		
		model.addAttribute("sulgroupname", sulgroupname);
		
		boolean createcheck = false;
		int recentlykey;
		boolean recentlykeycheck = false;
		boolean childcreatecheck = true;
		
		try {	    
		       
			if(surveyDAO.create(dto)>0){
				createcheck = true;
				System.out.println("부모글쓰기 성공");
			}else{
				return "error/error";	
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(createcheck){
			try {
				recentlykey = surveyDAO.recentlykey(dto);
				System.out.println("앞부모글번호는?" + recentlykey);
				
				if(recentlykey > 0){
					rdto.setSulno(recentlykey);
					recentlykeycheck = true;
					System.out.println("부모글번호뽑아오기 성공");
					System.out.println("뒷부모글번호는?" + recentlykey);
				}
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		//부모테이블에 입력작업이 끝나면
		//부모테이블에 입력된 고유번호를 뽑아와야 합니다.
		
		/*
		 select 고유번호
		from 부모테이블
		where 그룹넘버 = dto.getSulgroupname()
		and 질문내용 = dto.getAskcontent()
		  
		  위의 커리 결과를 int형 변수에 담습니다.
		  int a;
		 */
		
		
		if(recentlykeycheck){
			for(int i=1; i<=numscore; i++){
				System.out.println("자식 크리에이트 작업하냐? "  + i);
				rdto.setChono(i);
				rdto.setChocontent(request.getParameter("chocontent" + i));
				try {
					if(sulmunrDAO.create(rdto)==0){
						childcreatecheck = false;
					}
										
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			if(!childcreatecheck){
				return "error/error";	
				}
		}

			return "redirect:/survey/create";
	}
	@RequestMapping(value="/survey/create", method=RequestMethod.GET)
	public String create(String sulgroupname, Model model){
		model.addAttribute("sulgroupname", sulgroupname);
		return "/survey/create";
	}
	
	//4. 설문,보기 등록한 것 수정하기 update
	//부모테이블 업데이트(질문내용)
	@RequestMapping(value="/survey/surveyupdate", method=RequestMethod.GET)
	public String surveyupdate(SurveyDTO dto, Model model, String sulgroupname){
		System.out.println("서베이번호:" + dto.getSulno());
		System.out.println("서베이내용:" + dto.getAskcontent());
		System.out.println("그룹이름:" + sulgroupname);
		model.addAttribute("sulgroupname", sulgroupname);
		
		try {
			surveyDAO.surveyupdate(dto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:/survey/read?nowPage=1";
	}
	
	
	//자식테이블 업데이트(보기내용)
	@RequestMapping(value="/survey/sulmunrupdate", method=RequestMethod.GET)
	public String sulmunrupdate(SulmunrDTO dto, Model model, String sulgroupname){
		System.out.println("설문알번호:" + dto.getSulmunrno());
		System.out.println("설문알내용:" + dto.getChocontent());
		System.out.println("그룹이름:" + sulgroupname);
		model.addAttribute("sulgroupname", sulgroupname);
		try {
			sulmunrDAO.sulmunrupdate(dto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:/survey/read?nowPage=1";
	}
	
	
	//아래서부터는 안씀.
	@RequestMapping(value="/survey/update", method=RequestMethod.POST)
	public String update(SurveyDTO dto){	
		
		try {
			if(surveyDAO.update(dto)>0){
			}else{
				return "error/error";
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:/survey/list";
	}
	
	@RequestMapping(value="/survey/update", method=RequestMethod.GET)
	public String update(Model model, int sulno){
		SurveyDTO dto;
		try {
			dto = (SurveyDTO) surveyDAO.read(sulno);
			model.addAttribute("dto", dto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return "/survey/update";
	}
	//여기까지 안씀.
	
	
	
	//설문 진행상태 바꾸기 설문 계속하기로
	@RequestMapping(value="/survey/sulstateyes", method=RequestMethod.GET)
	public String sulstateyes(Model model, String sulgroupname){
		
		System.out.println("그룹이름:" + sulgroupname);
		model.addAttribute("sulgroupname", sulgroupname);
		model.addAttribute("sulstate","진행");
		try {
			surveyDAO.sulstateyes(sulgroupname);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return "redirect:/survey/read?nowPage=1";
	}
	
	//설문 진행상태 바꾸기 설문 완료로
	@RequestMapping(value="/survey/sulstateno", method=RequestMethod.GET)
	public String sulstateno(Model model, String sulgroupname){
		
		System.out.println("그룹이름:" + sulgroupname);
		model.addAttribute("sulgroupname", sulgroupname);
		model.addAttribute("sulstate","완료");
		try {
			surveyDAO.sulstateno(sulgroupname);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return "redirect:/survey/read?nowPage=1";
	}

  //5. delete
	@RequestMapping(value = "/survey/delete", method = RequestMethod.POST)
	public String delete(String sulgroupname, Model model, String col, String word, int nowPage) {
		System.out.println(sulgroupname);
		
		return "redirect:/survey/list";
	}

	@RequestMapping(value = "/survey/delete", method = RequestMethod.GET)
	public String delete(String sulgroupname) {
		System.out.println(sulgroupname);
		
		try {
			//설문확인테이블에 있는거 다 지우고~
			sulconfirmDAO.delete(sulgroupname);
			
			//설문알테이블에 있는거 다 지우고~
			sulmunrDAO.delete(sulgroupname);
			
			//서베이테이블에 있는거 다 지우고~
			if(surveyDAO.delete(sulgroupname)>0){
				return "redirect:/survey/list";
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return "/survey/delete";
	}
	
	// 6. 결과보기
	@RequestMapping(value = "/survey/result", method = RequestMethod.GET)
	public String result(SulconfirmDTO dto, String sulgroupname, Model model, HttpServletRequest request,
			                             HttpServletResponse response)  {
		
		System.out.println(sulgroupname);
		
		List list = surveyDAO.resultreadlist(sulgroupname);		
		model.addAttribute("list", list);
		model.addAttribute("sulgroupname", sulgroupname);		
		
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out;			
					
		try {
			out = response.getWriter();
			
			JSONObject joby = new JSONObject();
			JSONArray jarray = new JSONArray();
			JSONArray jchart = new JSONArray();
			
			
			//포문돌며 제이손만들기			
			for(int i = 0; i<list.size(); i++){			
				//상위포문
				for(int j=0; j<((SurveyDTO)list.get(i)).getSulmunrdtoList().size(); j++){
				//하위포문
					jchart = new JSONArray();
					jchart.add(((SulmunrDTO)((SurveyDTO)list.get(i)).getSulmunrdtoList().get(j)).getChono());
					jchart.add(((SulmunrDTO)((SurveyDTO)list.get(i)).getSulmunrdtoList().get(j)).getChocontent());
					jchart.add(((SulmunrDTO)((SurveyDTO)list.get(i)).getSulmunrdtoList().get(j)).getThenumber());
					jchart.add(((SulmunrDTO)((SurveyDTO)list.get(i)).getSulmunrdtoList().get(j)).getTheratio());
					jarray.add(jchart);
				}
				
				joby.put(((SurveyDTO)list.get(i)).getAskcontent(), jarray);
				jarray = new JSONArray();
			}
			
	       out.println(joby);
	       
	       model.addAttribute("joby", joby);
			
			
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return "/survey/result";
	
	}
	
//	@RequestMapping("/survey/result")
//	public String result() {
//		
//		return "/survey/result";
//	}

}

	
	


