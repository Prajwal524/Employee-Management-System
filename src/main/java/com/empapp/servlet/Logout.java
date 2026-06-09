package com.empapp.servlet;

import java.io.IOException;

import com.empapp.dto.Employee;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/logout")
public class Logout extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		Employee e = (Employee) session.getAttribute("employee");

		if (e != null) {
			session.invalidate();
			req.setAttribute("success", "Logged Out Successfully");
			req.getRequestDispatcher("login.jsp").forward(req, resp);

		} 
		else {
			req.setAttribute("error", "Session expired already");
			req.getRequestDispatcher("login.jsp").forward(req, resp);
		}
	}
}