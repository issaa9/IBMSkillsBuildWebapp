<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <style>
    
    body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f3f5f8;
            color: #333;
        }
    
    
    
    
    
    
    
        div.AC {
            width: 400px;
            height: 400px;
            padding: 10px;
            border: 2px solid black;
            margin: 5px;
            overflow: auto;
            text-align: justify;
            display: inline-block;
        }

        div.CC {
            width: 400px;
            height: 400px;
            padding: 10px;
            border: 2px solid black;
            margin: 5px;
            overflow: auto;
            text-align: justify;
            display: inline-block;
        }

        .RC, .CT {
            width: 400px;
            height: 400px;
            padding: 10px;
            border: 2px solid black;
            margin: 5px;
            overflow: auto;
            text-align: justify;
            display: inline-block;
        }

        .button {
            border: none;
            color: white;
            padding: 8px 16px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 10px;
            margin: 4px 2px;
            transition-duration: 0.4s;
            cursor: pointer;
        }

        .button.available {
            background-color: dimgray;
            color: white;
            border: 2px solid #696969FF;
        }

        .button.available:hover {
            background-color: #0470AAFF;
            color: white;
        }

        ul {
            list-style-type: none;
            padding: 0;
        }

        li {
            display: flex;
            justify-content: space-between;
            align-items: flex-end;
            margin-bottom: 10px;
        }

        button {
            margin-left: 10px;
        }

        .progress {
            position: relative;
            margin-top: 20px; /* Adjust this value as needed */
            text-align: center;
        }

        .back-bar {
            height: 20px;
            overflow: hidden;
            background-color: #D3D3D3;
            border-radius: 4px;
            margin: auto;
            width: 90%;
        }

        .fill-bar {
            background-color: #98FF98;
            transition: width 0.6s ease;
            height: 100%;
            position: relative;
        }

        .percentage-text {
            position: absolute;
            top: 50%;
            left: calc(50% + 25px);
            transform: translate(-50%, -50%);
            color: black;
            font-weight: bold;
        }
    </style>
    <title>Dashboard</title>
</head>
<body>
    <%@ include file="header.jsp" %>
    <h1>IBM SkillsBuild Learning Dashboard</h1>

    <div class="progress">
        <p style="font-size: 25px"><b>Overall Course Progress</b></p>

        <div class="back-bar">
            <div id="percentagediv" class="fill-bar" role="progress" style="width: ${percentage}%;">
                <span id="percentagespan" class="percentage-text">${percentage}%</span>
            </div>
        </div>
    </div>

<main>
    <div class="AC">
        <section class="Available courses">
            <h2>Available courses:</h2>
            <h3> <a href="/courseRating">See course Reviews</a>  </h3>
            <ol id="availableList">
                <c:forEach var="course" items="${availableCourses}">
                    <li id="course-${course.id}" data-url="${course.url}" data-title="${course.title}"><a
                            href="${course.url}" target="_blank">${course.title}</a>
                        <button class="button available" onclick="courseAction(this, 'chosen')">Choose</button>
                    </li>
                </c:forEach>
            </ol>
        </section>
    </div>
    <div class="RC">
        <h2>Recommended Courses:</h2>
        <c:if test="${!empty recommendedCourses}">
            <ol id="recommendedList">
                <c:forEach var="course" items="${recommendedCourses}">
                    <li id="course-${course.id}" data-url="${course.url}" data-title="${course.title}"><a
                            href="${course.url}" target="_blank">${course.title}</a>
                        <button class="button available" onclick="courseAction(this, 'chosen')">Choose</button>
                    </li>
                </c:forEach>
            </ol>
        </c:if>

        <c:if test="${empty recommendedCourses}">
            <p>No course URLs found.</p>
        </c:if>
    </div>

    <div class="CC">
        <section class="Chosen courses">
            <h2>Chosen courses:</h2>
            <ol id="chosenList">
                <c:forEach var="course" items="${chosenCourses}">
                    <li id="course-${course.id}" data-url="${course.url}" data-title="${course.title}"><a
                            href="${course.url}" target="_blank">${course.title}</a>
                        <button class="button available" onclick="courseAction(this, 'started')">Start</button>
                        <button class="button available" onclick="courseAction(this, 'available')">Delete</button>
                    </li>
                </c:forEach>
            </ol>
        </section>
    </div>


    <div class="CT">
        <h2>Current Courses:</h2>
        <ol id="currentList">
            <c:forEach var="cc" items="${startedCourses}">
                <li id="course-${cc.course.id}" data-url="${course.url}" data-title="${course.title}"><a
                        href="${cc.course.url}" target="_blank">${cc.course.title}</a>
                    <button class="button available" onclick="courseAction(this, 'completed')">Complete</button>
                    <button class="button available" onclick="courseAction(this, 'available')">Cancel</button>
                </li>
            </c:forEach>

        </ol>

    </div>
    <div class="CT">
        <h2>Completed Courses:</h2>
        <h3> <a href="/courseRating">Review completed courses</a> </h3>
        <ol id="completedList">
            <c:forEach var="cc" items="${completedCourses}">
                <li id="course-${cc.course.id}" data-url="${cc.course.url}" data-title="${cc.course.title}"><a
                        href="${cc.course.url}" target="_blank">${cc.course.title}</a>
                    <button class="button available" onclick="courseAction(this, 'available')">Reset</button>
                    <button class="button available" onclick="courseAction(this, 'started')">Continue</button>
                </li>
            </c:forEach>


        </ol>

    </div>


