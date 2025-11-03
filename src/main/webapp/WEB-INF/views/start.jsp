
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>IBM Skills Build </title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #c1f0fa;
            color: #011e42;
            overflow-x: hidden; /* Prevent horizontal scrollbar */
        }

        header {
            background-color: #0470AA;
            color: white;
            padding: 20px;
            text-align: center;
            border-bottom-left-radius: 20px;
            border-bottom-right-radius: 20px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        }

        h1 {
            font-size: 48px;
            margin-bottom: 20px;
            text-transform: uppercase;
            text-align: center;
            margin-top: 0; /* Remove top margin */
        }

        h2 {
            font-size: 24px;
            color: #0056b3;
            text-transform: uppercase;
            margin-bottom: 10px;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
        }

        .main-content {
            width: 60%;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.8);
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .friends-list {
            width: 35%; /* Adjust friends list width */
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.8);
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
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

    </style>
    <meta charset="UTF-8">
    <title>HomePage</title>
</head>
<body>

<%@ include file="header.jsp" %>



<div class="container">
    <h1 style="font-size: 48px; text-align: center; text-transform: uppercase;">IBM SKILLS BUILD APPS</h1>
    <div class="friends-list" style="height: 600px; width: 300px; background-color: #fff; border-radius: 10px; box-shadow: 0 0 20px rgba(0, 0, 0, 0.1); margin-left: auto;">
        <h2 style="text-align: center;">My Friends</h2>
        <ol id="friendsList">
            <c:forEach var="friend" items="${user.friends}">
                <li>${friend.username}</li>
            </c:forEach>
        </ol>
    </div>
</div>

<div class="test">
    <h2 style="text-align: center;">"Daily streak: "${streakData}</h2>
</div>


<footer>
    <p id="copyright">&copy; 2024 IBM SkillsBuild web app</p>
</footer>
</body>


</html>

