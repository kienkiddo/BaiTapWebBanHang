package controller.home;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import commom.PageInfo;
import commom.Resource;
import commom.Security;
import io.CartData;
import io.HistoryData;
import io.ItemData;
import model.Cart;
import model.CartItem;
import model.User;

/**
 * Servlet implementation class IndexServlet
 */
@WebServlet("/don-hang")
public class BillServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getAttribute("user");
		if (user != null) {
			int id = Integer.parseInt(request.getParameter("id"));
			var history = HistoryData.withId(id);
			if (history == null || history.getUserId() != user.getId()) {
				PageInfo.page404NotFound(request, response);
			} else {
				
				request.setAttribute("history", history);
				var item = history.getBills().get(0).getItem();
	
				PageInfo page = new PageInfo("Lịch sử đơn hàng", "bill.jsp");
				page.forward(request, response);
			}
	
		} else {
			response.sendRedirect("trang-chu");
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

}
