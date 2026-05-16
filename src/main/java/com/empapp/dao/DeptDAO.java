package com.empapp.dao;

import com.empapp.dto.Dept;
import java.util.List;

public interface DeptDAO {
	void addDept(Dept t);
	Dept findById(Integer id);
	List<Dept> findAll();
	
	void updateDept(Dept d);
	void deleteDept(Integer dno);
}
