package controller.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import commom.PageInfo;
import io.BillData;
import io.HistoryData;
import io.ItemData;

@WebServlet(urlPatterns = { "/admin/billDetail" })
public class BillDetail extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		var history = HistoryData.withId(id);
		request.setAttribute("history", history);
		PageInfo page = new PageInfo("Admin Bill", "billDetail.jsp");
		page.setAdmin();
		page.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		int status = Integer.parseInt(request.getParameter("status")); 
		var history = HistoryData.withId(id);
		if (history != null && (status >= -1 && status <= 1)) {
			history.setStatus(status);
			HistoryData.updateStatus(history);
			if (status == 1) {
				for (var bill : history.getBills()) {
					var item = ItemData.withId(bill.getItemId());
					for (var info : item.getInfos()) {
						if (info.getSize() == bill.getSize()) {
							info.setQuantity(info.getQuantity() - bill.getQuantity());
						}
					}
					ItemData.updateInfo(item);
				}
			}
			response.getWriter().print("OK");
		}
	}

}
