package controller.home;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import commom.PageInfo;
import commom.Security;
import io.UserData;
import model.User;

/**
 * Servlet implementation class IndexServlet
 */
@WebServlet("/dang-ky")
public class RegisterServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getAttribute("user");
		if (user != null) {
			response.sendRedirect("trang-chu");
		} else {
			PageInfo page = new PageInfo("Đăng ký", "register.jsp");
			page.forward(request, response);
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");
		String message = "";
		if (name.length() < 4 || name.length() > 128) {
			message = "Họ tên phải từ 4 đến 16 ký tự";
		} else if (pass.length() < 4 || pass.length() > 16) {
			message = "Mật khẩu phải từ 4 đến 16 kí tự";
		} else if (!phone.startsWith("0") || phone.length() < 8 || phone.length() > 12) {
			message = "Số điện thoại phải bắt đầu từ số 0 và từ 8 đến 12 ký tự";
		} else if (!email.contains("@")) {
			message = "Vui lòng nhập đúng định dạng Email";
		} else if (UserData.isEmail(email)) {
			message = "Email đã tồn tại";
		} else {
			HttpServletRequest httpRequest = (HttpServletRequest) request;
			Cookie[] cookies = httpRequest.getCookies();
			String hashkey = Security.getHashkey(cookies);
			if (hashkey == null) {
				hashkey = Security.creatHashkey();
			}
			if (UserData.insert(new User(name, phone, email, pass, hashkey))) {
				message = "OK";
				Security.setCookieLogin(email, Security.getMd5(pass), hashkey, response);
			} else {
				message = "Đã xảy ra lỗi, vui lòng thử lại";
			}
		}
		response.getWriter().print(message);
	}

}
