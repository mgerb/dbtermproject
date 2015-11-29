package dynamicWebProject;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.sql.rowset.CachedRowSet;

import java.sql.*;

/** Simple servlet used to test server. */

public class servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			HttpSession session = request.getSession();
			System.out.println("session: " + session.getAttribute("username"));
			
			System.out.println(request.getRequestURI());
			
			String account_number = (String) session.getAttribute("account_number");
			
			if (request.getRequestURI().equals("/dynamicWebProject/index")){
				
				if(account_number != null){
					if (purchase.checkSubscription((String)session.getAttribute("account_number"))){
						request.setAttribute("subscriptionActive", "true");
						
						CachedRowSet cUserData = user.getUserData(account_number);
						CachedRowSet cUserFriends = friend.getFriends(account_number);
						CachedRowSet cUserQuests = quest.getUserQuests(account_number);
						CachedRowSet cAvailableQuests = quest.getAvailableQuests();
						
						request.setAttribute("cAvailableQuests", cAvailableQuests);
						request.setAttribute("cUserQuests", cUserQuests);
						request.setAttribute("cUserData", cUserData);
						request.setAttribute("cUserFriends", cUserFriends);
					}
				}
				
				RequestDispatcher rd = request.getRequestDispatcher("index1.jsp");
			
				rd.forward(request, response);
			}
			
			else if (request.getRequestURI().equals("/dynamicWebProject/login")){
				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			
				rd.forward(request, response);
			}
			else if (request.getRequestURI().equals("/dynamicWebProject/register")){
				RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
			
				rd.forward(request, response);
			}
			else if (request.getRequestURI().equals("/dynamicWebProject/logout")){
				session.removeAttribute("username");
			
				response.sendRedirect("/dynamicWebProject/index");
			}
			else if (request.getRequestURI().equals("/dynamicWebProject/subscription")){
				RequestDispatcher rd = request.getRequestDispatcher("subscription.jsp");
			
				rd.forward(request, response);
			}
			
			else if (request.getRequestURI().equals("/dynamicWebProject/admin")){
				RequestDispatcher rd = request.getRequestDispatcher("admin.jsp");
				
				rd.forward(request, response);
			}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
			IOException {
		HttpSession session = request.getSession();
		
		//handle login - check if credentials are correct and then start session
		if (request.getRequestURI().equals("/dynamicWebProject/login")){
			String username = (String) request.getParameter("username");
			String password = (String) request.getParameter("password");
			
			CachedRowSet c = user.login(username, password);
			
			try {
				if (c.next()){
					
					if (c.getString(5).equals(password)){
						session.setAttribute("username", c.getString(2));
						session.setAttribute("account_number", c.getString(1));
						
						response.sendRedirect("/dynamicWebProject/index");
					}
					
					else {
						request.setAttribute("message", "Incorrect login information");
						
						RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
						
						rd.forward(request, response);
					}
				}
				
				else {
					request.setAttribute("message", "Incorrect login information");
					
					RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
					
					rd.forward(request, response);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		
		
		//handle registration information
		if (request.getRequestURI().equals("/dynamicWebProject/register")){
			
			String username = (String) request.getParameter("username");
			String password = (String) request.getParameter("password");
			String firstName = (String) request.getParameter("firstName");
			String lastName = (String) request.getParameter("lastName");
			
			System.out.println(username + " " + password + " " + firstName + " " + lastName);
			//if username does not already exist
			if (!user.userExists(username)){
				
				if (user.addUser(username, firstName, lastName, password)){
					request.setAttribute("message", "Account creation successful");
					
					String account_number = user.getAccountNumber(username);
					
					user.initUserData(account_number);
					
					RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
					
					rd.forward(request, response);
				}
			}
			
			//if username already exists
			else {
				request.setAttribute("message", "Username already exists");
				
				RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
				
				rd.forward(request, response);
				
			}
			//query db to check and see if user exists - if so set session equal to username
		}
		
		if (request.getRequestURI().equals("/dynamicWebProject/subscription")){
			String card_number = (String) request.getParameter("card_number");
			String card_type = (String) request.getParameter("card_type");
			String first_name = (String) request.getParameter("first_name");
			String last_name = (String) request.getParameter("last_name");
			String date = (String) request.getParameter("date");
			
			if (purchase.addPurchase((String)session.getAttribute("account_number"), card_number, card_type, first_name, last_name, date)){
				request.setAttribute("message", "Subscription added");
				
				RequestDispatcher rd = request.getRequestDispatcher("subscription.jsp");
				
				rd.forward(request, response);
			}
			
			else {
				request.setAttribute("message", "Subscription failed");
				
				RequestDispatcher rd = request.getRequestDispatcher("subscription.jsp");
				
				rd.forward(request, response);
			}
		}
		
		//add friend
		if (request.getRequestURI().equals("/dynamicWebProject/addfriend")){
			String addfriend = (String) request.getParameter("friend");
			String account_number = (String) session.getAttribute("account_number");
			
			if (user.userExists(addfriend)){
				if (friend.addFriend(account_number, addfriend)){
					response.sendRedirect("/dynamicWebProject/index");
				}
			}
			
			else {
				response.sendRedirect("/dynamicWebProject/index");
			}
		}
		
		//------------------ USING BLIZZARD API
		//add quest by range
		if (request.getRequestURI().equals("/dynamicWebProject/populateQuests")){
			
			String f = request.getParameter("from");
			String t = request.getParameter("to");
			
			int from = Integer.parseInt(f);
			int to = Integer.parseInt(t);
			quest.populateQuests(from, to);
			
			response.sendRedirect("/dynamicWebProject/admin");
		}
		
		//add quest by id
		if (request.getRequestURI().equals("/dynamicWebProject/addQuestByID")){
			
			String q = request.getParameter("quest");
			
			int qu = Integer.parseInt(q);
			
			quest.addQuestById(qu);
			
			response.sendRedirect("/dynamicWebProject/admin");
		}
}
	
}


