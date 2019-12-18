package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.CreditRule;

public class CreditRuleDAO {
	public static double getCoreScore() throws ClassNotFoundException, SQLException {
		double score = 0;
		String sql = "select mult from credit_filter where name = 'core_score'";
		Connection con = DBConnection.getConnect();
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		if(rs.next()) {
			score = rs.getDouble("mult");
		}
		rs.close();
		ps.close();
		con.close();
		return score;
	}
	
	public static double getElectiveScore() throws ClassNotFoundException, SQLException {
		double score = 0;
		String sql = "select mult from credit_filter where name = 'elective_score'";
		Connection con = DBConnection.getConnect();
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		if(rs.next()) {
			score = rs.getDouble("mult");
		}
		rs.close();
		ps.close();
		con.close();
		return score;
	}

	public static double getGeneralScore() throws ClassNotFoundException, SQLException {
		double score = 0;
		String sql = "select mult from credit_filter where name = 'general_score'";
		Connection con = DBConnection.getConnect();
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		if(rs.next()) {
			score = rs.getDouble("mult");
		}
		rs.close();
		ps.close();
		con.close();
		return score;
	}
	
	public static ArrayList<CreditRule> getAllCreditRule() throws ClassNotFoundException, SQLException{
		String sql = "select * from credit_filter";
		PreparedStatement ps = DBConnection.getConnect().prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		ArrayList<CreditRule> creditRules = new ArrayList<>();
		while(rs.next()) {
			CreditRule creditRule = new CreditRule();
			creditRule.setId(rs.getString("id"));
			creditRule.setName(rs.getString("name"));
			creditRule.setMult(rs.getDouble("mult"));
			creditRules.add(creditRule);
		}
		return creditRules;
	}
	
	public static CreditRule getCreditRule(String id) throws ClassNotFoundException, SQLException{
		String sql = "select * from credit_filter where id = ?";
		PreparedStatement ps = DBConnection.getConnect().prepareStatement(sql);
		ps.setString(1, id);
		ResultSet rs = ps.executeQuery();
		CreditRule creditRule = new CreditRule();
		if(rs.next()) {
			creditRule.setId(rs.getString("id"));
			creditRule.setName(rs.getString("name"));
			creditRule.setMult(rs.getDouble("mult"));
		}
		return creditRule;
	}

	public static void addCreditRule(CreditRule creditRule) throws ClassNotFoundException, SQLException {
		String sql = "insert into credit_filter values (?, ?, ?)";
		PreparedStatement ps = DBConnection.getConnect().prepareStatement(sql);
		ps.setString(1, creditRule.getId());
		ps.setString(2, creditRule.getName());
		ps.setDouble(3, creditRule.getMult());
		ps.executeUpdate();
	}
	
	public static void updateCreditRule(CreditRule creditRule) throws ClassNotFoundException, SQLException {
		String sql = "update credit_filter set name = ?, mult = ? where id = ?";
		PreparedStatement ps = DBConnection.getConnect().prepareStatement(sql);
		ps.setString(1, creditRule.getName());
		ps.setDouble(2, creditRule.getMult());
		ps.setString(3, creditRule.getId());
		int x = ps.executeUpdate();
		if (x > 0)
			System.out.println("success");
	}
	
	public static void deleteCreditRules(String creditRuleIds) throws ClassNotFoundException, SQLException {
		for(String keyword : creditRuleIds.split(",")) {
			String sql = "delete from credit_filter where id = ?";
			PreparedStatement ps = DBConnection.getConnect().prepareStatement(sql);
			ps.setString(1, keyword);
			ps.executeUpdate();
		}
	}
}
