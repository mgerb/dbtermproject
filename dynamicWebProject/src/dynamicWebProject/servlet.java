package dynamicWebProject;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import org.apache.catalina.connector.Request;

/** Simple servlet used to test server. */

public class servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			
			rd.forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
			IOException {
	
}
	
}


