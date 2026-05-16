package com.empapp.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;

import com.empapp.dao.DeptDAO;
import com.empapp.dto.Dept;
import com.empapp.dto.Employee;
import com.empapp.utility.Connector;

public class DeptDAOImpl implements DeptDAO {
	
private Connection con;
	
	public DeptDAOImpl() {
		this.con=Connector.requestConnection();
	}

	@Override
	public void addDept(Dept d) {
		String query="insert into dept values (0,?,?)";
		
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1,d.getDname());
			ps.setString(2, d.getLocation());
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Failed to add data!");
		}
		

	}

	@Override
	public Dept findById(Integer id) {
		// TODO Auto-generated method stub
		Dept d=null;
		String query="select * from dept where dno=?";
		
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				d=new Dept();
				d.setDno(rs.getInt("dno"));
				d.setDname(rs.getString("dname"));
				d.setDname(rs.getString("location"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Failed to get data by Id!");
		}
		return d;
		
	}

	@Override
	public List<Dept> findAll() {
		List<Dept> res=new ArrayList<>();
		
		Dept d=null;
		
		String query="select * from emp";
		PreparedStatement ps;
		try {
			ps = con.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				d=new Dept();
				d.setDno(rs.getInt("id"));
				d.setDname(rs.getString("dname"));
				d.setLocation(rs.getString("location"));
				res.add(d);
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			System.out.println("Failed to fetch data");
		}
				
		return res;
	}

	@Override
	public void updateDept(Dept d) {
		// TODO Auto-generated method stub
		
		

	}

	@Override
	public void deleteDept(Integer dno) {
		// TODO Auto-generated method stub
		String query="delete from dept where id=?";
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setInt(1,dno);
			ps.executeUpdate();
			System.out.println("Deleted data successfully");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("unable to delete the data");
		}
		

	}

}
