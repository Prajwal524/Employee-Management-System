<%@page import="com.empapp.dto.Dept"%>
<%@page import="com.empapp.dao.impl.DeptDAOImpl"%>
<%@page import="com.empapp.dao.DeptDAO"%>
<%@page import="com.empapp.dto.Employee"%>
<%@page import="java.util.List"%>
<%@page import="com.empapp.dao.impl.EmployeeDAOImpl"%>
<%@page import="com.empapp.dao.EmployeeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Employees — EMS</title>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        body { font-family: 'Plus Jakarta Sans', sans-serif; background: #f8fafc; }
        @keyframes fadeUp { from { opacity:0; transform:translateY(12px); } to { opacity:1; transform:translateY(0); } }
        .page-content { animation: fadeUp 0.35s ease both; }
        tbody tr { transition: background 0.15s; }
        tbody tr:hover { background: #f8faff; }
    </style>
</head>
<body class="min-h-screen">

<%Employee emp = (Employee)session.getAttribute("employee");%>
<%if(emp!=null){%>

<!-- NAV -->
<nav class="bg-white border-b border-slate-200 sticky top-0 z-50 shadow-sm">
    <div class="max-w-6xl mx-auto px-6 flex items-center h-16 gap-4">
        <div class="flex items-center gap-3">
            <div class="w-8 h-8 bg-indigo-600 rounded-lg flex items-center justify-center">
                <svg class="w-4 h-4 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0z"/>
                </svg>
            </div>
            <span class="font-bold text-slate-800 text-base tracking-tight">EMS Portal</span>
        </div>
        <div class="ml-auto">
            <%if(emp.getJob().equals("HR")){%>
            <a href="admin.jsp" class="flex items-center gap-2 text-sm font-semibold text-slate-500 hover:text-indigo-600 bg-slate-50 hover:bg-indigo-50 border border-slate-200 hover:border-indigo-200 px-3 py-2 rounded-lg transition-all">
                <i class="fas fa-arrow-left text-xs"></i> Back to Admin
            </a>
            <%}else{%>
            <a href="dashboard.jsp" class="flex items-center gap-2 text-sm font-semibold text-slate-500 hover:text-indigo-600 bg-slate-50 hover:bg-indigo-50 border border-slate-200 hover:border-indigo-200 px-3 py-2 rounded-lg transition-all">
                <i class="fas fa-arrow-left text-xs"></i> Back to Dashboard
            </a>
            <%}%>
        </div>
    </div>
</nav>

<!-- MAIN -->
<div class="max-w-6xl mx-auto px-6 py-10 page-content">
    <div class="mb-7">
        <h1 class="text-2xl font-extrabold text-slate-800 tracking-tight">
            <%if(emp.getJob().equals("HR")){%>All Employees<%}else{%>My Co-workers<%}%>
        </h1>
        <p class="text-slate-500 text-sm mt-1">Directory of all registered employees</p>
    </div>

    <div class="bg-white rounded-2xl border border-slate-200 shadow-sm overflow-hidden">
        <%EmployeeDAO edao = new EmployeeDAOImpl();%>
        <%List<Employee> eList = edao.findAll();%>

        <!-- Table header count -->
        <div class="px-6 py-4 border-b border-slate-100 flex items-center justify-between">
            <p class="text-sm font-bold text-slate-600">
                <span class="bg-indigo-50 text-indigo-700 border border-indigo-100 text-xs font-extrabold px-2.5 py-1 rounded-full mr-2"><%=eList != null ? eList.size() : 0%></span>
                employees found
            </p>
        </div>

        <div class="overflow-x-auto">
            <table class="w-full">
                <thead>
                    <tr class="bg-slate-50">
                        <th class="text-left px-6 py-3.5 text-xs font-bold text-slate-500 uppercase tracking-wider">ID</th>
                        <th class="text-left px-6 py-3.5 text-xs font-bold text-slate-500 uppercase tracking-wider">Name</th>
                        <th class="text-left px-6 py-3.5 text-xs font-bold text-slate-500 uppercase tracking-wider">Job Position</th>
                        <th class="text-left px-6 py-3.5 text-xs font-bold text-slate-500 uppercase tracking-wider">Email</th>
                        <th class="text-left px-6 py-3.5 text-xs font-bold text-slate-500 uppercase tracking-wider">Department</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-slate-100">
                <%if(eList!=null && !eList.isEmpty()){%>
                <%for(Employee e : eList){%>
                <%DeptDAO deptdao = new DeptDAOImpl();%>
                <%Dept d = deptdao.findById(e.getDno()); %>
                    <tr>
                        <td class="px-6 py-4">
                            <span class="text-xs font-extrabold text-indigo-600 bg-indigo-50 border border-indigo-100 px-2.5 py-1 rounded-full">EMP00<%=e.getId()%></span>
                        </td>
                        <td class="px-6 py-4">
                            <div class="flex items-center gap-3">
                                <div class="w-8 h-8 rounded-full bg-gradient-to-br from-indigo-500 to-violet-600 flex items-center justify-center text-white font-bold text-xs flex-shrink-0">
                                    <%=e.getName().substring(0,1).toUpperCase()%>
                                </div>
                                <span class="font-semibold text-slate-800 text-sm"><%=e.getName()%></span>
                            </div>
                        </td>
                        <td class="px-6 py-4">
                            <span class="bg-indigo-50 text-indigo-700 border border-indigo-100 text-xs font-bold px-2.5 py-1 rounded-full"><%=e.getJob()%></span>
                        </td>
                        <td class="px-6 py-4 text-slate-600 text-sm"><%=e.getMail()%></td>
                        <td class="px-6 py-4 text-slate-700 text-sm font-medium"><%=d.getDname()%></td>
                    </tr>
                <%}
                }%>
                </tbody>
            </table>
        </div>
    </div>
</div>

<%}else{%>
<%request.setAttribute("error", "Session expired already");%>
<%request.getRequestDispatcher("login.jsp");%>
<%}%>
</body>
</html>
