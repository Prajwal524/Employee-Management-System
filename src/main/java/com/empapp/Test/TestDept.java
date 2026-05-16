package com.empapp.Test;

import java.util.Scanner;

import com.empapp.dto.Employee;
import com.empapp.dao.DeptDAO;
import com.empapp.dao.impl.DeptDAOImpl;
import com.empapp.dto.Dept;

public class TestDept {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc=new Scanner(System.in);
		Dept dp=new Dept();
		DeptDAO ddao=new DeptDAOImpl();
		
//		1. ADD DEPT()
//		System.out.println("Enter dname : ");
//		dp.setDname(sc.next());
//		System.out.println("Enter location : ");
//		dp.setLocation(sc.next());
//		ddao.addDept(dp);
//		System.out.println("Department added successfully!");
		
//		2.FIND BY ID
//		Dept id=ddao.findById(1);
//		System.out.println(id);
		
//		3. deleteDept
//		ddao.deleteDept(2);
		
		
		
	}

}
