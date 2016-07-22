package spring.model.schedule;

import com.dhtmlx.planner.DHXEv;

public interface ShedulerDao2 {

	Iterable<DHXEv> getEvent();

	void updateEvent(SchedulerVO schedule);

	void insertEvent(SchedulerVO schedule);

	void deleteEvent(Integer id);
}