package admincontroller;

import java.sql.SQLException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import dao.CourseDAO;
import dao.CreditRuleDAO;
import dao.GradeRuleDao;
import dao.LevelRuleDao;
import dao.PreferenceRuleDAO;
import model.Course;
import model.CreditRule;
import model.GradeRule;
import model.LevelRule;
import model.PreferenceRule;

@Controller
@RequestMapping("/rule/")
public class RuleController {
	@RequestMapping("list")
	public String showRules(ModelMap model) throws ClassNotFoundException, SQLException {
		model.addAttribute("keywords",CourseDAO.getAllKeywords());
		model.addAttribute("creditRules",CreditRuleDAO.getAllCreditRule());
		model.addAttribute("gradeRules",GradeRuleDao.getAllGradeRules());
		model.addAttribute("levelRules", LevelRuleDao.getAllLevelRules());
		model.addAttribute("preferenceRules", PreferenceRuleDAO.getAllPreferenceRule());
		System.out.println(PreferenceRuleDAO.getAllPreferenceRule().get(0).getId());
		return "rule";
	}

	@RequestMapping("add-keyword")
	public String addKeyword(@RequestParam String keyword) throws ClassNotFoundException, SQLException {
		System.out.println(keyword);
		CourseDAO.addKeyword(keyword);
		return "redirect:/rule/list.htm";
	}
	
	@RequestMapping("delete-keywords")
	public String deleteKeywords(@RequestParam String keywords) throws ClassNotFoundException, SQLException {
		CourseDAO.deleteKeywords(keywords);
		return "redirect:/rule/list.htm";
	}
	
	@RequestMapping("gradeRule")
	@ResponseBody
	public byte[] showGradeRule(@RequestParam String id) throws ClassNotFoundException, SQLException, JsonProcessingException {
		GradeRule gradeRule = GradeRuleDao.getGradeRule(id);
		ObjectMapper obj = new ObjectMapper();
		return obj.writeValueAsBytes(gradeRule);
	}
	
	@RequestMapping("add-gradeRule")
	public String addGradeRule(@RequestParam String id, @RequestParam double cpa, @RequestParam int level, @RequestParam double mult)
			throws ClassNotFoundException, SQLException {
		GradeRuleDao.addGradeRule(id, cpa, level, mult);
		return "redirect:/rule/list.htm";
	}
	
	@RequestMapping("update-gradeRule")
	public String updateGradeRule(@RequestParam String id, @RequestParam double cpa, @RequestParam int level, @RequestParam double mult)
			throws ClassNotFoundException, SQLException, JsonProcessingException {
		GradeRuleDao.updateGradeRule(id, cpa, level, mult);
		return "redirect:/rule/list.htm";
	}
	
	@RequestMapping("delete-gradeRules")
	public String deleteGradeRules(@RequestParam String gradeRuleIds) throws ClassNotFoundException, SQLException {
		GradeRuleDao.deleteGradeRules(gradeRuleIds);
		return "redirect:/rule/list.htm";
	}
	
	@RequestMapping("levelRule")
	@ResponseBody
	public byte[] showLevelRule(@RequestParam String id) throws ClassNotFoundException, SQLException, JsonProcessingException {
		LevelRule levelRule = LevelRuleDao.getLevelRule(id);
		ObjectMapper obj = new ObjectMapper();
		return obj.writeValueAsBytes(levelRule);
	}
	
	@RequestMapping("add-levelRule")
	public String addLevelRule(@RequestParam String id, @RequestParam int level, @RequestParam int test, @RequestParam double mult)
			throws ClassNotFoundException, SQLException {
		LevelRuleDao.addLevelRule(id, level, test, mult);
		return "redirect:/rule/list.htm";
	}
	
	@RequestMapping("update-levelRule")
	public String updateLevelRule(@RequestParam String id, @RequestParam int level, @RequestParam int test, @RequestParam double mult)
			throws ClassNotFoundException, SQLException, JsonProcessingException {
		LevelRuleDao.updateLevelRule(id, level, test, mult);
		return "redirect:/rule/list.htm";
	}
	
	@RequestMapping("delete-levelRules")
	public String deleteLevelRules(@RequestParam String levelRuleIds) throws ClassNotFoundException, SQLException {
		LevelRuleDao.deleteLevelRules(levelRuleIds);
		return "redirect:/rule/list.htm";
	}
	
	@RequestMapping("preferenceRule")
	@ResponseBody
	public byte[] showPreferenceRule(@RequestParam String id) throws ClassNotFoundException, SQLException, JsonProcessingException {
		PreferenceRule preferenceRule = PreferenceRuleDAO.getPreferenceRule(id);
		ObjectMapper obj = new ObjectMapper();
		return obj.writeValueAsBytes(preferenceRule);
	}
	
	@RequestMapping("add-preferenceRule")
	public String addPreferenceRule(@RequestParam String id, @RequestParam String name, @RequestParam double mult)
			throws ClassNotFoundException, SQLException {
		PreferenceRuleDAO.addPreferenceRule(id, name, mult);
		return "redirect:/rule/list.htm";
	}
	
	@RequestMapping("update-preferenceRule")
	public String updatePreferenceRule(@RequestParam String id, @RequestParam String name, @RequestParam double mult)
			throws ClassNotFoundException, SQLException, JsonProcessingException {
		PreferenceRuleDAO.updatePreferenceRule(id, name, mult);
		return "redirect:/rule/list.htm";
	}
	
	@RequestMapping("delete-preferenceRules")
	public String deletePreferenceRules(@RequestParam String preferenceRuleIds) throws ClassNotFoundException, SQLException {
		PreferenceRuleDAO.deletePreferenceRules(preferenceRuleIds);
		return "redirect:/rule/list.htm";
	}
	
	@RequestMapping("single-creditRule")
	@ResponseBody
	public byte[] showCreditRule(@RequestParam String id) throws ClassNotFoundException, SQLException, JsonProcessingException {
		CreditRule creditRule = CreditRuleDAO.getCreditRule(id);
		ObjectMapper obj = new ObjectMapper();
		return obj.writeValueAsBytes(creditRule);
	}
	
	@RequestMapping("add-creditRule")
	public String addcreditRule(@RequestParam String id, @RequestParam String name, @RequestParam double mult)
			throws ClassNotFoundException, SQLException {
		CreditRuleDAO.addCreditRule(new CreditRule(id, name, mult));
		return "redirect:/rule/list.htm";
	}
	
	@RequestMapping("update-creditRule")
	public String updateCreditRule(@RequestParam String id, @RequestParam String name, @RequestParam double mult)
			throws ClassNotFoundException, SQLException, JsonProcessingException {
		CreditRuleDAO.updateCreditRule(new CreditRule(id, name, mult));
		return "redirect:/rule/list.htm";
	}
	
	@RequestMapping("delete-creditRules")
	public String deleteCreditRules(@RequestParam String creditRuleIds) throws ClassNotFoundException, SQLException {
		CreditRuleDAO.deleteCreditRules(creditRuleIds);
		return "redirect:/rule/list.htm";
	}
}