<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Department — EMS</title>
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
            cursor:pointer; transition: all 0.2s; box-shadow: 0 4px 14px rgba(99,102,241,0.3);
        }
        .btn-primary:hover { transform:translateY(-1px); box-shadow:0 6px 20px rgba(99,102,241,0.4); }
        .grid-bg { background-image: radial-gradient(circle, #e2e8f0 1px, transparent 1px); background-size: 28px 28px; }
        .alert-success { background:#f0fdf4; border:1.5px solid #bbf7d0; color:#16a34a; border-radius:10px; padding:10px 14px; font-size:13px; font-weight:500; }
        .alert-error { background:#fef2f2; border:1.5px solid #fecaca; color:#dc2626; border-radius:10px; padding:10px 14px; font-size:13px; font-weight:500; }
    </style>
</head>
<body class="min-h-screen grid-bg flex items-center justify-center px-4 bg-slate-50">

    <div class="fixed top-0 left-0 w-80 h-80 bg-indigo-100 rounded-full mix-blend-multiply filter blur-3xl opacity-50 pointer-events-none"></div>
    <div class="fixed bottom-0 right-0 w-80 h-80 bg-violet-100 rounded-full mix-blend-multiply filter blur-3xl opacity-50 pointer-events-none"></div>

    <div class="card relative z-10 bg-white rounded-2xl shadow-xl border border-slate-100 p-10 w-full max-w-md">

        <a href="admin.jsp" class="inline-flex items-center gap-2 text-slate-400 hover:text-indigo-600 text-sm font-medium mb-8 transition-colors">
            <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7"/></svg>
            Back to Admin
        </a>

        <!-- Icon -->
        <div class="w-14 h-14 bg-indigo-50 rounded-2xl flex items-center justify-center mb-6 border border-indigo-100">
            <svg class="w-7 h-7 text-indigo-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4"/>
            </svg>
        </div>

        <h1 class="text-2xl font-extrabold text-slate-800 mb-1 tracking-tight">Add Department</h1>
        <p class="text-sm text-slate-500 mb-7">Create a new department in the system</p>

        <%String success=(String)request.getAttribute("success"); %>
        <%if(success!=null){ %>
        <div class="alert-success mb-5">✓ <%=success %></div>
        <%} %>

        <%String error=(String)request.getAttribute("error"); %>
        <%if(error!=null){ %>
        <div class="alert-error mb-5">⚠ <%=error %></div>
        <%} %>

        <form action="dept" method="POST" class="space-y-5">
            <div>
                <label class="block text-xs font-semibold text-slate-500 uppercase tracking-wider mb-2">Department Name</label>
                <select class="input-field" name="dname">
                    <option value="">Select Department</option>
                    <option value="Testing">Testing</option>
                    <option value="Developer">Developer</option>
                    <option value="HR">HR</option>
                    <option value="Requirement">Requirement</option>
                </select>
            </div>
            <div>
                <label class="block text-xs font-semibold text-slate-500 uppercase tracking-wider mb-2">Location</label>
                <input class="input-field" type="text" name="dloc" placeholder="Enter department location">
            </div>
            <button type="submit" class="btn-primary">Add Department</button>
        </form>
    </div>
</body>
</html>
