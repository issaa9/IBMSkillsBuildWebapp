<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <style>

        body {
            background-color: #f0f0f0;
            margin: 0;
            font-family: Arial, sans-serif;
        }

        .topnav {
            overflow: hidden;
            background-color: #00468b;
            padding: 10px;
            font-weight: bold;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Add shadow for depth */
        }

        .topnav a {
            float: left;
            color: #fff; /* Change text color to white for better contrast */
            text-align: center;
            padding: 14px 20px;
            text-decoration: none;
            font-size: 20px;
            transition: background-color 0.3s; /* Smooth transition for hover effect */
            margin: 0 35px; /* Add gap between links */
            border-radius: 10px;
        }

        .topnav a:hover {
            background-color: #0056b3; /*Change background color on hover to a lighter blue */
            color: #fff;
        }

        .topnav a.active {
            background-color: rgba(127, 160, 255, 0.83);
            color: #fff;
        }

    </style>

    <script>
        // JavaScript to set and remove the "active" class based on the current page URL
        document.addEventListener("DOMContentLoaded", function() {
            var currentUrl = window.location.pathname;

            /// Find the link with the "active" class and remove it
            var activeLink = document.querySelector('.topnav a.active');
            if (activeLink) {
                activeLink.classList.remove('active');
            }

            // Add "active" class to the matching navigation link
            var navLinks = document.querySelectorAll('.topnav a');
            navLinks.forEach(function(link) {
                var linkHref = link.getAttribute('href');
                if (currentUrl.includes(linkHref)) {
                    link.classList.add('active');
                }
            });
        });
    </script>

    <meta charset="UTF-8">
    <title>HomePage</title>
</head>
<body>

<div class="topnav">
    <a href="/"> Home</a>
    <a href="/RC">Dashboard</a>
    <a href="/SF">Add Friends</a>
    <c:if test="${user.getAdmin()}">
        <a href="/admin/analytics">Analytics</a>
    </c:if>
    <c:if test="${loggedin}">
        <a href="/logout">Log Out from ${user.username}</a>
    </c:if>
    <c:if test="${not loggedin}">
        <a href="/login">Log In</a>
    </c:if>
</div>


</body>
</html>