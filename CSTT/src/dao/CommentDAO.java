package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Comment;
import model.Reason;

public class CommentDAO {
	public static ArrayList<Comment> getAllComments() throws ClassNotFoundException, SQLException {
		ArrayList<Comment> comments = new ArrayList<>();
		String sql = "select * from comment";
		Connection con = DBConnection.getConnect();
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			Comment comment = new Comment();
			comment.setReason(rs.getString("reason"));
			comment.setComment(rs.getString("comment"));
			comment.setStudentId(rs.getString("student_id"));
			comments.add(comment);
		}
		rs.close();
		ps.close();
		con.close();
		return comments;
	}
	
	public static void addComment(Comment c) throws SQLException, ClassNotFoundException {
		String sql = "insert into comment values (?,?,?)";
		Connection con = DBConnection.getConnect();
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, c.getStudentId());
		ps.setString(2,c.getReason());
		ps.setString(3,c.getComment());
		ps.executeUpdate();
		ps.close();
		con.close();
	}
}
