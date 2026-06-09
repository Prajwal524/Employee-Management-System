<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register — EMS</title>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        body { font-family: 'Plus Jakarta Sans', sans-serif; }
        .input-field {
            width: 100%; border: 1.5px solid #e2e8f0; border-radius: 10px;
            padding: 11px 14px; font-family: 'Plus Jakarta Sans', sans-serif;
            font-size: 14px; outline: none; background: #fff; color: #1e293b;
            transition: border-color 0.2s, box-shadow 0.2s;
        }
        .input-field:focus { border-color: #6366f1; box-shadow: 0 0 0 3px rgba(99,102,241,0.1); }
        .input-field::placeholder { color: #94a3b8; }
        select.input-field { cursor: pointer; }
        @keyframes fadeUp { from { opacity:0; transform:translateY(18px); } to { opacity:1; transform:translateY(0); } }
        .card { animation: fadeUp 0.45s cubic-bezier(.22,1,.36,1) both; }
        .btn-primary {
            width:100%; background: linear-gradient(135deg, #6366f1, #4f46e5);
            color:#fff; border:none; border-radius:10px; padding:12px;
            font-family:'Plus Jakarta Sans',sans-serif; font-weight:700; font-size:14px;
            cursor:pointer; transition: all 0.2s; letter-spacing:0.2px;
            box-shadow: 0 4px 14px rgba(99,102,241,0.3);
        }
        .btn-primary:hover { transform:translateY(-1px); box-shadow:0 6px 20px rgba(99,102,241,0.4); }
        .grid-bg { background-image: radial-gradient(circle, #e2e8f0 1px, transparent 1px); background-size: 28px 28px; }
        .alert-success { background:#f0fdf4; border:1.5px solid #bbf7d0; color:#16a34a; border-radius:10px; padding:10px 14px; font-size:13px; font-weight:500; }
    </style>
</head>
<body class="min-h-screen grid-bg flex items-center justify-center px-4 py-10 bg-slate-50">

    <div class="fixed top-0 left-0 w-96 h-96 bg-indigo-100 rounded-full mix-blend-multiply filter blur-3xl opacity-50 pointer-events-none"></div>
    <div class="fixed bottom-0 right-0 w-96 h-96 bg-violet-100 rounded-full mix-blend-multiply filter blur-3xl opacity-50 pointer-events-none"></div>

    <div class="card relative z-10 bg-white rounded-2xl shadow-xl border border-slate-100 p-10 w-full max-w-md">

        <!-- Brand -->
        <div class="flex items-center gap-3 mb-8">
            <div class="w-10 h-10 bg-indigo-600 rounded-xl flex items-center justify-center shadow-md">
                <svg class="w-5 h-5 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0z"/>
                </svg>
            </div>
            <div>
                <span class="font-bold text-slate-800 text-lg tracking-tight">EMS Portal</span>
                <p class="text-xs text-slate-400 font-medium">Employee Management System</p>
            </div>
        </div>

        <h1 class="text-2xl font-extrabold text-slate-800 mb-1 tracking-tight">Create account</h1>
        <p class="text-sm text-slate-500 mb-7">Join the employee management system</p>

        <%String successMessage=(String)request.getAttribute("success"); %>
        <%if(successMessage!=null){ %>
        <div class="alert-success mb-5">✓ <%= successMessage %></div>
        <%} %>

        <form action="register" method="POST" class="space-y-4">
            <div>
                <label class="block text-xs font-semibold text-slate-500 uppercase tracking-wider mb-2">Full Name</label>
                <input class="input-field" type="text" name="name" placeholder="Enter your full name" required>
            </div>
            <div>
                <label class="block text-xs font-semibold text-slate-500 uppercase tracking-wider mb-2">Email Address</label>
                <input class="input-field" type="email" name="mail" placeholder="you@company.com" required>
            </div>
            <div class="grid grid-cols-2 gap-4">
                <div>
                    <label class="block text-xs font-semibold text-slate-500 uppercase tracking-wider mb-2">Job Role</label>
                    <select class="input-field" name="job">
                        <option value="">-- Select --</option>
                        <option value="Developer">Developer</option>
                        <option value="Tester">Tester</option>
                        <option value="Manager">Manager</option>
                    </select>
                </div>
                <div>
                    <label class="block text-xs font-semibold text-slate-500 uppercase tracking-wider mb-2">Department</label>
                    <select class="input-field" name="dno">
                        <option value="">-- Select --</option>
                        <option value="10">HR</option>
                        <option value="20">IT</option>
                        <option value="30">NON IT</option>
                    </select>
                </div>
            </div>
            <div>
                <label class="block text-xs font-semibold text-slate-500 uppercase tracking-wider mb-2">Salary (₹)</label>
                <input class="input-field" type="number" name="sal" placeholder="Enter monthly salary" required>
            </div>
            <div>
                <label class="block text-xs font-semibold text-slate-500 uppercase tracking-wider mb-2">Password</label>
                <input class="input-field" type="password" name="password" placeholder="Create a password" required>
            </div>
            <button type="submit" class="btn-primary mt-2">Create Account</button>
        </form>

        <p class="text-center text-slate-500 text-sm mt-7">
            Already have an account? <a href="login.jsp" class="text-indigo-600 font-semibold hover:underline">Sign in</a>
        </p>
    </div>
</body>
</html>
