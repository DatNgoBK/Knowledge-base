package filters;

import java.sql.SQLException;
import java.util.ArrayList;

import dao.CourseDAO;
import dao.LevelRuleDao;
import main.StudentRecord;
import model.Course;
import model.Grade;
import model.LevelRule;

/**
 * Binary filter, sets score to 0 for 400 level classes if all 200 level classes
 * of the same type were not completed.
 */
public class LevelFilter {

	public double processScore(Course course, double score, ArrayList<Grade> grades, String group) throws ClassNotFoundException, SQLException {
		int level = course.level();
		ArrayList<LevelRule> rules = LevelRuleDao.getAllLevelRules();
		for(LevelRule rule: rules) {
			if(level==rule.getLevel()) {
				if(rule.isTest()) {
					return (testQualification(course,grades,group) ? score*rule.getMult() : 0.0);
				}else {
					return rule.getMult()*score;
				}
			}
		}
		return 0;
	}

	// Check if student has taken all 200 level core COMP courses
	private boolean testQualification(Course testedCourse, ArrayList<Grade> grades, String group) throws ClassNotFoundException, SQLException {
		for (Course course : CourseDAO.getAllCourse()) {
			int level = course.level();
			boolean taken = false;
			for(Grade grade: grades) if(testedCourse.getNumber().contains(grade.getCourseNumber())) {
				taken = true;
				break;
			}
			if (level == 2 && !taken
					&& Course.asGroup(course.getGroup())==Course.asGroup(testedCourse.getGroup())) {
				return false;
			}
		}
		return true;
	}

	// @Override
	// public String getName()
	// {
	// return "Level Filter";
	// }
	//
	// @Override
	// public String getDetails(Course course)
	// {
	// if (processScore(course, 1.00) == 0)
	// return "You need to take all 200 level core computer science courses in order
	// to take a 400 level course.";
	// return null;
	// }
}
