package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.GradeRule;
import model.LevelRule;

public class LevelRuleDao {
	public static ArrayList<LevelRule> getAllLevelRules() throws ClassNotFoundException, SQLException {
		ArrayList<LevelRule> rules = new ArrayList<>();
		String sql = "select * from level_rule";
		Connection con = DBConnection.getConnect();
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			LevelRule rule = new LevelRule();
			rule.setId(rs.getString("id"));
			rule.setTest(rs.getBoolean("test"));
			rule.setLevel(rs.getInt("level"));
			rule.setMult(rs.getDouble("mult"));
			rules.add(rule);
		}
		rs.close();
		ps.close();
		con.close();
		return rules;
	}
	

	public static LevelRule getLevelRule(String id) throws ClassNotFoundException, SQLException {
		LevelRule levelRule = new LevelRule();
		String sql = "select * from level_rule where id = ? ";
		Connection con = DBConnection.getConnect();
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, id);
		ResultSet rs = ps.executeQuery();
		if(rs.next()) {
			levelRule.setId(id);
			levelRule.setLevel(rs.getInt("level"));
			levelRule.setTest(rs.getBoolean("test"));
			levelRule.setMult(rs.getDouble("mult"));
		}
		return levelRule;
	}
		
	public static void updateLevelRule(String id, int level, int test, double mult) throws ClassNotFoundException, SQLException {
		String sql = "update level_rule set level = ?, test = ?, mult = ? where id = ?";
		PreparedStatement ps = DBConnection.getConnect().prepareStatement(sql);
		ps.setInt(1, level);
		ps.setInt(2, test);
		ps.setDouble(3, mult);
		ps.setString(4, id);
		ps.executeUpdate();
	}
	
	public static void addLevelRule(String id, int level, int test, double mult) throws ClassNotFoundException, SQLException {
		String sql = "insert into level_rule values (?, ?, ?, ?)";
		PreparedStatement ps = DBConnection.getConnect().prepareStatement(sql);
		ps.setString(1, id);
		ps.setInt(2, level);
		ps.setInt(3, test);
		ps.setDouble(4, mult);
		ps.executeUpdate();
	}
	
	public static void deleteLevelRules(String levelRuleIds) throws ClassNotFoundException, SQLException {
		for(String id : levelRuleIds.split(",")) {
			String sql = "delete from level_rule where id = ?";
			PreparedStatement ps = DBConnection.getConnect().prepareStatement(sql);
			ps.setString(1, id);
			ps.executeUpdate();
		}
	}
}
