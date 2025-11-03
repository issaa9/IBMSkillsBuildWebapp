<!-- courseUrlsView.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Recommended Courses</title>
</head>
<body>

<h1>Recommended Courses</h1>

<c:if test="${not empty courseUrls}">
    <ul>
        <c:forEach var="url" items="${courseUrls}">
            <li><a href="${url}" target="_blank">${url}</a></li>
        </c:forEach>
    </ul>
</c:if>

<c:if test="${empty courseUrls}">
    <p>No course URLs found.</p>
</c:if>

</body>
</html>
