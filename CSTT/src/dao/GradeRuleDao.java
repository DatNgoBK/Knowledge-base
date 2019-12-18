package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import main.StudentRecord;
import model.Course;
import model.Grade;
import model.GradeRule;

public class GradeRuleDao {
	
	public static ArrayList<GradeRule> getAllGradeRules() throws ClassNotFoundException, SQLException {
		ArrayList<GradeRule> rules = new ArrayList<>();
		String sql = "select * from grade_rule";
		Connection con = DBConnection.getConnect();
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			GradeRule rule = new GradeRule();
			rule.setId(rs.getString("id"));
			rule.setCpa(rs.getDouble("cpa"));
			rule.setLevel(rs.getInt("level"));
			rule.setMult(rs.getDouble("mult"));
			rules.add(rule);
		}
		rs.close();
		ps.close();
		con.close();
		return rules;
	}
	

	public static GradeRule getGradeRule(String id) throws ClassNotFoundException, SQLException {
		GradeRule gradeRule = new GradeRule();
		String sql = "select * from grade_rule where id = ? ";
		Connection con = DBConnection.getConnect();
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, id);
		ResultSet rs = ps.executeQuery();
		if(rs.next()) {
			gradeRule.setId(id);
			gradeRule.setCpa(rs.getDouble("CPA"));
			gradeRule.setLevel(rs.getInt("level"));
			gradeRule.setMult(rs.getDouble("mult"));
		}
		return gradeRule;
	}
		
	public static void updateGradeRule(String id, double cpa, int level, double mult) throws ClassNotFoundException, SQLException {
		String sql = "update grade_rule set cpa = ?, level = ?, mult = ? where id = ?";
		PreparedStatement ps = DBConnection.getConnect().prepareStatement(sql);
		ps.setDouble(1, cpa);
		ps.setInt(2, level);
		ps.setDouble(3, mult);
		ps.setString(4, id);
		ps.executeUpdate();
	}
	
	public static void addGradeRule(String id, double cpa, int level, double mult) throws ClassNotFoundException, SQLException {
		String sql = "insert into grade_rule values (?, ?, ?, ?)";
		PreparedStatement ps = DBConnection.getConnect().prepareStatement(sql);
		ps.setString(1, id);
		ps.setDouble(2, cpa);
		ps.setInt(3, level);
		ps.setDouble(4, mult);
		ps.executeUpdate();
	}
	
	public static void deleteGradeRules(String gradeRules) throws ClassNotFoundException, SQLException {
		for(String id : gradeRules.split(",")) {
			String sql = "delete from grade_rule where id = ?";
			PreparedStatement ps = DBConnection.getConnect().prepareStatement(sql);
			ps.setString(1, id);
			ps.executeUpdate();
		}
	}
}
