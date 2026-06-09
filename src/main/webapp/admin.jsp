<%@page import="com.empapp.dao.impl.DeptDAOImpl"%>
<%@page import="com.empapp.dao.DeptDAO"%>
<%@page import="com.empapp.dao.impl.EmployeeDAOImpl"%>
<%@page import="com.empapp.dao.EmployeeDAO"%>
<%@page import="com.empapp.dto.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard — EMS</title>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        body { font-family: 'Plus Jakarta Sans', sans-serif; background: #f8fafc; }
        @keyframes fadeUp { from { opacity:0; transform:translateY(12px); } to { opacity:1; transform:translateY(0); } }
        .page-content { animation: fadeUp 0.35s ease both; }
        .stat-card {
            background: #fff; border: 1.5px solid #e2e8f0; border-radius: 16px;
            padding: 24px; transition: all 0.2s; overflow: hidden; position: relative;
        }
        .stat-card:hover { transform: translateY(-3px); box-shadow: 0 8px 25px rgba(0,0,0,0.07); }
        .action-btn {
            display: flex; align-items: center; gap: 8px;
            padding: 10px 18px; border-radius: 10px; font-size: 13px;
            font-weight: 700; text-decoration: none; transition: all 0.2s;
            border: 1.5px solid transparent;
        }
    </style>
</head>
<body>

<%EmployeeDAO edao = new EmployeeDAOImpl();%>
<%DeptDAO ddao = new DeptDAOImpl();%>
<%Employee admin = (Employee)session.getAttribute("employee");%>

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
        <span class="bg-indigo-100 text-indigo-700 text-xs font-extrabold px-3 py-1 rounded-full uppercase tracking-wide">Admin</span>
        <div class="ml-auto flex items-center gap-3">
            <div class="flex items-center gap-2 text-sm text-slate-600 font-medium">
                <div class="w-7 h-7 rounded-full bg-indigo-600 flex items-center justify-center text-white font-bold text-xs">
                    <%=admin.getName().substring(0,1).toUpperCase()%>
                </div>
                <%=admin.getName()%>
            </div>
            <a href="logout" class="flex items-center gap-2 text-sm font-semibold text-red-500 hover:text-red-700 bg-red-50 hover:bg-red-100 px-3 py-2 rounded-lg transition-all">
                <i class="fas fa-sign-out-alt text-xs"></i> Logout
            </a>
        </div>
    </div>
</nav>

