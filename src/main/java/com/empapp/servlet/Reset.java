package com.empapp.servlet;

import java.io.IOException;

import com.empapp.dao.EmployeeDAO;
import com.empapp.dao.impl.EmployeeDAOImpl;
import com.empapp.dto.Employee;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/resetPassword")
public class Reset extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		EmployeeDAO edao = new EmployeeDAOImpl();
		HttpSession session = req.getSession();
		Employee e = (Employee) session.getAttribute("employee");

		String current = req.getParameter("currentPassword");
		String newPass = req.getParameter("newPassword");
		String confirm = req.getParameter("confirmPassword");

		if (e.getPassword().equals(current)) {

			if (newPass.equals(confirm)) {
				e.setPassword(newPass);
				edao.updateEmployee(e);
				session.setAttribute("employee", e);
				
				req.setAttribute("success", "Password Updated!");
				req.getRequestDispatcher("reset.jsp").forward(req, resp);

			} else {
				req.setAttribute("error", "Password mismatch!");
				req.getRequestDispatcher("reset.jsp").forward(req, resp);
			}

		} else {
			req.setAttribute("error", "Invalid credentials");
			req.getRequestDispatcher("reset.jsp").forward(req, resp);
		}
	}
}