</main>

<script>
    function courseAction(button, action) {
        var listItem = button.parentElement;
	    var courseId = listItem.id.split("-")[1];
        var url = listItem.dataset.url;
        var title = listItem.dataset.title;
        console.log("User clicked " + button.textContent + " on " + listItem.id + " listitem");

        fetch('/courseAction/' + encodeURIComponent(courseId) + '/' + action, {
            method: 'POST'
        }).then(response => {
            if (response.ok) {
                response.text().then(text => {
                    if (text.startsWith("percent:")) {
                        var percent = text.split(":")[1];
                        document.getElementById("percentagespan").innerHTML = percent + "%";
                        document.getElementById("percentagediv").style.width = percent + "%";
                    }
                })
                var newListItem = listItem.cloneNode(true);
                newListItem.querySelectorAll('.button').forEach(b => {
                    b.remove();
                })
                if (action == "chosen") {
                    awardBadge(courseId);
                    var startButton = document.createElement("button");
                    startButton.textContent = "Start";
                    startButton.classList.add("button", "available");
                    startButton.onclick = function () {
                        courseAction(startButton, "started")
                    };
                    newListItem.appendChild(startButton);

                    var deleteButton = document.createElement("button");
                    deleteButton.textContent = "Delete";
                    deleteButton.classList.add("button", "available");
                    deleteButton.onclick = function () {
                        courseAction(deleteButton, "available")
                    };
                    newListItem.appendChild(deleteButton);

                    document.getElementById("chosenList").appendChild(newListItem);
                } else if (action == "started") {

                    var completeButton = document.createElement("button");
                    completeButton.textContent = "Complete";
                    completeButton.classList.add("button", "available");
                    completeButton.onclick = function () {
                        courseAction(completeButton, "completed")
                    };
                    newListItem.appendChild(completeButton);
                    var cancelButton = document.createElement("button");
                    cancelButton.textContent = "Cancel";
                    cancelButton.classList.add("button", "available");
                    cancelButton.onclick = function () {
                        courseAction(cancelButton, "available")
                    };
                    newListItem.appendChild(cancelButton);

                    document.getElementById("currentList").appendChild(newListItem);

                } else if (action == "completed") {
                    var resetButton = document.createElement("button");
                    resetButton.textContent = "Reset";
                    resetButton.classList.add("button", "available");
                    resetButton.onclick = function () {
                        courseAction(resetButton, "available")
                    };
                    newListItem.appendChild(resetButton);
                    var continueButton = document.createElement("button");
                    continueButton.textContent = "Continue";
                    continueButton.classList.add("button", "available");
                    continueButton.onclick = function () {
                        courseAction(continueButton, "started")
                    };
                    newListItem.appendChild(continueButton);
                    document.getElementById("completedList").appendChild(newListItem);

                } else if (action == "available") {
                    var chooseButton = document.createElement("button");
                    chooseButton.textContent = "Choose";
                    chooseButton.classList.add("button", "available");
                    chooseButton.onclick = function () {
                        courseAction(chooseButton, "chosen")
                    };
                    newListItem.appendChild(chooseButton);
                    document.getElementById("availableList").appendChild(newListItem);

                }
                listItem.remove();
            } else {
                alert("Database error");
                console.log(response);
            }
        });

        function awardBadge(courseId) {
            fetch('/awardBadge/chooseCourse/' + encodeURIComponent(courseId), {
                method: 'POST'
            }).then(response => {
                if (response.ok) {
                    // Optionally update the UI to show the newly awarded badge
                    // This might involve adding a badge icon or notification to the dashboard
                    console.log('Badge awarded successfully');
                } else {
                    console.error('Failed to award badge for choosing a course.');
                }
            });

        }
    }
</script>

<footer>
    <p>&copy; 2024 IBM SkillsBuild web app</p>
</footer>
</body>
</html>