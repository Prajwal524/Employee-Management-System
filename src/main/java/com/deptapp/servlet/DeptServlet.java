package com.deptapp.servlet;

import java.io.IOException;

import com.empapp.dao.DeptDAO;
import com.empapp.dao.impl.DeptDAOImpl;
import com.empapp.dto.Dept;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/dept")
public class DeptServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		DeptDAO ddao = new DeptDAOImpl();

		Dept d = new Dept();

		d.setDname(req.getParameter("dname"));
		d.setLocation(req.getParameter("dloc"));
		
		ddao.addDept(d);
		req.setAttribute("success", "Department Added!");
		RequestDispatcher rd = req.getRequestDispatcher("dept.jsp");

		rd.forward(req, resp);
	}
}