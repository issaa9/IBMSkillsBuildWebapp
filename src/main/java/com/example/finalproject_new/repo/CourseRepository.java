package com.example.finalproject_new.repo;


import com.example.finalproject_new.model.Course;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface CourseRepository extends CrudRepository<Course, Long> {

    @Query("SELECT c FROM Course c WHERE c.id = :courseId")
    Optional<Course> getCourseByCourseId(@Param("courseId") Long courseId);
    @Query("SELECT c.topic FROM Course c WHERE c.id = :courseId")
    String findTopicByCourseId(@Param("courseId") Long courseId);

    @Query("SELECT c.url FROM Course c WHERE c.topic = :topic")
    List<String> findUrlsByTopic(@Param("topic") String topic);
    @Query("SELECT c.id as id, c.title as title," +
            "(SELECT COUNT(*) FROM CompletedCourse cc WHERE cc.course.id = c.id AND cc.status = 'chosen') as chosen, " +
            "(SELECT COUNT(*) FROM CompletedCourse cc WHERE cc.course.id = c.id AND cc.status = 'started') as started," +
            "(SELECT COUNT(*) FROM CompletedCourse cc WHERE cc.course.id = c.id AND cc.status = 'completed') as completed FROM Course c GROUP BY c.id")
    List<List> getCourseStats();
    @Query ("SELECT c FROM Course c")
    List<Course> getCourses();
}
