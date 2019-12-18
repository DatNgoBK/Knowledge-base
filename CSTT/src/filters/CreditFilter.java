package filters;

import java.sql.SQLException;
import java.util.ArrayList;

import dao.CreditRuleDAO;
import dao.GradeDAO;
import main.StudentRecord;
import model.Course;
import model.Course.Group;
import model.Grade;

/**
 * Determines what course group the course fits in, and finds whether the
 * student needs more credits for this group. Needed core class: 1.00*score
 * Needed elective class: .70*score Other elective class: .30*score No category:
 * 0.0
 */
public class CreditFilter {
	private double coreScore;
	private double electiveScore;
	private double generalScore;

	public double processScore(Course course, double score, String studentGroup, String id) throws ClassNotFoundException, SQLException {
		coreScore = CreditRuleDAO.getCoreScore();
		electiveScore = CreditRuleDAO.getElectiveScore();
		generalScore = CreditRuleDAO.getGeneralScore();
		double creditsReq = 0.0;
		Course.Group group = Course.asGroup(course.getGroup());
		if(group==Course.asGroup(studentGroup))
			return score;
		switch (group) {
		case CORE:
		case CORE_IT:
			return coreScore * score;
		case ELEC_CORE:
			creditsReq = StudentRecord.CourseRequirements.elecCore;
			break;
		case ELEC_CE:
			creditsReq = StudentRecord.CourseRequirements.elecCE;
			break;
		case ELEC_CS:
			creditsReq = StudentRecord.CourseRequirements.elecCS;
			break;
		case ELEC_IS:
			creditsReq = StudentRecord.CourseRequirements.elecIS;
			break;
		case ELEC_NC:
			creditsReq = StudentRecord.CourseRequirements.elecNC;
			break;
		case ELEC_SE:
			creditsReq = StudentRecord.CourseRequirements.elecSE;
			break;
		}
		if(Course.checkGroup(Course.asGroup(studentGroup), group)) {
			if(creditsReq>creditsTaken(group,id))
				return score*electiveScore;
		}
		else {
			ArrayList<Grade> grades = GradeDAO.getGenElecGradesById(id);
			int credit = 0;
			for(Grade grade: grades)
				credit+=grade.getCourseCredit();
			if(credit<StudentRecord.CourseRequirements.elecGEN)
				return score*generalScore;
		}
		return 0;
	}

	private double creditsTaken(Course.Group group, String id) throws ClassNotFoundException, SQLException {
		double credits = 0.0;
		ArrayList<Grade> grades = GradeDAO.getAllGradesById(id);
		for (Grade grade : grades) {
			if (Course.asGroup(grade.getGroup()) == group)
				credits += grade.getCourseCredit();
		}
		return credits;
	}
	
	

	// @Override
	// public String getName()
	// {
	// return "Credit Filter";
	// }
	//
	// @Override
	// public String getDetails(Course course)
	// {
	// if (processScore(course, 1.00) > 0.0)
	// return "This course is needed to satisfy a " +
	// Course.groupToString(MainFrame.getModel().dominantGroup(course.getGroups()))
	// + " requirement.";
	// return null;
	// }
}
