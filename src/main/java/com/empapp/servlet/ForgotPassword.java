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

@WebServlet("/forgotPassword")
public class ForgotPassword extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		EmployeeDAO edao=new EmployeeDAOImpl();
		
		Employee e=edao.findByMail(req.getParameter("mail"));
		
		if(e!=null) {
			if(req.getParameter("password").equals(req.getParameter("confirmPassword"))) {
				e.setPassword(req.getParameter("password"));
				edao.updateEmployee(e);
				req.setAttribute("success","Password changed Successfully");
				req.getRequestDispatcher("login.jsp").forward(req, resp);
			}else {
				req.setAttribute("error", "Password Mismatch");
				req.getRequestDispatcher("forgot.jsp").forward(req,resp);
			}
		}else {			//user doesnt exist
			req.setAttribute("error", "user does not exist");
			req.getRequestDispatcher("forgot.jsp").forward(req, resp);
		}
		
	}
	
}
