package admincontroller;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.CourseDAO;
import dao.GradeDAO;
import dao.UserDAO;
import main.StudentRecord;
import model.Grade;
import model.User;

@Controller
public class StudentController {
	static User user;
	static ArrayList<Grade> grades;
	
	@RequestMapping("home")
	public String showStudentInfo(HttpServletRequest request) throws ClassNotFoundException, SQLException {
		String id = (String) request.getSession().getAttribute("id");
		user = UserDAO.getStudentInfo(id);	
		grades = GradeDAO.getAllGradesById(id);
		double sum = 0;
		double credits = 0;
		for(Grade grade: grades) {
			sum+=grade.getGradeNumber()*grade.getCourseCredit();
			credits+=grade.getCourseCredit();
		}
		double cpa = sum/credits;
		user.setCPA(cpa);
		request.getSession().setAttribute("student", user);
		request.getSession().setAttribute("grades", grades);
		StudentRecord sr = new StudentRecord();
//		request.setAttribute("credits", sr.computeSuggestedCredits(cpa));
		request.setAttribute("keywords", CourseDAO.getAllKeywords());
		return "StudentManagement";
	}
	
	@RequestMapping("credit")
	@ResponseBody
	public String computeCredits(@RequestBody String semester) throws ClassNotFoundException, SQLException {
		StudentRecord sr = new StudentRecord();
		double credit = sr.computeSuggestedCredits(user.getCPA(),semester);
		return String.valueOf(credit);
	}
}
