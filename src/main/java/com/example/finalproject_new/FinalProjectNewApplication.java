package com.example.finalproject_new;

import com.example.finalproject_new.model.CompletedCourse;
import com.example.finalproject_new.model.Course;
import com.example.finalproject_new.model.User;
import com.example.finalproject_new.repo.CompletedCourseRepository;
import com.example.finalproject_new.repo.CourseRepository;
import com.example.finalproject_new.repo.UserRepository;
import com.example.finalproject_new.controller.AuthController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.util.ArrayList;
import java.util.Optional;

@SpringBootApplication
public class FinalProjectNewApplication implements CommandLineRunner {

	public static void main(String[] args) {
		SpringApplication.run(FinalProjectNewApplication.class, args);
	}

	@Autowired
	private CourseRepository courseRepo;

	@Autowired
	private UserRepository userRepo;

	@Autowired
	private CompletedCourseRepository completedCourseRepo;

	@Override
	public void run(String... args) throws Exception {

		Course course1 = new Course();
		course1.setId(1L);
		course1.setTitle("Artificial Intelligence Fundamentals");
		course1.setDescription("AI Basics");
		course1.setTopic("Artificial Intelligence");
		course1.setUrl("https://keyskill-clms.comprehend.ibm.com/course/view.php?id=569");

		Course course2 = new Course();
		course2.setId(2L);
		course2.setTitle("Data Fundamentals");
		course2.setDescription("Data Science Basics");
		course2.setTopic("Data Science");
		course2.setUrl("https://keyskill-clms.comprehend.ibm.com/course/view.php?id=544");

		Course course3 = new Course();
		course3.setId(3L);
		course3.setTitle("Cloud Computing Fundamentals");
		course3.setDescription("Cloud Basics");
		course3.setTopic("IBM Cloud");
		course3.setUrl("https://keyskill-clms.comprehend.ibm.com/course/view.php?id=576");

		Course course4 = new Course();
		course4.setId(4L);
		course4.setTitle("Getting Started with Enterprise-grade AI");
		course4.setDescription("Getting Started...");
		course4.setTopic("Artificial Intelligence");
		course4.setUrl("https://keyskill-clms.comprehend.ibm.com/course/view.php?id=236");

		Course course5 = new Course();
		course5.setId(5L);
		course5.setTitle("Fundamentals of Sustainability and Technology");
		course5.setDescription("More Fundamentals");
		course5.setTopic("Artificial Intelligence");
		course5.setUrl("https://keyskill-clms.comprehend.ibm.com/course/view.php?id=551");

		Course course6 = new Course();
		course6.setId(6L);
		course6.setTitle("Building Trustworthy AI Enterprise Solutions");
		course6.setDescription("Building");
		course6.setTopic("Artificial Intelligence");
		course6.setUrl("https://keyskill-clms.comprehend.ibm.com/course/view.php?id=387");

		Course c1 = courseRepo.save(course1);
		Course c2 = courseRepo.save(course2);
		Course c3 = courseRepo.save(course3);
		Course c4 = courseRepo.save(course4);
		Course c5 = courseRepo.save(course5);
		Course c6 = courseRepo.save(course6);



		User u1 = new User();
		u1.setId(1L);
		u1.setUsername("user1");
		u1.setEmail("user1@email.com");
		u1.setHashedPassword(AuthController.hashPassword("User1"));
		u1.setAdmin(false);

		User u2 = new User();
		u2.setId(2L);
		u2.setUsername("user2");
		u2.setEmail("user2@email.com");
		u2.setHashedPassword(AuthController.hashPassword("User2"));
		u2.setAdmin(false);

		User u3 = new User();
		u3.setId(3L);
		u3.setUsername("user3");
		u3.setEmail("user3@email.com");
		u3.setHashedPassword(AuthController.hashPassword("User3"));
		u3.setAdmin(false);

		User u4 = new User();
		u4.setId(4L);
		u4.setUsername("admin1");
		u4.setEmail("admin1@email.com");
		u4.setHashedPassword(AuthController.hashPassword("Admin1"));
		u4.setAdmin(true);

		u1 = userRepo.save(u1);
		u2 = userRepo.save(u2);
		u3 = userRepo.save(u3);
		u4 = userRepo.save(u4);

		ArrayList<User> users = new ArrayList<>();

		users.add(u1);
		users.add(u2);
		users.add(u3);
		users.add(u4);

        for (User user : users) {
			for (long i = 1L; i <= 6L; i++) {
				Optional<Course> course = courseRepo.getCourseByCourseId(i);
				if (course.isPresent()) {
					CompletedCourse cc = new CompletedCourse();
					cc.setUser(user);
					cc.setCourse(course.get());
					if (i <= 3) {
						cc.setStatus("recommended");
					} else {
						cc.setStatus("available");
					}
					cc = completedCourseRepo.save(cc);
				}
			}
        }


        System.out.println("Database initialized!");



	}


}
