package com.sp.app.analysis;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.app.common.dao.CommonDAO;
import com.sp.app.stationmanage.Stationmanage;

@Service("analysis.analysisService")
public class AnalysisServiceImpl implements AnalysisService { 
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
	private CommonDAO dao;

	@Override
	public String totalSales() {
		String result = "";
		
		try {
			result = dao.selectOne("analysis.totalSales");
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
		}
		
		return result;
	}

	@Override
	public int newCustomerCount() {
		int result = 0;
		
		try {
			result = dao.selectOne("analysis.newCustomerCount");
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
		}
		
		return result;
	}

	@Override
	public int repairCount() {
		int result = 0;
		
		try {
			result = dao.selectOne("analysis.repairCount");
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
		}
		
		return result;
	}

	@Override
	public int rentalCount() {
		int result = 0;
		
		try {
			result = dao.selectOne("analysis.rentalCount");
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
		}
		
		return result;
	}

	@Override
	public int damageCount() {
		int result = 0;
		
		try {
			result = dao.selectOne("analysis.damageCount");
		} catch (Exception e) {
			logger.debug("{} ", e.getMessage());
		}
		
		return result;
	}

	@Override
	public List<Analysis> usageRankList() {
		List<Analysis> list = null;
		
		try {
			list = dao.selectList("analysis.usageRankList");
		} catch (Exception e) {
			logger.debug("{} ", e.getMessage());
		}
		
		return list;
	}

	@Override
	public List<Analysis> salesRankList() {
		List<Analysis> list = null;
		
		try {
			list = dao.selectList("analysis.salesRankList");
		} catch (Exception e) {
			logger.debug("{} ", e.getMessage());
		}
		
		return list;
	}

	@Override
	public Analysis lastDayUsageCount() {
		Analysis dto = null;
		
		try {
			dto = dao.selectOne("analysis.lastDayUsageCount");
		} catch (Exception e) {
			logger.debug("{} - 값 : {}", e.getMessage(), dto.getUsageCount());
		}
		
		return dto;
	}
	
	@Override
	public List<Map<String, Object>> yearTotalMoney(String year) {
		List<Map<String, Object>> list = null;
		
		try {
			list = dao.selectList("analysis.yearTotalMoney", year);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
		}
		
		return list;
	}

	@Override
	public List<Map<String, Object>> monthTotalMoney(String month) {
		List<Map<String, Object>> list = null;
		
		try {
			list = dao.selectList("analysis.monthTotalMoney", month);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
		}
		
		return list;
	}

	@Override
	public List<Map<String, Object>> dayTotalMoney() {
		List<Map<String, Object>> list = null;
		
		try {
			list = dao.selectList("analysis.dayTotalMoney");
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
		}
		
		return list;
	}

	@Override
	public String lastDay() {
		String lastDay = "";
		
		try {
			lastDay = dao.selectOne("analysis.lastDay");
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
		}
		return lastDay;
	}

	@Override
	public List<UserData> userAge() {
		List<UserData> list = null;
		
		try {
			list = dao.selectList("analysis.userAge");
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
		}
		return list;
	}
	
	@Override
	public List<UserData> userGender() {
		List<UserData> list = null;
		
		try {
			list = dao.selectList("analysis.userGender");
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
		}
		return list;
	}

	@Override
	public UserData userUseTime() {
		UserData dto = null;
		
		try {
			dto = dao.selectOne("analysis.userUseTime");
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
		}
		return dto;
	}

	@Override
	public List<Stationmanage> station() {
		List<Stationmanage> list = null;
		
		try {
			list = dao.selectList("analysis.station");
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
		}
		return list;
	}

	@Override
	public List<StationData> stationAge(int stNum) {
		List<StationData> list = null;
		
		try {
			list = dao.selectList("analysis.stationAge", stNum);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
		}
		return list;
	}

	@Override
	public List<StationData> stationGender(int stNum) {
		List<StationData> list = null;
		
		try {
			list = dao.selectList("analysis.stationGender", stNum);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
		}
		return list;
	}

	@Override
	public StationData stationUseTime(int stNum) {
		StationData dto = null;
		
		try {
			dto = dao.selectOne("analysis.stationUseTime", stNum);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
		}
		return dto;
	}

	@Override
	public List<Map<String, Object>> stationYearTotalMoney(int stNum) {
		List<Map<String, Object>> list = null;
		
		try {
			list = dao.selectList("analysis.stationYearTotalMoney", stNum);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
		}
		return list;
	}

	@Override
	public List<Map<String, Object>> stationMonthTotalMoney(int stNum) {
		List<Map<String, Object>> list = null;
		
		try {
			list = dao.selectList("analysis.stationMonthTotalMoney", stNum);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
		}
		return list;
	}

	@Override
	public List<Map<String, Object>> stationDayTotalMoney(int stNum) {
		List<Map<String, Object>> list = null;
		
		try {
			list = dao.selectList("analysis.stationDayTotalMoney", stNum);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
		}
		return list; 
	}

	@Override
	public List<Analysis> rankTopCount() {
		List<Analysis> list = null;
		
		try {
			list = dao.selectList("analysis.rankTopCount");
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
		}
		return list;
	}  
	
	@Override
	public List<Analysis> rankTopPrice() {
		List<Analysis> list = null;
		
		try {
			list = dao.selectList("analysis.rankTopPrice");
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
		}
		return list;
	}  
	
	@Override
	public List<Analysis> rankTopDistance() {
		List<Analysis> list = null;
		
		try {
			list = dao.selectList("analysis.rankTopDistance");
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
		}
		return list;
	}

	@Override
	public List<Analysis> rankTopUseTime() {
		List<Analysis> list = null;
		
		try {
			list = dao.selectList("analysis.rankTopUseTime");
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
		}
		return list;
	}
	
	@Override
	public List<UserData> userAgeTime() {
		List<UserData> list = null;
		
		try {
			list = dao.selectList("analysis.userAgeTime");
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
		}
		return list;
	}

}
