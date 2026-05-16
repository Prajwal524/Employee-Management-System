<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Register</title>

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
            Register
        </h2>


		<%String successMessage=(String)request.getAttribute("success"); %>
		<%if(successMessage!=null){ %>
		<%=successMessage %>
		<%} %>

        <form action="register" class="space-y-4" method="POST">

            <div>
                <label class="block text-sm mb-1">Name</label>
                <input type="text" name="name"
                    class="w-full px-4 py-2 rounded-lg bg-gray-800 border border-gray-700 focus:outline-none focus:ring-2 focus:ring-blue-400"
                    placeholder="Enter your name" required>
            </div>
			

            <div>
                <label class="block text-sm mb-1">Email</label>
                <input type="email" name="mail"
                    class="w-full px-4 py-2 rounded-lg bg-gray-800 border border-gray-700 focus:outline-none focus:ring-2 focus:ring-blue-400"
                    placeholder="Enter your email" required>
            </div>
            
            <div>
                <label class="block text-sm mb-1">Job Role</label>
                <select name="job">
                	<option>--job--</option>
                	<option class="bg-gray-800" value="Developer">Developer</option>
                	<option class="bg-gray-800" value="Tester">Tester</option>
                	<option class="bg-gray-800" value="Manager">Manager</option>
                </select>
            </div>
            
            <div>
                <label class="block text-sm mb-1">Department</label>
                <select name="dno">
                	<option>--Dept--</option>
                	<option class="bg-gray-800" value="10">HR</option>
                	<option class="bg-gray-800" value="20">IT</option>
                	<option class="bg-gray-800" value="30">NON IT</option>
                </select>
            </div>
			
			<div>
                <label class="block text-sm mb-1">Salary</label>
                <input type="number" name="sal"
                    class="w-full px-4 py-2 rounded-lg bg-gray-800 border border-gray-700 focus:outline-none focus:ring-2 focus:ring-blue-400"
                    placeholder="Enter password" required>
            </div>
			
            <div>
                <label class="block text-sm mb-1">Password</label>
                <input type="password" name="password"
                    class="w-full px-4 py-2 rounded-lg bg-gray-800 border border-gray-700 focus:outline-none focus:ring-2 focus:ring-blue-400"
                    placeholder="Enter password" required>
            </div>


            <button type="submit"
                class="w-full bg-blue-500 hover:bg-blue-600 transition duration-300 py-2 rounded-lg font-semibold">
                Register
            </button>

        </form>

        <p class="text-center text-sm mt-4">
            Already have an account?
            <a href="login.jsp" class="text-blue-400 hover:underline">
                Login
            </a>
        </p>

    </div>

</body>
</html>