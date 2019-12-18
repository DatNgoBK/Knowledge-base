package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import main.StudentRecord;
import model.Course;
import model.Grade;
import model.User;

public class GradeDAO {
	public static ArrayList<Grade> getAllGradesById(String id) throws ClassNotFoundException, SQLException {
		ArrayList<Grade> grades = new ArrayList<>();
		String sql = "select * from grade where student_id = ? ";
		Connection con = DBConnection.getConnect();
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, id);
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			Grade grade = new Grade();
			grade.setStudentId(rs.getString("student_id"));
			grade.setGrade(rs.getString("grade"));	
			System.out.println(rs.getString("course_number"));
			Course course = CourseDAO.getCourseByNumber(rs.getString("course_number"));
			grade.setCourseCredit(course.getCredit());
			grade.setCourseName(course.getName());
			grade.setCourseNumber(course.getNumber().split(" ")[0]);
			grade.setKeyWord(course.getKeywords());
			grade.setGradeNumber(StudentRecord.letterGradeToDouble(grade.getGrade()));
			grade.setGroup(course.getGroup());
			grades.add(grade);
		}
		rs.close();
		ps.close();
		con.close();
		return grades;
	}
	
	
	public static ArrayList<Grade> getGenElecGradesById(String id)throws ClassNotFoundException, SQLException {
		Course.Group studentGroup = UserDAO.getGroupById(id);
		ArrayList<Grade> grades = getAllGradesById(id);
		ArrayList<Grade> result = new ArrayList<>();
		for(Grade grade: grades) {
			Course.Group courseGroup = Course.asGroup(grade.getGroup());
			if(courseGroup!=Course.Group.CORE && courseGroup!=Course.Group.ELEC_CORE && courseGroup!=studentGroup && !Course.checkGroup(studentGroup, courseGroup))
				result.add(grade);
		}
		return result;
	}
	
	public static ArrayList<Grade> getAllCourse() throws ClassNotFoundException, SQLException{
		ArrayList<Grade> courses = new ArrayList<>();
		String sql = "select * from course";
		Connection con = DBConnection.getConnect();
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			Grade course = new Grade();
			course.setCourseNumber(rs.getString(1));
			course.setCourseName(rs.getString(2));
			course.setCourseCredit(rs.getInt(3));
			course.setGroup(rs.getString(4));
			course.setSemester(rs.getString(5));
			course.setKeyWord(rs.getString(6));
			course.setPreRequest(rs.getString(7));
			courses.add(course);
		}
		rs.close();
		ps.close();
		con.close();
		return courses;
	}
}
