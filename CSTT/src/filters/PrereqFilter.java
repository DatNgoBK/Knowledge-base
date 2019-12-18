package filters;

import model.Course;
import model.Grade;

import java.util.ArrayList;

import admincontroller.StudentController;

/**
 * Binary filter, returns the score if prereqs are satisfied. Sets score to 0 if
 * course was taken or prereqs are not satisfied.
 */
public class PrereqFilter {

	public double processScore(ArrayList<Grade> grades, Course course, double score) {
		for (Grade grade : grades) {
			if (course.getNumber().contains(grade.getCourseName()))
				return 0;
		}
		if (course.getPreRequest() != null && !course.getPreRequest().equals("")) {
			for (String prereq : course.getPreRequest().split(":")) {
				boolean learnt = false;
				for (Grade grade : grades) {
					if (prereq.contains(grade.getCourseNumber())) {
						learnt = true;
						break;
					}
				}
				if (!learnt)
					return 0;  
			}
		}

		return score;
	}

	// public String missingPrereqs(Course course)
	// {
	// String result = "";
	// for (Course prereq : course.getPrereqs())
	// {
	// if (!MainFrame.prereqSatisfied(prereq))
	// {
	// result += prereq.getNumber()+", ";
	// }
	// }
	// return result;
	// }
	//
	// public String getName()
	// {
	// return "Prerequisites Filter";
	// }
	//
	// public String getDetails(Course course)
	// {
	// if (processScore(course, 1.00) == 0)
	// return "The following prerequisites have not been satisfied:
	// "+missingPrereqs(course);
	// return null;
	// }

}
