<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search User</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #c1f0fa;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            color: #0056b3;
            text-align: center;
            margin-bottom: 20px;
        }

        form {
            text-align: center;
        }

        label {
            display: block;
            margin-bottom: 10px;
            color: #333;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            margin-bottom: 20px;
        }

        input[type="submit"] {
            background-color: #0056b3;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #003366;
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
<h1>Search User</h1>
<form action="/SF" method="post">
    Enter Username: <label>
    <input type="text" name="username">
</label>
    <input type="submit" value="Search">
</form>
</div>

<footer>
    <p id="copyright">&copy; 2024 IBM SkillsBuild web app</p>
</footer>
</body>
</html>