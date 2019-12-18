package model;

public class Comment {
	String studentId;
	String reason;
	String comment;
	
	
	public Comment() {
		super();
	}
	public Comment(String studentId, String reason, String comment) {
		super();
		this.studentId = studentId;
		this.reason = reason;
		this.comment = comment;
	}
	public String getStudentId() {
		return studentId;
	}
	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	
	
}
