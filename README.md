## CO2201 - Group 04

# IBM SkillsBuild Courses Web Application

This repository contains the final version of our **IBM SkillsBuild Courses Web Application**, originally developed as part of the University of Leicester’s CO2201 module.  
The system was built collaboratively by **Group 04**, and this version represents the final combined and fully functional build, merged manually to ensure all team features were included.

It is a full-stack learning platform designed to simulate IBM’s SkillsBuild initiative — enabling users to register, complete and rate courses, track badges, explore analytics, and view personalised recommendations.

Built with **Java Spring Boot**, **JSP (Java Server Pages)**, **HTML/CSS**, and **MySQL**, the system follows a clean MVC structure and showcases group collaboration, backend development, and interface design.

---

## Contents

- Full source code (Java/Spring Boot MVC + JSP front-end)
- `build.gradle` (Gradle build configuration)
- `application.properties` (environment-configured DB and view setup)
- Complete set of controllers, services, repositories, and models
- JSP pages under `WEB-INF/views/`
- This detailed README file

---

## Requirements

| Tool / Component     | Requirement |
|----------------------|-------------|
| **Java**             | JDK 17 or later |
| **Gradle**           | Bundled wrapper OR pre-installed |
| **MySQL Server**     | Local connection with `co2201group04` database |
| **Web Browser**      | Any modern browser (Chrome, Firefox, etc.) |
| **Operating System** | Windows 10+, macOS, or Linux |

---

## Setup Instructions

1. **Download or Clone the Repository**

   Extract the `.zip` file or clone via Git:
   ```bash
   git clone https://github.com/issaa9/IBMSkillsBuildWebapp.git

2. **Open in a Suitable IDE**

   e.g. IntelliJ IDEA, Eclipse, or Spring Tool Suite.

3. **Create the MySQL Database**

   Run the following SQL statement to initialise your database: 
   ```sql
   CREATE DATABASE co2201group04;

4. **Set Environment Variables**

   In your IDE or system environment, define the following variables:
   ```markup
   DB_USER=yourusername
   DB_PASSWORD=yourpassword
   ```

   Default fallback values exist (defaultuser, defaultpass) to prevent errors if none are supplied.

5. **Build and Run**

   Build using Gradle and run the main application class:

   FinalProjectNewApplication

   Once started, the database schema will be automatically created (spring.jpa.hibernate.ddl-auto=create-drop).

6. **Access the Application**

   Visit http://localhost:8080/
   to begin.
---

## Project Details
```
Key Features:

-User registration, authentication, and login (with session handling)
-Course recommendation engine (personalised to user progress)
-Course completion tracking and badge awarding
-Rating system for completed courses
-Analytics dashboard with user and course insights
-Friend search and comparison functionality
-Admin-like features for managing course lists and statistics
-JSP-based dynamic views styled with internal CSS
-Modular architecture with dedicated service, controller, and repository layers


Authentication & Interception:

-Managed through AuthInterceptor and AuthInterceptorConfig to secure protected routes.
-Session-based authentication ensuring restricted page access.


Database Behaviour:

-Automatically creates and drops the schema on each run (for testing/demo purposes).
-Entities include User, Course, CompletedCourse, and Badge with JPA mapping.
```

## File Overview

| Folder / File | Description |
|----------------|-------------|
| `src/` | Java source code including services, repositories, controllers, and JSP templates |
| `resources/` | Contains `application.properties` for database, view, and JPA configuration |
| `webapp/WEB-INF/views/` | JSP pages for all user interfaces |
| `build.gradle` | Gradle project definition and dependencies |
| `.gitignore` | Excludes IDE, build, and environment files from version control |
| `README.md` | Full setup guide and documentation (this file) |


## Environment Variables

| Variable | Purpose | Default | Required | Notes |
|-----------|----------|----------|-----------|--------|
| **DB_USER** | MySQL username | `defaultuser` | ✅ | Used to authenticate the local database connection |
| **DB_PASSWORD** | MySQL password | `defaultpass` | ✅ | Used to authenticate the local database connection |

Sensitive credentials are not stored in the repository.
Default placeholder values are included only to prevent build errors.


## Security and Data Handling Notes

All database credentials are defined via environment variables for safe execution.

Database runs locally and is not connected to any remote or production system.

JPA is configured to use create-drop, ensuring no persistent data between runs.

Session management prevents unauthorised access to protected pages.

No real personal data or third-party credentials are stored or required.


## Known Limitations

Application is configured for local testing only and requires MySQL running locally.

Database resets each time the application restarts due to create-drop (demo mode).

UI design follows academic project requirements — not production-optimised.

No unit or integration test framework implemented due to project scope.

Mobile responsiveness limited; optimised for desktop browsers.

Git commit history unavailable (see note below).


## Project Notes on Git History

Due to persistent Git issues during development, the group manually compiled this final unified version by merging all members’ contributions and fixing conflicts outside of Git.
As a result, this repository contains only the final complete version without prior commit history.

This version represents the definitive, complete build of the IBM SkillsBuild Courses Webapp.

## Folder Structure

```
IBMSkillsBuildWebapp/
│
├── src/
│   └── main/
│       ├── java/com/example/finalproject_new/
│       │   ├── FinalProjectNewApplication.java
│       │   ├── config/ (AuthInterceptor, AuthInterceptorConfig)
│       │   ├── controller/ (Main, Friend, Recommended, Analytics, Auth, CourseRating)
│       │   ├── model/ (User, Course, CompletedCourse, Badge)
│       │   ├── repo/ (UserRepository, CourseRepository, CompletedCourseRepository)
│       │   └── service/ (UserService, BadgeService)
│       ├── resources/application.properties
│       └── webapp/WEB-INF/views/
│           ├── start.jsp
│           ├── login.jsp
│           ├── register.jsp
│           ├── dashboard.jsp
│           ├── analytics.jsp
│           ├── Recommended.jsp
│           ├── ratings.jsp
│           ├── searchFriend.jsp
│           ├── searchResult.jsp
│           └── header.jsp
│
├── build.gradle
├── settings.gradle
├── gradlew / gradlew.bat / gradle/
├── .gitignore
└── README.md
```

## Project Timeline Context

| Deliverable | Project Stage | Description |
|--------------|---------------|-------------|
| **Initial Prototype** | Early Semester | Developed with basic authentication and course listing features |
| **Intermediate Sprint** | Mid-Development | Added friend search, recommendations, badges, and analytics modules |
| **Final Version (This)** | End of Project | Fully integrated, debugged, and feature-complete group submission |

This final version demonstrates teamwork, software design principles, and application of Spring MVC, JPA, and Gradle build automation.

## Contact 

**README Author:** *Issa Aboobaker*
Email: issasecond@outlook.com
LinkedIn: linkedin.com/in/issa-aboobaker
Institution: *University of Leicester (Graduate, 2025)*

This README was written and compiled personally by Issa Aboobaker to provide complete setup and documentation for the **IBM SkillsBuild Courses Webapp** final project and for the purpose of uploading to a personal GitHub repository.