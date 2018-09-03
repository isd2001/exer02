package handlers;

import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class SessionHandler implements HttpSessionListener{
	
	public void sessionDestroyed(HttpSessionEvent se) {
		HttpSession session= se.getSession();
		ServletContext application = session.getServletContext();
		
		Set set= (Set)application.getAttribute("user");	
		String id =(String)session.getAttribute("logid");
		set.remove(id);
		application.setAttribute("user", set);
	}
	
}
