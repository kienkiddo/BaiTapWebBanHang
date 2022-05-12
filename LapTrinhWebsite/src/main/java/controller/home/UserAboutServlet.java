package controller.home;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import commom.PageInfo;
import commom.Security;
import io.HistoryData;
import io.UserData;
import model.User;

/**
 * Servlet implementation class IndexServlet
 */
@WebServlet("/thong-tin-ca-nhan")
public class UserAboutServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User user = (User) request.getAttribute("user");
		if (user != null) {
			var historys = HistoryData.withUserId(user.getId());
			request.setAttribute("historys", historys);
			PageInfo page = new PageInfo("Thông tin cá nhân", "about.jsp");
			page.forward(request, response);
		} else {
			response.sendRedirect("trang-chu");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
