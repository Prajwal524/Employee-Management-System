<%@page import="com.empapp.dto.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reset Password — EMS</title>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        body { font-family: 'Plus Jakarta Sans', sans-serif; background: #f8fafc; }
        .input-field {
            width: 100%; border: 1.5px solid #e2e8f0; border-radius: 10px;
            padding: 11px 14px; font-family: 'Plus Jakarta Sans', sans-serif;
            font-size: 14px; outline: none; background: #fff; color: #1e293b;
            transition: border-color 0.2s, box-shadow 0.2s;
        }
        .input-field:focus { border-color: #6366f1; box-shadow: 0 0 0 3px rgba(99,102,241,0.1); }
        .input-field::placeholder { color: #94a3b8; }
        @keyframes fadeUp { from { opacity:0; transform:translateY(12px); } to { opacity:1; transform:translateY(0); } }
        .card { animation: fadeUp 0.4s ease both; }
        .btn-primary {
            background: linear-gradient(135deg, #6366f1, #4f46e5);
            color:#fff; border:none; border-radius:10px; padding:11px 28px;
            font-family:'Plus Jakarta Sans',sans-serif; font-weight:700; font-size:14px;
            cursor:pointer; transition: all 0.2s; box-shadow: 0 4px 14px rgba(99,102,241,0.3);
        }
        .btn-primary:hover { transform:translateY(-1px); box-shadow:0 6px 20px rgba(99,102,241,0.4); }
        .btn-ghost {
            background: #fff; color:#64748b; border: 1.5px solid #e2e8f0; border-radius:10px;
            padding:11px 22px; font-family:'Plus Jakarta Sans',sans-serif; font-weight:600; font-size:14px;
            cursor:pointer; text-decoration:none; display:inline-flex; align-items:center;
            transition: all 0.2s;
        }
        .btn-ghost:hover { border-color:#6366f1; color:#4f46e5; }
        .alert-success { background:#f0fdf4; border:1.5px solid #bbf7d0; color:#16a34a; border-radius:10px; padding:10px 14px; font-size:13px; font-weight:500; }
        .alert-error { background:#fef2f2; border:1.5px solid #fecaca; color:#dc2626; border-radius:10px; padding:10px 14px; font-size:13px; font-weight:500; }
    </style>
</head>
<body class="min-h-screen flex flex-col items-center pt-12 px-4">

<%Employee e=(Employee)session.getAttribute("employee");%>

    <div class="w-full max-w-lg mb-4">
        <a href="dashboard.jsp" class="inline-flex items-center gap-2 text-slate-400 hover:text-indigo-600 text-sm font-medium transition-colors">
            <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7"/></svg>
            Back to Dashboard
        </a>
    </div>

    <div class="card bg-white rounded-2xl shadow-xl border border-slate-100 w-full max-w-lg overflow-hidden">
        <!-- Card Header -->
        <div class="bg-gradient-to-r from-indigo-600 to-violet-600 px-8 py-6">
            <div class="flex items-center gap-3">
                <div class="w-10 h-10 bg-white/20 rounded-xl flex items-center justify-center">
                    <svg class="w-5 h-5 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 7a2 2 0 012 2m4 0a6 6 0 01-7.743 5.743L11 17H9v2H7v2H4a1 1 0 01-1-1v-2.586a1 1 0 01.293-.707l5.964-5.964A6 6 0 1121 9z"/>
                    </svg>
                </div>
                <div>
                    <h2 class="text-lg font-extrabold text-white">Reset Password</h2>
                    <p class="text-white/70 text-xs">Change your account password securely</p>
                </div>
            </div>
        </div>

        <!-- Card Body -->
        <div class="p-8">
            <%String success=(String)request.getAttribute("success"); %>
            <%if(success!=null){%>
            <div class="alert-success mb-5">✓ <%=success%></div>
            <%}%>

            <%String error=(String)request.getAttribute("error"); %>
            <%if(error!=null){%>
            <div class="alert-error mb-5">⚠ <%=error%></div>
            <%}%>

            <form action="resetPassword" method="POST" class="space-y-5">
                <div>
                    <label class="block text-xs font-semibold text-slate-500 uppercase tracking-wider mb-2">Current Password</label>
                    <input class="input-field" type="password" required name="currentPassword" placeholder="Enter your current password">
                </div>
                <div>
                    <label class="block text-xs font-semibold text-slate-500 uppercase tracking-wider mb-2">New Password</label>
                    <input class="input-field" type="password" name="newPassword" required placeholder="Enter new password">
                    <p class="text-xs text-slate-400 mt-1.5">Minimum 6 characters</p>
                </div>
                <div>
                    <label class="block text-xs font-semibold text-slate-500 uppercase tracking-wider mb-2">Confirm New Password</label>
                    <input class="input-field" type="password" name="confirmPassword" required placeholder="Re-enter new password">
                </div>
                <div class="flex gap-3 pt-1">
                    <button type="submit" class="btn-primary">Reset Password</button>
                    <a href="dashboard.jsp" class="btn-ghost">Cancel</a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
