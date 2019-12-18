package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Credit;
import model.GradeRule;

public class CreditDAO {
	public static ArrayList<Credit> getAllCredit() throws ClassNotFoundException, SQLException {
		ArrayList<Credit> credits = new ArrayList<>();
		String sql = "select * from credit";
		Connection con = DBConnection.getConnect();
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			Credit credit = new Credit();
			credit.setId(rs.getString("id"));
			credit.setCpa(rs.getDouble("cpa"));
			credit.setCredit(rs.getInt("credit"));
			credits.add(credit);
		}
		rs.close();
		ps.close();
		con.close();
		return credits;
	}
}
