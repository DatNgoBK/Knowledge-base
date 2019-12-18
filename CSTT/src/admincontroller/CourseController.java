package admincontroller;

import java.sql.SQLException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import dao.CourseDAO;
import model.Course;

@Controller
public class CourseController {

	@RequestMapping("course")
	public String showCourses(ModelMap model) throws ClassNotFoundException, SQLException {
		model.addAttribute("courses",CourseDAO.getAllCourse());
		return "course";
	}
	
	@RequestMapping("single-course")
	@ResponseBody
	public byte[] showCourse(@RequestParam String number) throws ClassNotFoundException, SQLException, JsonProcessingException {
		Course course = CourseDAO.getCourseByNumber(number);
		ObjectMapper obj = new ObjectMapper();
		return obj.writeValueAsBytes(course);
	}
	
	@RequestMapping("update-course")
	public String updateCourse(@RequestParam String number, @RequestParam String keywords) throws ClassNotFoundException, SQLException, JsonProcessingException {
		CourseDAO.updateCourse(number, keywords);
		return "redirect:/course.htm";
	}
}
