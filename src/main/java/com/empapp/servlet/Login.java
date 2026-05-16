package com.empapp.servlet;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.empapp.dao.EmployeeDAO;
import com.empapp.dao.impl.EmployeeDAOImpl;
import com.empapp.dto.Employee;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class Login extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		EmployeeDAO edao=new EmployeeDAOImpl();
		Employee e=edao.findByMailandPassword(req.getParameter("mail"), req.getParameter("password"));
		
		if(e!=null) {
			req.setAttribute("employee", e);
			RequestDispatcher rd=req.getRequestDispatcher("dashboard.jsp");
		    rd.forward(req, resp);
		}else {
			req.setAttribute("error", "Invalid credentials");
			req.getRequestDispatcher("login.jsp").forward(req, resp);
		}
	
	}
	
}
