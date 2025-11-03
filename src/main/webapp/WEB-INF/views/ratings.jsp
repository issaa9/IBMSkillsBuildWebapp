<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Review Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }



        h1 {
            color: #6C63FF;
            text-align: center;
            margin-bottom: 20px;
            font-size: 36px;
        }

        form {
            text-align: center;
        }

        label {
            font-size: 20px;
            color: #333;
            margin-right: 10px;
        }

        input[type="text"],
        textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 2px solid #6C63FF;
            border-radius: 5px;
            font-size: 16px;
            box-sizing: border-box;
            transition: border-color 0.3s;
        }

        input[type="text"]:focus,
        textarea:focus {
            border-color: #5246CA;
            outline: none;
        }

        input[type="submit"] {
            background-color: #6C63FF;
            color: #fff;
            border: none;
            padding: 10px 20px;
            font-size: 18px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #5246CA;
        }


        .back-link a {
            color: #6C63FF;
            text-decoration: none;
            font-weight: bold;
            transition: color 0.3s;
        }

        .back-link a:hover {
            color: #5246CA;
        }

        .comment {
            background-color: #fff;
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 10px;
            margin-bottom: 10px;
        }
    </style>
    <title>Ratings</title>
</head>
<body>
<%@ include file="header.jsp" %>

<h2>Complete Rating for your completed course</h2>

    <div id="rating-form">
        <select id="dropdown-list">
            <c:forEach var="cc" items="${completedCourses}">
                <option value="${cc.course.url}" data-title="${cc.course.title}">${cc.course.title}</option>

            </c:forEach>
        </select>
        <input type="number" id="rating" min="1" max="5" placeholder="Rating (1-5)">
        <button onclick="submitRating()">Submit</button>

    </div>

    <div id="comments-form">
        <h4>Write a small comment about your experience</h4>
        <select id="comment-list">
            <c:forEach var="cc" items="${completedCourses}">
                <option value="${cc.course.url}" data-title="${cc.course.title}">${cc.course.title}</option>

            </c:forEach>
        </select>
        <textarea name="paragraph_text" id="paragraph_text" cols="50" rows="5" placeholder="Write a long comment"></textarea>
        <input type="text" id="comments" placeholder="Write a short comment">
        <button onclick="submitComments()">Submit</button>

    </div>

    <div id="showRatings">

    </div>

    <div id="showComments">

    </div>

    <div id="stored-Reviews">
        <h3>Stored Comments and Ratings</h3>
        <select id="oldList1">
            <c:forEach var="course" items="${availableCourses}">
                <option value="${course.url}" data-title="${course.title}">${course.title}</option>
            </c:forEach>
        </select>
        <button onclick="submitStored()">Submit</button>
        <div id="pastRatings"></div>
        <div id="pastComments"></div>
    </div>

