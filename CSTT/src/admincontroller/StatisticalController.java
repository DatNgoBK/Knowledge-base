package admincontroller;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dao.CommentDAO;
import dao.ReasonDAO;
import dao.StatisticalDAO;
import model.Comment;
import model.Reason;
import model.Statistical;

@Controller
public class StatisticalController {
	@RequestMapping("statistical")
	public String showStatistical(HttpServletRequest request) throws ClassNotFoundException, SQLException {
		ArrayList<Statistical> statisticals = StatisticalDAO.getAllStatisticals();
		ArrayList<Reason> reasons = ReasonDAO.getAllReasons();
		ArrayList<Comment> comments = CommentDAO.getAllComments();
		request.setAttribute("statisticals", statisticals);
		request.setAttribute("reasons", reasons);
		request.setAttribute("comments", comments);
		return "statistical";
	}
	
	@RequestMapping("comment")
	public String addComment(HttpServletRequest request, @RequestParam("radLike") int status,
			@RequestParam("reason") int[] reasons, @RequestParam("comment") String comment) throws ClassNotFoundException, SQLException {
		String id = (String) request.getSession().getAttribute("id");
		if(status==1)
			StatisticalDAO.increaseStatus("Thích");
		else
			StatisticalDAO.increaseStatus("Không thích");
		String reasonId = "";
		for(int reason: reasons) {
			ReasonDAO.increaseReason(reason);
			reasonId+=reason+":";
		}
		CommentDAO.addComment(new Comment(id, reasonId, comment));
		return "redirect:/home.htm";
	}
}
