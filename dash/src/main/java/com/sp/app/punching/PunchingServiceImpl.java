package com.sp.app.punching;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.app.common.dao.CommonDAO;
import com.sp.app.employee.Employee;

@Service("punching.punchingService")
public class PunchingServiceImpl implements PunchingService {
	private static Logger logger = org.slf4j.LoggerFactory.getLogger(Punching.class);
	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<Employee> empList(Map<String, Object> map) {
		
		List<Employee> empList = null;
		
		try {
			empList = dao.selectList("approval.empList", map);
		} catch (Exception e) {
			logger.warn("{} - id: {}", e.getMessage());
		}
		return empList;
	}

	@Override
	public void punchOn(Punching pun) throws Exception{
		try {
			dao.insertData("punching.clockOn");
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void punchOff(Punching pun) throws Exception {
		try {
			dao.insertData("punching.clockOff");
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		
	}

	@Override
	public Punching todayPunch(Map<String,Object>map) {
		Punching punching =new Punching();
		try {
			Punching pun = dao.selectOne("punching.clockOffTime", map);
			
			punching.setPunchOffTime(pun.getPunchOffTime());
			
			pun = dao.selectOne("punching.clockOnTime", map);
			punching.setPunchOnTime(pun.getPunchOnTime());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return punching;
	}
	
}
