package img;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ImgTest {

	public static void main(String[] args) {
		ImgDAO dao = new ImgDAO();
		//create(dao);
		//list(dao);
		  update(dao);
	}

	private static void update(ImgDAO dao) {
		// TODO Auto-generated method stub
		int imgno=2;
		String wname="왕눈이2";
		String content="내용";
		String title="제목";
		ImgDTO dto = new ImgDTO();
		dto.setWname(wname);
		dto.setContent(content);
		dto.setTitle(title);
		dto.setImgno(imgno);
		dao.update(dto);
	}

	private static void list(ImgDAO dao) {
		Map map = new HashMap();
		map.put("sno", 1);
		map.put("eno", 5);
		
		List<ImgDTO>list = dao.list(map);
		for(int i= 0; i<list.size(); i++){
			  ImgDTO dto = list.get(i);
			  p(dto);
			  p("----------------");
		}
		
	}

	private static void p(ImgDTO dto) {
		p("번호:" +dto.getImgno());
		p("이름:" +dto.getWname());
		p("제목:" +dto.getTitle());
		
		p("grpno:" +dto.getGrpno());
		p("indent:" +dto.getIndent());
		p("ansnum:" +dto.getAnsnum());
		
		
	}

	private static void create(ImgDAO dao) {
		ImgDTO dto = new ImgDTO();
		dto.setWname("막국수");
		dto.setTitle("글쓰기 연습");
		dto.setContent("글쓰기 내용입니다");
		dto.setPasswd("1234");
	
		int cnt = dao.create(dto );
		
		if(cnt>0){
			p("wow !!! congratuation!! finally, you succeed at once");
		}else{
			p("once again, you must a coding straight back!!");
     	}
		
	}

	private static void p(String string) {
		System.out.println(string);
		
	}

}
