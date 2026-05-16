package com.empapp.servlet;

import java.io.IOException;

import com.empapp.dao.EmployeeDAO;
import com.empapp.dao.impl.EmployeeDAOImpl;
import com.empapp.dto.Employee;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class Register extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		EmployeeDAO edao=new EmployeeDAOImpl();
		Employee e=new Employee();
		
		e.setName(req.getParameter("name"));
		e.setSalary(Double.parseDouble(req.getParameter("sal")));
		e.setDno(Integer.parseInt(req.getParameter("dno")));
		e.setJob(req.getParameter("job"));
		e.setMail(req.getParameter("mail"));
		e.setPassword(req.getParameter("password"));
		
		edao.addEmployee(e);
		
		req.setAttribute("success","Employee account created !");
		RequestDispatcher rd=req.getRequestDispatcher("register.jsp");
		rd.forward(req, resp);
	}
	 
}
