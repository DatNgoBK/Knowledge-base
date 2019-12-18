
package admincontroller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dao.CourseDAO;
import dao.GradeDAO;
import dao.UserDAO;
import filters.CreditFilter;
import filters.GradeFilter;
import filters.LevelFilter;
import filters.PreferenceFilter;
import filters.PrereqFilter;
import filters.SemesterFilter;
import main.StudentRecord;
import model.Course;
import model.Grade;
import model.User;

@Controller
public class ResultController {
	@RequestMapping("result")
	public String computeScore(HttpServletRequest request, @RequestParam("selSemester") String semester,
			@RequestParam("keywords") String[] keywords, @RequestParam("txtCredits") int suggestedCredit) throws ClassNotFoundException, SQLException {
		ArrayList<Grade> result = new ArrayList<>();
		int credit = 0;
		User user = (User) request.getSession().getAttribute("student");
		ArrayList<Grade> grades = (ArrayList<Grade>) request.getSession().getAttribute("grades");
		ArrayList<Course> courses = CourseDAO.getAllCourse();
        for (Course course : courses) {
            double score = 4.0f;
            score = new PrereqFilter().processScore(grades, course, score);
            score = new SemesterFilter().processScore(course, score, semester);
            score = new GradeFilter().processScore(user.getCPA(), course, score);
            score = new LevelFilter().processScore(course,score,grades,user.getSpecialization());
            score = new CreditFilter().processScore(course, score, user.getSpecialization(), user.getId());
            score = new PreferenceFilter().processScore(course, score, keywords);

            Grade grade = new Grade();
            grade.setCourseNumber(course.getNumber());
            grade.setCourseName(course.getName());
            grade.setCourseCredit(course.getCredit());
            grade.setKeyWord(course.getKeywords());
            grade.setGrade(String.valueOf(score));
            result.add(grade);
        }
        Collections.sort(result);
        for(Grade grade: result) {
        	if(credit<=suggestedCredit) {
            	grade.setSuggested(true);
            	credit+=grade.getCourseCredit();
            }else break;
        }
        request.setAttribute("grades", result);
        return "result";
	}
		
		
}

