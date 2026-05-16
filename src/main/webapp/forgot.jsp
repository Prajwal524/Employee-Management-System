<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reset Password</title>

    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>

    <style>
        body {
            background-color: black;
        }
    </style>
</head>
<body class="flex items-center justify-center min-h-screen">
    <div class="bg-gray-900 text-white p-8 rounded-2xl shadow-lg w-96">

        <h2 class="text-2xl font-bold text-center text-blue-400 mb-4">
            Reset Password
        </h2>

        <p class="text-sm text-gray-400 text-center mb-6">
            Enter your email and set a new password
        </p>

        <form action="reset-password" method="POST" class="space-y-5">

           
            <div>
                <label class="block mb-1 text-sm">Email</label>
                <input 
                    type="email" 
                    name="email" 
                    placeholder="Enter your email"
                    class="w-full px-4 py-2 rounded-lg bg-gray-800 border border-gray-700 focus:outline-none focus:ring-2 focus:ring-blue-400"
                    required
                >
            </div>

            <div>
                <label class="block mb-1 text-sm">New Password</label>
                <input 
                    type="password" 
                    name="newPassword" 
                    placeholder="Enter new password"
                    class="w-full px-4 py-2 rounded-lg bg-gray-800 border border-gray-700 focus:outline-none focus:ring-2 focus:ring-blue-400"
                    required
                >
            </div>

            <div>
                <label class="block mb-1 text-sm">Confirm Password</label>
                <input 
                    type="password" 
                    name="confirmPassword" 
                    placeholder="Confirm new password"
                    class="w-full px-4 py-2 rounded-lg bg-gray-800 border border-gray-700 focus:outline-none focus:ring-2 focus:ring-blue-400"
                    required
                >
            </div>

            <button 
                type="submit"
                class="w-full bg-blue-500 hover:bg-blue-600 transition duration-300 py-2 rounded-lg font-semibold"
            >
                Reset Password
            </button>

        </form>

        <p class="text-center text-sm mt-6">
            Back to
            <a href="login.jsp" class="text-blue-400 hover:underline">
                Login
            </a>
        </p>

    </div>

</body>
</html>