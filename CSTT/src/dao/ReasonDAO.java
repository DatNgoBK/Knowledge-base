package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Reason;
import model.Statistical;

public class ReasonDAO {
	public static ArrayList<Reason> getAllReasons() throws ClassNotFoundException, SQLException {
		ArrayList<Reason> reasons = new ArrayList<>();
		String sql = "select * from reason";
		Connection con = DBConnection.getConnect();
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			Reason reason = new Reason();
			reason.setReason(rs.getString("reason"));
			reason.setId(rs.getInt("id"));
			reason.setNumber(rs.getInt("number"));
			reasons.add(reason);
		}
		rs.close();
		ps.close();
		con.close();
		return reasons;
	}
	
	public static void increaseReason(int id) throws ClassNotFoundException, SQLException {
		String sql = "UPDATE reason SET number = number + 1 WHERE id = ?";
		Connection con = DBConnection.getConnect();
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, id);
		ps.executeUpdate();
		ps.close();
		con.close();
	}
}
