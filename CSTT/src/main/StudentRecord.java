package main;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dao.CourseDAO;
import dao.CreditDAO;
import model.Course;
import model.Credit;
import model.Grade;
import model.User;

public class StudentRecord {
	
	public CourseRequirements requirements;
	
	public class CourseRequirements {

        public static final double elecCore = 6;
        public static final double elecCS = 8;
        public static final double elecIS = 10;
        public static final double elecSE = 9;
        public static final double elecCE = 9;
        public static final double elecNC = 10;
        public static final double elecGEN = 8;
    }

	public static double letterGradeToDouble(String grade) {
        if (grade.equals("A+")) {
            return 4.0;
        }
        if (grade.equals("A")) {
            return 4.0;
        }
        if (grade.equals("B+")) {
            return 3.5;
        }
        if (grade.equals("B")) {
            return 3.0;
        }
        if (grade.equals("C+")) {
            return 2.5;
        }
        if (grade.equals("C")) {
            return 2.0;
        }
        if (grade.equals("D+")) {
            return 1.5;
        }
        if (grade.equals("D")) {
            return 1.0;
        }
        return 0;
    }
	
	public double computeSuggestedCredits(double cpa, String semester) throws ClassNotFoundException, SQLException {
		ArrayList<Credit> credits = CreditDAO.getAllCredit();
		double credit = 0;
		String s = semester.split(" ")[1];
		for(Credit c: credits) {
			if(cpa>c.getCpa()) {
				credit = c.getCredit();
				break;
			}			
		}
        if(s.equals("3")) credit = (int)credit/3;
        return credit;
    }
	
//	public void computeScores(ArrayList<Grade> grades, User student) {
//        ArrayList<Course> courses = CourseDAO.getAllCourse();
//        for (Course course : courses) {
//            double score = 1.0f;
//            for (IFilter filter : filters) {
//                score = filter.processScore(course, score);
//            }
//            course.setScore(score);
//        }
//    }
	
	public static Course.Group dominantGroup(String[] groups, String group) {
        if (groups.length == 1) {
            return Course.asGroup(groups[0]);
        } else if (groups.length> 1) {
            Course.Group studentGroup = Course.asGroup(group);
            for (String g : groups) {
                if (studentGroup == Course.asGroup(g)) {
                    return Course.asGroup(g);
                }
            }
        }
        return Course.Group.NONE;
    }
}
