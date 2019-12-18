package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.GradeRule;
import model.Statistical;

public class StatisticalDAO {
	public static ArrayList<Statistical> getAllStatisticals() throws ClassNotFoundException, SQLException {

		ArrayList<Statistical> statisticals = new ArrayList<>();
		String sql = "select * from statistical";
		Connection con = DBConnection.getConnect();
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			Statistical statistical = new Statistical();
			statistical.setStatus(rs.getString("status"));
			statistical.setNumber(rs.getInt("number"));
			statisticals.add(statistical);
		}
		rs.close();
		ps.close();
		con.close();
		return statisticals;
	}
	
	public static void increaseStatus(String status) throws ClassNotFoundException, SQLException {
		String sql = "UPDATE statistical SET number = number + 1 WHERE status = ?";
		Connection con = DBConnection.getConnect();
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, status);
		ps.executeUpdate();
		ps.close();
		con.close();
	}
}
