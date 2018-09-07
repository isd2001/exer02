package filters;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Locale;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class filter extends HttpFilter{
	
	@Override
	protected void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpSession session = request.getSession();
		// ����ڼ��ǿ� ������ ��Ÿ���� Ű�� ������ �α������� �����̷�Ʈ
		if (session.getAttribute("auth")!=null) {
			session.setAttribute("target", request.getRequestURI());
			chain.doFilter(request,response);
		}else {
			response.sendRedirect(request.getContextPath()+"/login.jsp");
		}
		
	}
	

	
	
}//end class