<div class="max-w-6xl mx-auto px-6 py-10 page-content">

    <!-- Page Title -->
    <div class="mb-8">
        <h1 class="text-2xl font-extrabold text-slate-800 tracking-tight">Admin Dashboard</h1>
        <p class="text-slate-500 text-sm mt-1">Manage employees and departments from here</p>
    </div>

    <!-- Stat Cards -->
    <div class="grid grid-cols-1 sm:grid-cols-2 gap-5 mb-8">
        <div class="stat-card">
            <div class="absolute top-0 right-0 w-24 h-24 bg-indigo-50 rounded-full -translate-y-8 translate-x-8 pointer-events-none"></div>
            <div class="flex items-center justify-between relative z-10">
                <div>
                    <p class="text-xs font-semibold text-slate-400 uppercase tracking-wider mb-2">Total Employees</p>
                    <p class="text-4xl font-extrabold text-indigo-600"><%=edao.findAll().size()%></p>
                    <p class="text-xs text-slate-400 mt-2 font-medium">Registered in system</p>
                </div>
                <div class="w-14 h-14 bg-indigo-50 rounded-2xl flex items-center justify-center border border-indigo-100">
                    <i class="fas fa-users text-indigo-500 text-xl"></i>
                </div>
            </div>
        </div>
        <div class="stat-card">
            <div class="absolute top-0 right-0 w-24 h-24 bg-violet-50 rounded-full -translate-y-8 translate-x-8 pointer-events-none"></div>
            <div class="flex items-center justify-between relative z-10">
                <div>
                    <p class="text-xs font-semibold text-slate-400 uppercase tracking-wider mb-2">Total Departments</p>
                    <p class="text-4xl font-extrabold text-violet-600"><%=ddao.findAll().size()%></p>
                    <p class="text-xs text-slate-400 mt-2 font-medium">Active departments</p>
                </div>
                <div class="w-14 h-14 bg-violet-50 rounded-2xl flex items-center justify-center border border-violet-100">
                    <i class="fas fa-building text-violet-500 text-xl"></i>
                </div>
            </div>
        </div>
    </div>

    <!-- Action Buttons -->
    <div class="bg-white border border-slate-200 rounded-2xl p-6 mb-8">
        <p class="text-sm font-bold text-slate-500 uppercase tracking-wider mb-4">Quick Actions</p>
        <div class="flex flex-wrap gap-3">
            <a href="register.jsp" class="action-btn bg-indigo-600 hover:bg-indigo-700 text-white shadow-sm shadow-indigo-200">
                <i class="fas fa-user-plus text-xs"></i> Add Employee
            </a>
            <a href="view.jsp" class="action-btn bg-white hover:bg-slate-50 text-slate-700 border-slate-200 hover:border-indigo-300">
                <i class="fas fa-eye text-xs"></i> View Employees
            </a>
            <a href="dept.jsp" class="action-btn bg-white hover:bg-slate-50 text-slate-700 border-slate-200 hover:border-indigo-300">
                <i class="fas fa-plus-circle text-xs"></i> Add Department
            </a>
            <a href="viewDept.jsp" class="action-btn bg-white hover:bg-slate-50 text-slate-700 border-slate-200 hover:border-indigo-300">
                <i class="fas fa-list text-xs"></i> View Departments
            </a>
        </div>
    </div>

    <!-- Admin Profile Table -->
    <div class="bg-white border border-slate-200 rounded-2xl overflow-hidden">
        <div class="px-6 py-5 border-b border-slate-100">
            <h2 class="font-extrabold text-slate-800 text-base">Admin Profile</h2>
            <p class="text-slate-400 text-xs mt-0.5">Your account details</p>
        </div>
        <div class="overflow-x-auto">
            <table class="w-full">
                <thead>
                    <tr class="bg-slate-50">
                        <th class="text-left px-6 py-3.5 text-xs font-bold text-slate-500 uppercase tracking-wider">Name</th>
                        <th class="text-left px-6 py-3.5 text-xs font-bold text-slate-500 uppercase tracking-wider">Job</th>
                        <th class="text-left px-6 py-3.5 text-xs font-bold text-slate-500 uppercase tracking-wider">Salary</th>
                        <th class="text-left px-6 py-3.5 text-xs font-bold text-slate-500 uppercase tracking-wider">Dept</th>
                        <th class="text-left px-6 py-3.5 text-xs font-bold text-slate-500 uppercase tracking-wider">Email</th>
                    </tr>
                </thead>
                <tbody>
                    <tr class="hover:bg-slate-50 transition-colors">
                        <td class="px-6 py-4">
                            <div class="flex items-center gap-3">
                                <div class="w-8 h-8 rounded-full bg-indigo-600 flex items-center justify-center text-white font-bold text-sm">
                                    <%=admin.getName().substring(0,1).toUpperCase()%>
                                </div>
                                <span class="font-semibold text-slate-800"><%=admin.getName()%></span>
                            </div>
                        </td>
                        <td class="px-6 py-4">
                            <span class="bg-indigo-50 text-indigo-700 border border-indigo-100 text-xs font-bold px-2.5 py-1 rounded-full"><%=admin.getJob()%></span>
                        </td>
                        <td class="px-6 py-4 font-semibold text-slate-800">₹<%=admin.getSalary()%></td>
                        <td class="px-6 py-4 text-slate-600">HR</td>
                        <td class="px-6 py-4 text-slate-600 text-sm"><%=admin.getMail()%></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
