package com.example.finalproject_new.repo;


import com.example.finalproject_new.model.CompletedCourse;
import com.example.finalproject_new.model.Course;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface CompletedCourseRepository extends CrudRepository<CompletedCourse, Long> {
    @Query("SELECT cc.course FROM CompletedCourse cc WHERE cc.status = 'recommended' and cc.user.userId = :userId")
    List<Course> findRecommendedCoursesByUserId(@Param("userId") Long userId);
    @Query("SELECT cc.course FROM CompletedCourse cc WHERE cc.status = 'chosen' and cc.user.userId = :userId")
    List<Course> findChosenCoursesByUserId(@Param("userId") Long userId);
    @Query("SELECT cc.course FROM CompletedCourse cc WHERE cc.status = 'available' and cc.user.userId = :userId")
    List<Course> findAvailableCoursesByUserId(@Param("userId") Long userId);
    @Query("SELECT cc FROM CompletedCourse cc WHERE cc.status = 'started' and cc.user.userId = :userId")
    List<CompletedCourse> findStartedCoursesByUserId(@Param("userId") Long userId);
    @Query("SELECT cc FROM CompletedCourse cc WHERE cc.status = 'completed' and cc.user.userId = :userId")
    List<CompletedCourse> findCompletedCoursesByUserId(@Param("userId") Long userId);

    @Query("SELECT cc FROM CompletedCourse cc WHERE cc.course.id = :courseId and cc.user.userId = :userId")
    Optional<CompletedCourse> findCourseByUserId(@Param("courseId") Long courseId, @Param("userId") Long userId);


}