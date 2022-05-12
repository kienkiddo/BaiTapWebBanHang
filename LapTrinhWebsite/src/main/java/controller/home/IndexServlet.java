package controller.home;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import commom.PageInfo;
import io.ItemData;

@WebServlet(urlPatterns = {"", "/trang-chu"})
public class IndexServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setAttribute("sales", ItemData.hotSale());
		request.setAttribute("news", ItemData.hotNew());
		System.out.println("size: " + ItemData.hotNew().size());
		PageInfo page = new PageInfo("Trang chủ", "index.jsp");
		page.forward(request, response);
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
