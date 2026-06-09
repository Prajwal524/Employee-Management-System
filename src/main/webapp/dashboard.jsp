<%@page import="com.empapp.dto.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard — EMS</title>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        body { font-family: 'Plus Jakarta Sans', sans-serif; background: #f8fafc; }
        .nav-link {
            display: flex; align-items: center; gap: 7px;
            padding: 8px 14px; border-radius: 8px; font-size: 13px; font-weight: 600;
            color: #64748b; text-decoration: none; transition: all 0.2s; white-space: nowrap;
        }
        .nav-link:hover { background: #f1f5f9; color: #1e293b; }
        .nav-link.active { background: #eef2ff; color: #4f46e5; }
        .info-card {
            background: #fff; border: 1.5px solid #e2e8f0; border-radius: 14px;
            padding: 22px 24px; transition: all 0.2s;
        }
        .info-card:hover { border-color: #a5b4fc; box-shadow: 0 4px 18px rgba(99,102,241,0.09); transform: translateY(-2px); }
        .alert-success { background:#f0fdf4; border:1.5px solid #bbf7d0; color:#16a34a; border-radius:10px; padding:10px 14px; font-size:13px; font-weight:500; }
        @keyframes fadeUp { from { opacity:0; transform:translateY(12px); } to { opacity:1; transform:translateY(0); } }
        .page-content { animation: fadeUp 0.35s ease both; }
    </style>
</head>
<body>

<%Employee e=(Employee)session.getAttribute("employee");%>
<%String successMessage=(String)request.getAttribute("success");%>

<!-- TOP NAV -->
<nav class="bg-white border-b border-slate-200 sticky top-0 z-50 shadow-sm">
    <div class="max-w-6xl mx-auto px-6 flex items-center h-16">
        <!-- Brand -->
        <a href="dashboard.jsp" class="flex items-center gap-3 mr-8">
            <div class="w-8 h-8 bg-indigo-600 rounded-lg flex items-center justify-center">
                <svg class="w-4 h-4 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0z"/>
                </svg>
            </div>
            <span class="font-bold text-slate-800 text-base tracking-tight">EMS Portal</span>
        </a>

        <!-- Nav Links -->
        <div class="flex items-center gap-1">
            <a href="dashboard.jsp" class="nav-link active"><i class="fas fa-user text-xs"></i> My Profile</a>
            <a href="view.jsp" class="nav-link"><i class="fas fa-users text-xs"></i> Co-workers</a>
            <a href="update.jsp" class="nav-link"><i class="fas fa-edit text-xs"></i> Update Account</a>
            <a href="reset.jsp" class="nav-link"><i class="fas fa-key text-xs"></i> Reset Password</a>
        </div>

        <div class="ml-auto flex items-center gap-3">
            <!-- Avatar -->
            <div class="w-8 h-8 rounded-full bg-indigo-600 flex items-center justify-center text-white font-bold text-sm">
                <%=e.getName().substring(0,1).toUpperCase()%>
            </div>
            <a href="logout" class="flex items-center gap-2 text-sm font-semibold text-red-500 hover:text-red-700 bg-red-50 hover:bg-red-100 px-3 py-2 rounded-lg transition-all">
                <i class="fas fa-sign-out-alt text-xs"></i> Logout
            </a>
        </div>
    </div>
</nav>

<!-- MAIN -->
<div class="max-w-6xl mx-auto px-6 py-10 page-content">

    <%if(successMessage!=null){%>
    <div class="alert-success mb-6">✓ <%=successMessage%></div>
    <%}%>

    <!-- Profile Header -->
    <div class="flex items-center gap-5 mb-8">
        <div class="w-16 h-16 rounded-2xl bg-gradient-to-br from-indigo-500 to-violet-600 flex items-center justify-center text-white font-extrabold text-2xl shadow-lg">
            <%=e.getName().substring(0,1).toUpperCase()%>
        </div>
        <div>
            <h1 class="text-2xl font-extrabold text-slate-800 tracking-tight"><%=e.getName()%></h1>
            <p class="text-slate-500 text-sm mt-0.5"><%=e.getJob()%> &nbsp;·&nbsp; <%=e.getMail()%></p>
        </div>
        <div class="ml-auto">
            <span class="bg-green-50 text-green-700 border border-green-200 text-xs font-bold px-3 py-1.5 rounded-full">● Active</span>
        </div>
    </div>

    <!-- Info Cards -->
    <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
        <div class="info-card">
            <p class="text-xs font-semibold text-slate-400 uppercase tracking-wider mb-2">Employee ID</p>
            <p class="text-xl font-extrabold text-indigo-600">EMP00<%=e.getId()%></p>
        </div>
        <div class="info-card">
            <p class="text-xs font-semibold text-slate-400 uppercase tracking-wider mb-2">Full Name</p>
            <p class="text-xl font-bold text-slate-800"><%=e.getName()%></p>
        </div>
        <div class="info-card">
            <p class="text-xs font-semibold text-slate-400 uppercase tracking-wider mb-2">Job Position</p>
            <p class="text-xl font-bold text-slate-800"><%=e.getJob()%></p>
        </div>
        <div class="info-card">
            <p class="text-xs font-semibold text-slate-400 uppercase tracking-wider mb-2">Monthly Salary</p>
            <p class="text-xl font-extrabold text-slate-800">₹<%=e.getSalary()%><span class="text-sm font-normal text-slate-400"> /mo</span></p>
        </div>
        <div class="info-card">
            <p class="text-xs font-semibold text-slate-400 uppercase tracking-wider mb-2">Department</p>
            <p class="text-xl font-bold text-slate-800">IT</p>
        </div>
        <div class="info-card">
            <p class="text-xs font-semibold text-slate-400 uppercase tracking-wider mb-2">Email Address</p>
            <p class="text-base font-semibold text-slate-800 break-all"><%=e.getMail()%></p>
        </div>
    </div>

    <!-- Quick actions -->
    <div class="mt-8 bg-white border border-slate-200 rounded-2xl p-6">
        <p class="text-sm font-bold text-slate-500 uppercase tracking-wider mb-4">Quick Actions</p>
        <div class="flex flex-wrap gap-3">
            <a href="view.jsp" class="flex items-center gap-2 bg-indigo-50 hover:bg-indigo-100 text-indigo-700 font-semibold text-sm px-4 py-2.5 rounded-xl transition-all border border-indigo-100">
                <i class="fas fa-users text-xs"></i> View Co-workers
            </a>
            <a href="update.jsp" class="flex items-center gap-2 bg-slate-50 hover:bg-slate-100 text-slate-700 font-semibold text-sm px-4 py-2.5 rounded-xl transition-all border border-slate-200">
                <i class="fas fa-edit text-xs"></i> Update Profile
            </a>
            <a href="reset.jsp" class="flex items-center gap-2 bg-slate-50 hover:bg-slate-100 text-slate-700 font-semibold text-sm px-4 py-2.5 rounded-xl transition-all border border-slate-200">
                <i class="fas fa-key text-xs"></i> Change Password
            </a>
        </div>
    </div>
</div>

<!-- Footer -->
<footer class="text-center text-slate-400 text-xs py-8 mt-4 border-t border-slate-100">
    Employee Management System &nbsp;|&nbsp; Punith B &nbsp;|&nbsp; J2EE Session
</footer>
</body>
</html>
