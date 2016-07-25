package spring.model.schedule;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dhtmlx.planner.DHXEv;
import com.dhtmlx.planner.DHXEvent;
import com.dhtmlx.planner.DHXEventsManager;

@Repository
public class SchedulerImple implements ShedulerDao2 {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	@Override
	public Iterable<DHXEv> getEvent() {
		
      	DHXEventsManager.date_format = "yyyy-MM-dd HH:mm:ss";
      	List evs = new ArrayList();
      		
		    List<SchedulerVO> resultset = sqlSessionTemplate.selectList("scheduler.getEvent");
		    
		    for(int i = 0; i < resultset.size(); i++){
		      	DHXEvent e = new DHXEvent();
		      	e.setId(resultset.get(i).getEvent_id());
		          e.setText(resultset.get(i).getEvent_name());
		          e.setStart_date(resultset.get(i).getStart_date());
		          e.setEnd_date(resultset.get(i).getEnd_date());
		      	evs.add(e);
		    }
      	DHXEventsManager.date_format = "MM/dd/yyyy HH:mm";
		return evs;
	}

	@Override
	public void updateEvent(SchedulerVO schedule) {
		sqlSessionTemplate.update("scheduler.updateEvent", schedule);
	}

	@Override
	public void insertEvent(SchedulerVO schedule) {
		sqlSessionTemplate.insert("scheduler.insertEvent", schedule);
	}

	@Override
	public void deleteEvent(Integer id) {
		sqlSessionTemplate.delete("scheduler.deleteEvent", id);
	}
}