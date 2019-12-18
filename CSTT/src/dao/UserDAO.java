package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Course;
import model.User;

public class UserDAO {
	public static String authenticate(String user) throws ClassNotFoundException, SQLException {
		String sql = "select id from student where id = ? ";
		Connection con = DBConnection.getConnect();
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, user);
		ResultSet rs = ps.executeQuery();
		if(rs.next())
			return rs.getString("id");
		return "null";
	}
	
	public static User getStudentInfo(String id) throws ClassNotFoundException, SQLException {
		User user = new User();
		String sql = "select * from student where id = ? ";
		Connection con = DBConnection.getConnect();
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, id);
		ResultSet rs = ps.executeQuery();
		if(rs.next()) {
			user.setId(rs.getString("id"));
			user.setName(rs.getNString("name"));
			user.setSpecialization(rs.getNString("specialization"));
		}
		rs.close();
		ps.close();
		con.close();
		return user;
	}
	
	public static Course.Group getGroupById(String id)throws ClassNotFoundException, SQLException {
		Course.Group group = Course.Group.NONE;
		String sql = "select specialization from student where id = ? ";
		Connection con = DBConnection.getConnect();
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, id);
		ResultSet rs = ps.executeQuery();
		if(rs.next()) {
			group = Course.asGroup(rs.getString("specialization"));
		}	
		rs.close();
		ps.close();
		con.close();
		return group;
	}
}
