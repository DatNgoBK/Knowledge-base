package admincontroller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dao.UserDAO;
import model.User;

@Controller
public class LoginController {
	@RequestMapping("test")
	public String showTest() {
		return "test";
	}
	  
	@RequestMapping("login")
	public String showLoginUI(ModelMap model) {
		model.addAttribute("account", new User());
		model.addAttribute("message", "");
		System.out.println("hihi");
		return "Login";
	}
	
	@RequestMapping(value = "login", params = "message")
	public String falseLogin(ModelMap model, 
			@RequestParam("message") String message) {
		model.addAttribute("account", new User());
		model.addAttribute("message", message);
		return "Login";
	}
	
	@RequestMapping(value = "authenticate")
	public String authenticate(ModelMap model, @RequestParam("txtUser") String user,@RequestParam("txtPass") String pass, HttpServletRequest request) {
		try {
			if(user.equals("admin") && pass.equals("admin")) {
				request.getSession().setAttribute("id", 1);
				return "redirect:/course.htm";
			}	
			String id = UserDAO.authenticate(user);
			if(user.equals(pass) && !id.equals("null")) {
				request.getSession().setAttribute("id", id);
				return "redirect:/course.htm";
			}		
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("message", "Wrong username or password");
		return "Login";
	}
}
