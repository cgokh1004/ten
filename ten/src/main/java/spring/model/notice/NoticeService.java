package spring.model.notice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.model.ncomment.*;

@Service 
public class NoticeService {
	 @Autowired
	 private NoticeDAO dao;
	 
	 @Autowired
	 private NcommentDAO ndao;
	 
	 public void delete(int noticeno) throws Exception{
		 ndao.delete(noticeno);
		 dao.delete(noticeno);
	 }
}