<script>
    const linksRatings = {
        "https://keyskill-clms.comprehend.ibm.com/course/view.php?id=569": [4,3,5,4,4,1],
        "https://keyskill-clms.comprehend.ibm.com/course/view.php?id=236": [2,4,3,3,5,5],
        "https://keyskill-clms.comprehend.ibm.com/course/view.php?id=551": [3,4,3,3,2,5],
        "https://keyskill-clms.comprehend.ibm.com/course/view.php?id=544": [2,3,5,2,1,2],
        "https://keyskill-clms.comprehend.ibm.com/course/view.php?id=576": [3,4,5,3,7,2],
        "https://keyskill-clms.comprehend.ibm.com/course/view.php?id=387": [2,3,4,1,2,4]
    };

    const courseComments = {
        "https://keyskill-clms.comprehend.ibm.com/course/view.php?id=569": ["nice","great","excellent"],
        "https://keyskill-clms.comprehend.ibm.com/course/view.php?id=236": ["superb","learnt a lot","too much long"],
        "https://keyskill-clms.comprehend.ibm.com/course/view.php?id=551": ["would recommend","amazing","super"],
        "https://keyskill-clms.comprehend.ibm.com/course/view.php?id=544": ["needs improvement","never again","very difficult"],
        "https://keyskill-clms.comprehend.ibm.com/course/view.php?id=576": ["perfect","incredible","eye-opening"],
        "https://keyskill-clms.comprehend.ibm.com/course/view.php?id=387": ["okay","not bad","meet standards"]
    }

    function sampleDropdown() {
        const dropdown = document.getElementById("links-dropdown");
        for (const link in linksRatings) {
            const option = document.createElement("option");
            option.value = link;
            option.textContent = link;
            dropdown.appendChild(option);
        }
    }

    function sampleComments(){
        const commentDropdown = document.getElementById("comment-list");

        for (const commentLink in courseComments){
            const commentOption = document.createElement("option")
            commentOption.value = commentLink;
            commentOption.textContent = commentLink;

            commentDropdown.appendChild(commentOption)
        }
    }

    function displayRatings(link,linkName) {
        const ratingsDisplay = document.getElementById("showRatings");
        ratingsDisplay.innerHTML = "<h3>Ratings for " + linkName + "</h3>";
        const ratings = linksRatings[link];
        if (ratings && ratings.length > 0) {
            const avgRating = ratings.reduce((a, b) => a + b, 0) / ratings.length;
            ratingsDisplay.innerHTML += "<p>Average Rating: " + avgRating.toFixed(1) + "</p>";
            ratingsDisplay.innerHTML += "<ul>";
            ratings.forEach(rating => {
                ratingsDisplay.innerHTML += "<li>" + rating + "</li>";
            });
            ratingsDisplay.innerHTML += "</ul>";
        } else {
            ratingsDisplay.innerHTML += "<p>No ratings available.</p>";
        }
    }

    function displayComments(link,linkName){
        const commentsDisplay = document.getElementById("showComments");
        commentsDisplay.innerHTML = "<h3>Comments for " + linkName + "</h3>";
        const comments1 = courseComments[link];

        commentsDisplay.innerHTML += "<ul>";
        comments1.forEach(comment =>{
            commentsDisplay.innerHTML += "<li>" + comment + "</li>";
        });

        commentsDisplay.innerHTML += "</ul>"
    }

    function submitRating() {
        const dropdown = document.getElementById("dropdown-list");
        const selectedOption = dropdown.options[dropdown.selectedIndex];
        const selectedLink = selectedOption.value;
        const urlName = selectedOption.dataset.title;
        const rating = parseInt(document.getElementById("rating").value);


        if (selectedLink && !isNaN(rating) && rating >= 1 && rating <= 5) {
            if (!linksRatings[selectedLink]) {
                linksRatings[selectedLink] = [];
            }
            linksRatings[selectedLink].push(rating);
            displayRatings(selectedLink,urlName);
        } else {
            alert("Please select a link and provide a valid rating (1-5).");
        }
    }

    function submitComments(){
        var selectedCourseUrl = document.getElementById("comment-list").value;
        var selectedCourseTitle = document.getElementById("comment-list").options[document.getElementById("comment-list").selectedIndex].getAttribute("data-title");

        if (!selectedCourseUrl) {
            alert("Please select a course before submitting comments.");
            return;
        }

        var paragraphText = document.getElementById("paragraph_text").value;
        var shortComment = document.getElementById("comments").value;

        var combinedComment = "Course URL: " + selectedCourseUrl + "\n"
            + "Course Title: " + selectedCourseTitle + "\n";

        if (paragraphText.trim() !== '' && shortComment.trim() !== '') {
            combinedComment += "Long Comment: " + paragraphText + "\n" +
                "Short Comment: " + shortComment;
        } else if (paragraphText.trim() !== '') {
            combinedComment += "Long Comment: " + paragraphText;
        } else if (shortComment.trim() !== '') {
            combinedComment += "Short Comment: " + shortComment;
        } else {
            alert("Please provide at least one comment before submitting.");
            return;
        }

        if (!courseComments[selectedCourseUrl]) {
            courseComments[selectedCourseUrl] = [];
        }
        courseComments[selectedCourseUrl].push(combinedComment);

        displayComments(selectedCourseUrl, selectedCourseTitle);
    }

    function checkAndDisplayStoredData() {
        const dropdownList = document.getElementById("dropdown-list");
        const commentList = document.getElementById("comment-list");
        const storedDataDiv = document.getElementById("stored-Reviews");

        if (dropdownList.length === 0 && commentList.length === 0) {
            storedDataDiv.style.display = "block";
            displayStoredRatings();
            displayStoredComments();
        } else {
            storedDataDiv.style.display = "none";
        }
    }

    function submitStored(){
        const selectedCourseUrl = document.getElementById("oldList1").value;
        const selectedCourseTitle = document.getElementById("oldList1").options[document.getElementById("oldList1").selectedIndex].getAttribute("data-title");

        displayStoredRatings(selectedCourseUrl, selectedCourseTitle);
        displayStoredComments(selectedCourseUrl, selectedCourseTitle);
    }

    function displayStoredRatings(link,title) {
        const storedRatingsDiv = document.getElementById("pastRatings");
        storedRatingsDiv.innerHTML = "<h4>Ratings for " + title + "</h4>";

        const ratings = linksRatings[link];
        if (ratings && ratings.length > 0) {
            const avgRating = ratings.reduce((a, b) => a + b, 0) / ratings.length;
            storedRatingsDiv.innerHTML += "<p>Average Rating: " + avgRating.toFixed(1) + "</p>";
            storedRatingsDiv.innerHTML += "<ul>";
            ratings.forEach(rating => {
                storedRatingsDiv.innerHTML += "<li>" + rating + "</li>";
            });
            storedRatingsDiv.innerHTML += "</ul>";
        } else {
            storedRatingsDiv.innerHTML += "<p>No ratings available.</p>";
        }
    }

    function displayStoredComments(link,title) {
        const storedCommentsDiv = document.getElementById("pastComments");
        storedCommentsDiv.innerHTML = "<h4>Comments for " + title + "</h4>";

        const comments1 = courseComments[link];

        storedCommentsDiv.innerHTML += "<ul>";
        comments1.forEach(comment =>{
            storedCommentsDiv.innerHTML += "<li>" + comment + "</li>";
        });

        storedCommentsDiv.innerHTML += "</ul>"
    }




    window.onload = function() {
        sampleDropdown();
        sampleComments();
        checkAndDisplayStoredData();
    };

</script>


</body>
</html>