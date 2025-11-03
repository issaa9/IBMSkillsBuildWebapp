<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            background: linear-gradient(135deg, #f3f5f8 0%, #368bea 100%);
            color: #333;
            font-family: "Arial", sans-serif;
            margin: 0;
            padding: 0;
        }



        h1 {
            font-size: 36px;
            margin-bottom: 20px;
            font-weight: bold;
            color: #0056b3;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.1);
        }

        h2 {
            font-size: 24px;
            color: #0056b3;
            margin-top: 20px;
        }

        p {
            font-size: 16px;
            color: #333;
            margin-top: 10px;
        }

        footer {
            background-color: #0470AA;
            color: white;
            text-align: center;
            padding: 20px;
            width: 100%;
            position: fixed;
            bottom: 0;
            border-top-left-radius: 20px;
            border-top-right-radius: 20px;
            box-shadow: 0 -2px 5px rgba(0, 0, 0, 0.2);
        }

        footer p {
            margin: 0;
        }

        .navbar {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 10px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            margin: 20px;
        }

        .navbar a {
            margin: 0 10px;
            text-decoration: none;
            color: #0056b3;
        }

        .navbar a:hover {
            color: #003366;
        }
    </style>
    <title>Analytics</title>
</head>
<body>
<%@ include file="header.jsp" %>
<h1>IBM SkillsBuild Learning Analytics Page</h1>

<h2>Current overall statistics:</h2>
<c:forEach var="course" items="${courseStats}">
    <p>Course: <b>${course[1]}</b> has been chosen by ${course[2]} students, ${course[3]} are currently taking it and ${course[4]} have finished it</p>
</c:forEach>
<p>Refreshes every 10 seconds</p><script>setTimeout(() => { window.location.reload(); }, 10000);</script>
<footer>
    <p id="copyright">&copy; 2024 IBM SkillsBuild web app</p>
</footer>
</body>

</html>