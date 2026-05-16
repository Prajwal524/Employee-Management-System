<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>

    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>

    <style>
        body {
            background-color: black;
        }
    </style>
</head>
<body class="flex items-center justify-center min-h-screen">

    <div class="bg-gray-900 text-white p-8 rounded-2xl shadow-lg w-96">

        <h2 class="text-2xl font-bold text-center text-blue-400 mb-6">
            Login
        </h2>
        
        <%String success=(String)request.getAttribute("success"); %>
        <%if(success!=null){ %>
        <h6 class="text-green-700"><%= success %></h6>
        <%} %>

        <form action="login" method="POST" class="space-y-5">

            <div>
                <label class="block mb-1 text-sm">Email</label>
                <input 
                    type="email" 
                    name="mail" 
                    placeholder="Enter your email"
                    class="w-full px-4 py-2 rounded-lg bg-gray-800 border border-gray-700 focus:outline-none focus:ring-2 focus:ring-blue-400"
                    required
                >
            </div>

            <div>
                <label class="block mb-1 text-sm">Password</label>
                <input 
                    type="password" 
                    name="password" 
                    placeholder="Enter your password"
                    class="w-full px-4 py-2 rounded-lg bg-gray-800 border border-gray-700"
                    required
                >
            </div>

            <div class="flex justify-between items-center text-sm">
                <label class="flex items-center space-x-2">
                    <input type="checkbox" class="accent-blue-400">
                    <span>Remember me</span>
                </label>
                <a href="forgot.jsp" class="text-blue-400 hover:underline">
                    Forgot password?
                </a>
            </div>

            <button 
                type="submit"
                class="w-full bg-blue-500 hover:bg-blue-600 transition duration-300 py-2 rounded-lg font-semibold"
            >
                Login
            </button>

        </form>

        <p class="text-center text-sm mt-6">
            Don’t have an account?
            <a href="register.jsp" class="text-blue-400 hover:underline">Sign up</a>
        </p>

    </div>

</body>
</html>