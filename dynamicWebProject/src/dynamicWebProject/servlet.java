package dynamicWebProject;

import java.io.*;
import java.net.URL;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
import javax.sql.rowset.CachedRowSet;

import org.apache.tomcat.util.http.fileupload.IOUtils;

import javafx.application.Platform;

import java.sql.*;

/** Simple servlet used to test server. */

@MultipartConfig
public class servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			HttpSession session = request.getSession();
			System.out.println("session: " + session.getAttribute("username"));
			
			System.out.println(request.getRequestURI());
			
			String account_number = (String) session.getAttribute("account_number");
			String user_name = (String) session.getAttribute("username");
			
			if (request.getRequestURI().equals("/dynamicWebProject/index")){
				
				if(account_number != null){
					if (purchase.checkSubscription((String)session.getAttribute("account_number"))){
						request.setAttribute("subscriptionActive", "true");
					}
					
					CachedRowSet cGuildInfo = guild.getGuildInfo(account_number);
					CachedRowSet cUserData = user.getUserData(account_number);
					CachedRowSet cUserFriends = friend.getFriends(account_number);
					CachedRowSet cUserQuests = user.getQuestLog(account_number);
					CachedRowSet cAvailableQuests = user.getAvailableQuests(account_number);
					CachedRowSet cCompletedQuests = user.getCompletedQuests(account_number);
					
					request.setAttribute("cGuildInfo", cGuildInfo);
					request.setAttribute("cAvailableQuests", cAvailableQuests);
					request.setAttribute("cUserQuests", cUserQuests);
					request.setAttribute("cCompletedQuests", cCompletedQuests);
					request.setAttribute("cUserData", cUserData);
					request.setAttribute("cUserFriends", cUserFriends);
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
				CachedRowSet cAllQuests = quest.getAllQuests();
				CachedRowSet cAllUsers = user.getAllUsers();
				CachedRowSet cAllGuilds = guild.getAllGuilds();
				
				request.setAttribute("cAllGuilds", cAllGuilds);
				request.setAttribute("cAllQuests", cAllQuests);
				request.setAttribute("cAllUsers", cAllUsers);
				
				RequestDispatcher rd = request.getRequestDispatcher("admin.jsp");
				
				rd.forward(request, response);
			}
			
			//cancel subscription
			if (request.getRequestURI().equals("/dynamicWebProject/leaveGuild")){
				
				//if leader of guild delete guild
				if (guild.checkLeader(account_number)){
					guild.deleteGuild(account_number);
				}
				//if not leader of guild just leave the guild
				else {
					guild.deleteUserFromGuild(account_number);
				}
				
				response.sendRedirect("/dynamicWebProject/index");
			}
			
			//cancel subscription
			if (request.getRequestURI().equals("/dynamicWebProject/cancelSubscription")){
				
				if (purchase.deleteSubscription(account_number)){
					System.out.println("subscription cancelled");
				}
				
				response.sendRedirect("/dynamicWebProject/index");
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
		
		//update subscription
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
		
		//add/remove friend
		if (request.getRequestURI().equals("/dynamicWebProject/addfriend")){
			String addfriend = (String) request.getParameter("friend");
			String account_number = (String) session.getAttribute("account_number");
			String add_remove_button = (String) request.getParameter("add_remove_button");
			
			if (add_remove_button.equals("Add")){
				if (user.userExists(addfriend)){
					if (friend.addFriend(account_number, addfriend)){
						System.out.println("friend added");
					}
				}
			}
			
			else if (add_remove_button.equals("Remove")){
				friend.deleteFriend(account_number, addfriend);
			}
			
			
			response.sendRedirect("/dynamicWebProject/index");
		
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
			//------------------------------------
			
		//add quest to user quest log
		if (request.getRequestURI().equals("/dynamicWebProject/addUserQuest")){
			
			String quest_id = request.getParameter("addquest_id");
			
			String account_number = (String) session.getAttribute("account_number");
			
			if (user.addQuest(account_number, quest_id)){
				
			}

			response.sendRedirect("/dynamicWebProject/index");
		}
		
		//complete a user quest
		if (request.getRequestURI().equals("/dynamicWebProject/completeUserQuest")){
			
			String quest_id = request.getParameter("completequest_id");
			
			String account_number = (String) session.getAttribute("account_number");
			
			if (user.completeQuest(account_number, quest_id)){
				if(user.incrementQuestsCompleted(account_number)){
					if(user.updateCharacterLevel(account_number)){
						System.out.println("quest " + quest_id + " completed");
					}
				}	
			}

			response.sendRedirect("/dynamicWebProject/index");
		}
		
		//delete quest from admin page
		if (request.getRequestURI().equals("/dynamicWebProject/deleteQuest")){
			String quest_id = request.getParameter("quest_id");
			
			quest.deleteQuest(quest_id);
			
			response.sendRedirect("/dynamicWebProject/admin");
		}
		
		//add or join guild - create guild if doesn't exist and add leader flag
		//join if guild does exist
		if (request.getRequestURI().equals("/dynamicWebProject/addGuild")){
			
			String guild_title = request.getParameter("guild_title");
			String account_number = (String) session.getAttribute("account_number");
			
			//join the guild if it exists
			if (guild.guildExists(guild_title)){
				if (guild.addGuild(guild_title, account_number, "0")){
					System.out.println("Joined guild");
				}
			}
			
			//create guild with leader flag 1
			else {
				if (guild.addGuild(guild_title, account_number, "1")){
					System.out.println("Created guild");
				}
			}
			
			response.sendRedirect("/dynamicWebProject/index");
		}
		
		
		//upload image
		if (request.getRequestURI().equals("/dynamicWebProject/imageUpload")){
			String account_number = (String) session.getAttribute("account_number");
			
			Part part = request.getPart("image");
			String fileName = part.getSubmittedFileName();
			
			//to access while running in eclipse
			
			/*
			Path path = Paths.get(request.getServletContext().getRealPath(""));
			String appPath = path.getParent().getParent().getParent().getParent().getParent().getParent().toString();
			//String appPath = request.getServletContext().getRealPath("");
			String savePath = appPath + File.separator + "dbtermproject/dynamicWebProject/WebContent/images/" + account_number;
			*/
			
			Path path = Paths.get(request.getServletContext().getRealPath(""));
			//String appPath = path.getParent().getParent().getParent().getParent().getParent().getParent().toString();
			//String appPath = request.getServletContext().getRealPath("");
			String savePath = path + File.separator + "/images/" + account_number;
			
			File fileSaveDir = new File(savePath);
	        if (!fileSaveDir.exists()) {
	            fileSaveDir.mkdir();
	        }
	            
	        part.write(savePath + File.separator + fileName);
	        
	        user.updateImagePath(account_number, "'images/" + account_number + "/"+ fileName + "'");
	        
			response.sendRedirect("/dynamicWebProject/index");
		}
		
		
}
	
}


