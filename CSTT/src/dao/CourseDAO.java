package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Course;
import model.Grade;
import model.User;

public class CourseDAO {
	public static Course getCourseByNumber(String number) throws ClassNotFoundException, SQLException {
		Course course = new Course();
		String sql = "select * from course where number = ? ";
		Connection con = DBConnection.getConnect();
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, number);
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			course.setCredit(rs.getInt("credit"));
			course.setGroup(rs.getString("groups"));
			course.setKeywords(rs.getString("keywords"));
			course.setName(rs.getString("name"));
			course.setNumber(rs.getString("number"));
			course.setPreRequest(rs.getString("pre_requests"));
			course.setSemester(rs.getString("semester"));
		}
		rs.close();
		ps.close();
		con.close();
		return course;
	}
	
	public static ArrayList<String> getAllKeywords() throws ClassNotFoundException, SQLException{
		ArrayList<String> keywords = new ArrayList<>();
		String sql = "select keyword from keyword";
		Connection con = DBConnection.getConnect();
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			keywords.add(rs.getString("keyword"));
		}
		rs.close();
		ps.close();
		con.close();
		return keywords;
	}
	
	public static ArrayList<Course> getAllCourse() throws ClassNotFoundException, SQLException{
		ArrayList<Course> courses = new ArrayList<>();
		String sql = "select * from course";
		Connection con = DBConnection.getConnect();
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			Course course = new Course();
			course.setNumber(rs.getString(2));
			course.setName(rs.getString(3));
			course.setCredit(rs.getInt(4));
			course.setGroup(rs.getString(5));
			course.setSemester(rs.getString(6));
			course.setKeywords(rs.getString(7));
			course.setPreRequest(rs.getString(8));
			courses.add(course);
		}
		rs.close();
		ps.close();
		con.close();
		return courses;
	}
	

	
	public static void updateCourse(String number, String keywords) throws ClassNotFoundException, SQLException {
		String sql = "update course set keywords = ? where number = ?";
		PreparedStatement ps = DBConnection.getConnect().prepareStatement(sql);
		ps.setString(1, keywords);
		ps.setString(2, number);
		System.out.println(sql);
		int x = ps.executeUpdate();
		if (x > 0)
			System.out.println("success");
	}
	
	public static void addKeyword(String keyword) throws ClassNotFoundException, SQLException {
		String sql = "insert into keyword values (?)";
		PreparedStatement ps = DBConnection.getConnect().prepareStatement(sql);
		ps.setString(1, keyword);
		System.out.println(keyword);
		ps.executeUpdate();
	}
	
	public static void deleteKeywords(String keywords) throws ClassNotFoundException, SQLException {
		System.out.println(keywords);
		for(String keyword : keywords.split(",")) {
			String sql = "delete from keyword where keyword = ?";
			PreparedStatement ps = DBConnection.getConnect().prepareStatement(sql);
			ps.setString(1, keyword);
			ps.executeUpdate();
		}
	}
	
}
