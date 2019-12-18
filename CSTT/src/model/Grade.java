package model;

import main.StudentRecord;

public class Grade implements Comparable<Grade>{
	String studentId;
	String courseNumber;
	String courseName;
	int courseCredit;
	String keyWord;
	String grade;
	Double gradeNumber;
	String group;
	String semester;
	String preRequest;
	boolean suggested;
	
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public int getCourseCredit() {
		return courseCredit;
	}
	public void setCourseCredit(int courseCredit) {
		this.courseCredit = courseCredit;
	}
	public String getKeyWord() {
		return keyWord;
	}
	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}
	
	public String getStudentId() {
		return studentId;
	}
	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}
	public String getCourseNumber() {
		return courseNumber;
	}
	public void setCourseNumber(String courseNumber) {
		this.courseNumber = courseNumber;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public Double getGradeNumber() {
		return gradeNumber;
	}
	public void setGradeNumber(Double gradeNumber) {
		this.gradeNumber = gradeNumber;
	}
	public String getGroup() {
		return group;
	}
	public void setGroup(String group) {
		this.group = group;
	}
	public String getSemester() {
		return semester;
	}
	public void setSemester(String semester) {
		this.semester = semester;
	}
	public String getPreRequest() {
		return preRequest;
	}
	public void setPreRequest(String preRequest) {
		this.preRequest = preRequest;
	}
	
	public boolean isSuggested() {
		return suggested;
	}
	public void setSuggested(boolean suggested) {
		this.suggested = suggested;
	}
	@Override
	public int compareTo(Grade o) {
		if(Double.valueOf(this.getGrade())>Double.valueOf(o.getGrade())) return -1;
		if(Double.valueOf(this.getGrade())<Double.valueOf(o.getGrade())) return 1;
		return 0;
	}
	
	
}
