<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>REGISTER</title>
    <style>
        body {
            background: linear-gradient(135deg, #61d8ff 0%, #0a4f94 100%);
            color: #fff;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            overflow: hidden;
        }
        .container {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 40px;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transform: scale(0.95);
            animation: scaleUp 0.5s ease forwards;
        }
        @keyframes scaleUp {
            from {
                opacity: 0;
                transform: scale(0.9);
            }
            to {
                opacity: 1;
                transform: scale(1);
            }
        }
        h1 {
            font-size: 36px;
            margin-bottom: 10px;
            font-weight: bold;
            color: #0056b3;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.1);
        }
        h2 {
            font-size: 18px;
            color: #333;
            margin-top: 10px;
        }
        form {
            margin-top: 20px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-size: 16px;
            color: #333;
            font-weight: bold;
        }
        input[type="text"],
        input[type="password"],
        input[type="submit"] {
            width: 100%;
            padding: 15px;
            margin-top: 5px;
            border: none;
            border-radius: 30px;
            font-size: 16px;
            box-sizing: border-box;
            background: linear-gradient(135deg, #66aaff 0%, #0056b3 100%);
            color: #fff;
            text-align: center;
            transition: transform 0.2s ease;
        }
        input[type="text"]:focus,
        input[type="password"]:focus {
            transform: scale(1.05);
        }
        input[type="submit"] {
            cursor: pointer;
            transition: transform 0.2s ease;
            font-size: 18px;
            font-weight: bold;
        }
        input[type="submit"]:hover {
            transform: scale(1.05);
        }
        p.error {
            margin-top: 20px;
            font-size: 16px;
            color: #d50000;
        }
        a {
            color: #0056b3;
            text-decoration: none;
            font-weight: bold;
            transition: color 0.3s ease;
        }
        a:hover {
            color: #66aaff;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>REGISTER</h1>
    <h2>Join IBM SkillsBuild Now!</h2>
    <form action="/register" method="post">
        <label for="email">Email:</label><br>
        <input type="text" id="email" name="email" required><br>

        <label for="username">Username:</label><br>
        <input type="text" id="username" name="username" required><br>

        <label for="password">Password:</label><br>
        <input type="password" id="password" name="password" required><br><br>

        <input type="submit" value="Register">
    </form>
    <p class="error">${error}</p>

    <c:if test="${!empty error}">
        <form action="/login" method="get">
            <input type="submit" value="Return to Login Form">
        </form>
    </c:if>

    <a href="/login">Already have an account? Login now!</a>
</div>
</body>
</html>
