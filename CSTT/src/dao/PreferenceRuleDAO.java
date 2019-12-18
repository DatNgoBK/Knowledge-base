package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.LevelRule;
import model.PreferenceRule;

public class PreferenceRuleDAO {
	public static double getMatchScore() throws ClassNotFoundException, SQLException {
		double score = 0;
		String sql = "select mult from preference_filter where name = 'match_score'";
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
	
	public static double getMisMatchScore() throws ClassNotFoundException, SQLException {
		double score = 0;
		String sql = "select mult from preference_filter where name = 'mismatch_score'";
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
	
	public static ArrayList<PreferenceRule> getAllPreferenceRule() throws ClassNotFoundException, SQLException{
		String sql = "select * from preference_filter";
		PreparedStatement ps = DBConnection.getConnect().prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		ArrayList<PreferenceRule> preferenceRules = new ArrayList<>();
		while(rs.next()) {
			PreferenceRule preferenceRule = new PreferenceRule();
			preferenceRule.setId(rs.getString("id"));
			preferenceRule.setName(rs.getString("name"));
			preferenceRule.setMult(rs.getDouble("mult"));
			preferenceRules.add(preferenceRule);
		}
		return preferenceRules;
	}
	

	public static PreferenceRule getPreferenceRule(String id) throws ClassNotFoundException, SQLException {
		PreferenceRule preferenceRule = new PreferenceRule();
		String sql = "select * from preference_filter where id = ? ";
		Connection con = DBConnection.getConnect();
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, id);
		ResultSet rs = ps.executeQuery();
		if(rs.next()) {
			preferenceRule.setId(id);
			preferenceRule.setName(rs.getString("name"));
			preferenceRule.setMult(rs.getDouble("mult"));
		}
		return preferenceRule;
	}
		
	public static void updatePreferenceRule(String id, String name, double mult) throws ClassNotFoundException, SQLException {
		String sql = "update preference_filter set name = ?, mult = ? where id = ?";
		PreparedStatement ps = DBConnection.getConnect().prepareStatement(sql);
		ps.setString(1, name);
		ps.setDouble(2, mult);
		ps.setString(3, id);
		ps.executeUpdate();
	}
	
	public static void addPreferenceRule(String id, String name, double mult) throws ClassNotFoundException, SQLException {
		String sql = "insert into preference_filter values (?, ?, ?)";
		PreparedStatement ps = DBConnection.getConnect().prepareStatement(sql);
		ps.setString(1, id);
		ps.setString(2, name);
		ps.setDouble(3, mult);
		ps.executeUpdate();
	}
	
	public static void deletePreferenceRules(String preferenceRuleIds) throws ClassNotFoundException, SQLException {
		for(String id : preferenceRuleIds.split(",")) {
			String sql = "delete from preference_filter where id = ?";
			PreparedStatement ps = DBConnection.getConnect().prepareStatement(sql);
			ps.setString(1, id);
			ps.executeUpdate();
		}
	}
}
