package filters;

import model.Course;

/**
 * TODO: need to be able to control semester from the GUI and make this
 * available to this filter (currently fixed to 2)
 */
public class SemesterFilter {

	public double processScore(Course course, double score, String semesterString) {
		String semester = semesterString.split(" ")[1];
		for(String s: course.getSemester().split(":")) {
			if(s.contains(semester))
				return score;
		}
		return 0;
	}
	// @Override
	// public String getName()
	// {
	// return "Semester Filter";
	// }
	//
	// @Override
	// public String getDetails(Course course)
	// {
	// if (processScore(course, 1.00) == 0)
	// return "This class is not offered this semester.";
	// return null;
	// }
}