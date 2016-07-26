package spring.model.schedule;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dhtmlx.planner.DHXEv;

@Service
public class SchedulerService {
	
	@Autowired
	private SchedulerDAO eventManagerDao;

	public Iterable<DHXEv> getEvent() throws Exception {
		return eventManagerDao.list();
	}

	public void updateEvent(SchedulerVO schedule) throws Exception {
		eventManagerDao.update(schedule);
	}

	public void insertEvent(SchedulerVO schedule) throws Exception {
		eventManagerDao.create(schedule);
	}

	public void deleteEvent(Integer id) throws Exception {
		eventManagerDao.delete(id);
	}
}