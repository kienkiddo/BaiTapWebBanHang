package controller.home;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import commom.PageInfo;
import io.HistoryData;
import model.Cart;
import model.User;

/**
 * Servlet implementation class ThanksServlet
 */
@WebServlet("/dat-hang-thanh-cong")
public class ThanksServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ThanksServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		var user = (User) request.getAttribute("user");
		if (user == null) {
			PageInfo.page404NotFound(request, response);
		} else {
			var history = HistoryData.withLast(user.getId());
			if (history == null) {
				PageInfo.page404NotFound(request, response);
			} else {
				request.setAttribute("history", history);
				PageInfo page = new PageInfo("Thành công", "thanks.jsp");
				page.forward(request, response);
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
