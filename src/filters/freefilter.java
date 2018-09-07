package filters;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class freefilter extends HttpFilter{
	
	
	@Override
	protected void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpSession session = request.getSession();
		Cookie[] ar = request.getCookies();
		System.out.println("ÄíÅ°¿©ºÎ = "+ar.length);
		String freepass=null;
		if (ar!=null) {
			for(int i=0;i<ar.length;i++) {
				if (ar[i].getName().equals("keep")) {
					freepass=ar[i].getValue();
				}
			}
		}else {
			
		}
		if (freepass!=null) {
			request.getSession().setAttribute("auth", true);
			request.getSession().setAttribute("logid", freepass);
		}else {
			response.sendRedirect(request.getContextPath()+"/login.jsp");
		}
	}
//	@Override
//	private void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain) 
//		throws IOException, ServletException {
//			//HttpSession session = request.getSession();
//			Cookie[] ar = request.getCookies();
//			System.out.println("ÄíÅ°¿©ºÎ = "+ar.length);
//			if (ar!=null) {
//				for(int i=0;i<ar.length;i++) {
//				}
//				chain.doFilter(request,response);
//			}else {
//				response.sendRedirect(request.getContextPath()+"/login.jsp");
//			}
//			
//
//	}
}
