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

@WebServlet("/update")
public class Update extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		EmployeeDAO edao = new EmployeeDAOImpl();
		HttpSession session = req.getSession();
		Employee e = (Employee) session.getAttribute("employee");

		if (e.getId() == Integer.parseInt(req.getParameter("eid"))) {
			e.setName(req.getParameter("name"));
			e.setMail(req.getParameter("mail"));
			e.setPassword(req.getParameter("password"));
			
			if (e.getJob().equals("HR")) {
				e.setJob(req.getParameter("job"));
				e.setSalary(Double.parseDouble(req.getParameter("sal")));
				e.setDno(Integer.parseInt(req.getParameter("dno")));
			}
			edao.updateEmployee(e);
//			session.setAttribute("employee", e);
			req.setAttribute("success", "Data updated Successfully..!");
			req.getRequestDispatcher("update.jsp").forward(req, resp);
		}
	}
}