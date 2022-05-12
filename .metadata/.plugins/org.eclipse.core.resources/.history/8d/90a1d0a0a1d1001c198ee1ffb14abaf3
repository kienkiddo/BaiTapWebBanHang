package fitter;

import java.io.IOException;
import java.net.http.HttpResponse;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebFilter("/admin/*")
public class AdminFilter extends HttpFilter implements Filter {
       
    public AdminFilter() {
        super();
    }

	public void destroy() {
	}

	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
		/*
		HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        HttpSession session = request.getSession();
        var logged = session.getAttribute("logged");
        if (logged != null) {
    		chain.doFilter(request, response);
        } else {
        	response.sendRedirect("admin-dang-nhap");
        }
        */
		chain.doFilter(req, res);
		
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}
