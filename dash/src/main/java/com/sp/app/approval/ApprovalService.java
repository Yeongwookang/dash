package com.sp.app.approval;

import java.util.List;
import java.util.Map;

import com.sp.app.employee.Employee;

public interface ApprovalService {
	public void insertApproval(Approval dto) throws Exception;
	public void updateApproval(Approval dto) throws Exception;
	public void deleteApproval(long signNum) throws Exception;
	
	public List<Employee> empList(Map<String, Object> map);
	
	public Approval readApproval(long signNum);
	public int dataCount(Map<String, Object> map);
	public List<Approval> approvalList(Map<String, Object> map);
	public List<Approval> myApprovalList(Map<String, Object> map);
	
	
	
	
	
}