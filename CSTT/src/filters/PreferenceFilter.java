package filters;

import java.sql.SQLException;
import java.util.List;

import dao.PreferenceRuleDAO;
import model.Course;

/*
 * If all keywords match: 1.00
 * If no keywords match:  0.80
 */
public class PreferenceFilter{
    private double matchScore;
    private double mismatchScore;
    
	public double processScore(Course course, double score, String[] preferences) throws ClassNotFoundException, SQLException 
	{
		matchScore = PreferenceRuleDAO.getMatchScore();
		mismatchScore = PreferenceRuleDAO.getMisMatchScore();
		String[] keywords = course.getKeywords().split(":");
	    int totalNumber = keywords.length;
	    int matchNumber = countMatchingKeywords(keywords,preferences);
	    double modifier = (((double)matchNumber)/((double)totalNumber))*(matchScore - mismatchScore) + mismatchScore;
	    return (modifier*score);
	}
    
    private int countMatchingKeywords(String[] keywords, String[] preferences)
    {
        int matchNumber = 0;
        for (String keyword : keywords)
        {
            for (String preference : preferences)
            {
                if (keyword.equals(preference))
                {
                    matchNumber++;
                    break;
                }
            }
        }
        return matchNumber;
    }
    
//	@Override
//	public String getName() 
//	{
//		return "Preference Filter";
//	}
//
//	@Override
//	public String getDetails(Course course) 
//	{
//	    return (countMatchingKeywords(course.getKeywords()) + " out of " + course.getKeywords().size() + " keywords match your preferences.");
//	}
}