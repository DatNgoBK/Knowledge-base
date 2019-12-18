package filters;

import java.sql.SQLException;
import java.util.ArrayList;

import dao.GradeRuleDao;
import model.Course;
import model.GradeRule;

public class GradeFilter{

	public double processScore(Double cpa, Course course, double score) throws ClassNotFoundException, SQLException {

		int level = course.level();
		ArrayList<GradeRule> rules = GradeRuleDao.getAllGradeRules();
		for(GradeRule rule: rules) {
			if(cpa<rule.getCpa() && level == rule.getLevel())
				return score*rule.getMult();
		}
		return score;
	}

//	@Override
//	public String getName() {
//		return "Grade Filter";
//	}
//
//	@Override
//	public String getDetails(Course course) {
//		if (processScore(course, 1.00) < 1.00)
//			return "Your GPA is too low, it is unadvised to take "+course.level()+"00 level courses.";
//		return null;
//	}

}