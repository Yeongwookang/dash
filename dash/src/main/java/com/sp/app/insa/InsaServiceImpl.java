package com.sp.app.insa;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.app.common.FileManager;
import com.sp.app.common.dao.CommonDAO;
import com.sp.app.employee.Employee;

@Service("insa.insaService")
public class InsaServiceImpl implements InsaService {
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;

	@Override
	public void insertInsa(Employee dto, String pathname) throws Exception {
		try {
			
			String filename = fileManager.doFileUpload(dto.getThumbnailFile(), pathname);
			dto.setThumbnail(filename);
			
			if (dto.getEmail1().length() != 0 && dto.getEmail2().length() != 0) {
				dto.setEmail(dto.getEmail1() + "@" + dto.getEmail2());
			}

			if (dto.getTel1().length() != 0 && dto.getTel2().length() != 0 && dto.getTel3().length() != 0) {
				dto.setTel(dto.getTel1() + "-" + dto.getTel2() + "-" + dto.getTel3());
			}

			long insaSeq = dao.selectOne("insa.insaSeq");
			
			// 사원정보 저장
			dao.insertData("insa.insertInsa", insaSeq);

			dao.insertData("insa.insertInsa", dto);

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateInsa(Employee dto, String pathname) throws Exception {

	}

	@Override
	public void deleteInsa(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;

		try {
			result = dao.selectOne("insa.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public List<Employee> listEmployee(Map<String, Object> map) {
		List<Employee> list = null;
		
		try {
			list = dao.selectList("insa.listEmployee", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public Employee readEmployee(long empNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Employee preReadEmployeet(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Employee nextReadEmployee(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Employee> listProductFile(long empNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Employee> listCategory() {
		List<Employee> list = null;
		
		try {
			list = dao.selectList(" insa.listCategory");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
