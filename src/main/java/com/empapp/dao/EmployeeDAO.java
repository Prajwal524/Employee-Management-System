package com.empapp.dao;
import com.empapp.dto.Employee;
import java.util.List;

public interface EmployeeDAO {
	void addEmployee(Employee e);
	
	Employee findById(Integer id);
	
	List<Employee> findAll();
	
	Employee findByMailandPassword(String mail,String password);
	void updateEmployee(Employee e);
}
