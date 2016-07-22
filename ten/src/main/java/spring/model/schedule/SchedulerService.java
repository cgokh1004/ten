package spring.model.schedule;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dhtmlx.planner.DHXEv;

@Service
public class SchedulerService {
	
	@Autowired
	private ShedulerDao eventManagerDao;

	public Iterable<DHXEv> getEvent() {
		return eventManagerDao.getEvent();
	}

	public void updateEvent(SchedulerVO schedule) {
		eventManagerDao.updateEvent(schedule);
	}

	public void insertEvent(SchedulerVO schedule) {
		eventManagerDao.insertEvent(schedule);
	}

	public void deleteEvent(Integer id) {
		eventManagerDao.deleteEvent(id);
	}
}