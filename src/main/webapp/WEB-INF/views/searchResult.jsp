<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>SEARCH RESULT</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
        }

        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #0056b3;
            margin-bottom: 20px;
            font-size: 32px;
        }

        p {
            color: #333;
            font-size: 18px;
            line-height: 1.6;
            margin-bottom: 20px;
            text-align: center;
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
        }

        .back-link a {
            color: #0056b3;
            text-decoration: none;
            transition: color 0.3s;
        }

        .back-link a:hover {
            color: #003366;
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
</head>
<body>
<%@ include file="header.jsp" %>

<div class="container">
    <h1>Search Result</h1>
    <p>${message}</p>
    <div class="back-link">
        <a href="/">Back to Home</a>
    </div>
</div>

<footer>
    <p id="copyright">&copy; 2024 IBM SkillsBuild web app</p>
</footer>

</body>
</html>
