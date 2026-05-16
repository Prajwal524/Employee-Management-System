package com.empapp.dao.impl;

import java.util.ArrayList;
import java.util.List;

import com.empapp.dao.EmployeeDAO;
import com.empapp.dto.Employee;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.empapp.utility.*;

public class EmployeeDAOImpl implements EmployeeDAO {
	
	private Connection con;
	
	public EmployeeDAOImpl() {
		this.con=Connector.requestConnection();
	}

	@Override
	public void addEmployee(Employee e) {
		// TODO Auto-generated method stub
		String query="insert into emp values (0,?,?,?,?,sysdate(),?,?)";
		PreparedStatement ps;
		try {
			ps = con.prepareStatement(query);
			ps.setString(1,e.getName());
			ps.setString(2, e.getJob());
			ps.setDouble(3, e.getSalary());
			ps.setInt(4, e.getDno());
			ps.setString(5,e.getMail());
			ps.setString(6,e.getPassword());
			ps.executeUpdate();
			
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			System.out.println("Failed to add data");
			
		}
		
		
	}

	@Override
	public Employee findById(Integer id) {
		// TODO Auto-generated method stub
		String query = "select * from emp where id=?";
		Employee e=null;
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setInt(1,id);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				e=new Employee();
				e.setId(rs.getInt("id"));
				e.setName(rs.getString("name"));
				e.setJob(rs.getString("job"));
				e.setSalary(rs.getDouble("salary"));
				e.setDno(rs.getInt("dno"));
				e.setCreatedAt(rs.getString("Created_at"));
				e.setMail(rs.getString("mail"));
				e.setPassword(rs.getString("password"));
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			System.out.println("Faileed to fetch data");
		}
		
		return e;
	}

	@Override
	public List<Employee> findAll() {
		// TODO Auto-generated method stub
		List<Employee> res=new ArrayList<>();
		
		Employee e=null;
		
		String query="select * from emp";
		PreparedStatement ps;
		try {
			ps = con.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				e=new Employee();
				e.setId(rs.getInt("id"));
				e.setName(rs.getString("name"));
				e.setJob(rs.getString("job"));
				e.setSalary(rs.getDouble("salary"));
				e.setDno(rs.getInt("dno"));
				e.setCreatedAt(rs.getString("Created_at"));
				e.setMail(rs.getString("mail"));
				e.setPassword(rs.getString("password"));
				res.add(e);
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			System.out.println("Failed to fetch data");
		}
				
		return res;
	}

	@Override
	public Employee findByMailandPassword(String mail, String password) {
		// TODO Auto-generated method stub
		Employee e=null;
		String query="select * from emp where mail=? and password=?";
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1, mail);
			ps.setString(2, password);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				e=new Employee();
				e.setId(rs.getInt("id"));
				e.setName(rs.getString("name"));
				e.setJob(rs.getString("job"));
				e.setSalary(rs.getDouble("salary"));
				e.setDno(rs.getInt("dno"));
				e.setCreatedAt(rs.getString("Created_at"));
				e.setMail(rs.getString("mail"));
				e.setPassword(rs.getString("password"));
				
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			System.out.println("Failed to fetch data!");
		}
		
		
		return e;
	}

	public void updateEmployee(EmployeeDAO e) {
		// TODO Auto-generated method stub
		String query="";
		
	}

	@Override
	public void updateEmployee(Employee e) {

	    String query = "UPDATE EMP SET NAME = ?, JOB = ?, SALARY = ?, DNO = ?, mail = ?, password = ? WHERE id = ?";

		try {

			PreparedStatement ps = con.prepareStatement(query);

			ps.setString(1, e.getName());
			ps.setString(2, e.getJob());
			ps.setDouble(3, e.getSalary());
			ps.setInt(4, e.getDno());
			ps.setString(5, e.getMail());
			ps.setString(6, e.getPassword());
			ps.setInt(7, e.getId());

			ps.executeUpdate();

		} catch (SQLException e1) {
			e1.printStackTrace();
			System.out.println("failed to update data");
		}
	}

	@Override
	public Employee findByMail(String mail) {
		Employee e=null;
		String query="select * from emp where mail=?";
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1, mail);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				e=new Employee();
				e.setId(rs.getInt("id"));
				e.setName(rs.getString("name"));
				e.setJob(rs.getString("job"));
				e.setSalary(rs.getDouble("salary"));
				e.setDno(rs.getInt("dno"));
				e.setCreatedAt(rs.getString("Created_at"));
				e.setMail(rs.getString("mail"));
				e.setPassword(rs.getString("password"));
				
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			System.out.println("Failed to fetch data!");
		}
		
		
		return e;
	}
	
	


}
