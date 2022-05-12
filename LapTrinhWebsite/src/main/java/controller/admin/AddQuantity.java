package controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import commom.PageInfo;
import commom.Util;
import io.ItemData;
import model.Info;

@WebServlet(urlPatterns = { "/admin/addQuantity" })

public class AddQuantity extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		var item = ItemData.withId(id);
		if (item != null) {
			request.setAttribute("item", item);
			PageInfo page = new PageInfo("AdminAdd Quantity", "addQuantity.jsp");
			page.setAdmin();
			page.forward(request, response);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action.equals("AddQuantity")) {
			int id = Integer.parseInt(request.getParameter("id"));
			int size = Integer.parseInt(request.getParameter("size"));
			int quantity = Integer.parseInt(request.getParameter("quantity"));
			String message = "";
			if  (size < 35 || size > 45) {
				message = "Thông tin chưa chính xác";
			}  else {
				var item = ItemData.withId(id);
				if (item != null) {
					boolean exist = false;
					Info[] infos = item.getInfos();
					for (var info : infos) {
						if (info.getSize() == size) {
							info.setQuantity(info.getQuantity() + quantity);
							exist = true;
						}
					}
					if (!exist) {
						Info[] infos2 = new Info[infos.length + 1];
						for (int i = 0; i < infos.length; i++) {
							infos2[i] = infos[i];
						}
						infos2[infos.length] = new Info(size, quantity);
						item.setInfos(infos2);
					}
					ItemData.updateInfo(item);
					Util.addNotify(request, "Thực hiện thành công");
					response.sendRedirect("addQuantity?id=" + item.getId());
				} else {
					message = "Thông tin chưa chính xác";
				}
			}
			request.setAttribute("message", message);
		} else if (action.equals("Refesh")){
			int id = Integer.parseInt(request.getParameter("id"));
			var item = ItemData.withId(id);
			if (item != null) {
				item.setInfos(new Info[0]);
				ItemData.updateInfo(item);
				response.getWriter().print("OK");
			}
		}
		
	}

}
