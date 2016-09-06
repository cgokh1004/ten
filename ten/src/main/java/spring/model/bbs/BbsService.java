package spring.model.bbs;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
 
@Service 
public class BbsService {
       @Autowired
       // private BbsDAO dao;
          private BbsDAO dao;
       @Autowired
        private ReplyDAO rdao;
 
      public void delete(int bbsno) throws Exception{
 
             rdao.bdelete(bbsno);
             dao.delete(bbsno);
      }
}