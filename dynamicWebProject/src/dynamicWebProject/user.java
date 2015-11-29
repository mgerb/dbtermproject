package dynamicWebProject;
import java.sql.SQLException;

import javax.sql.rowset.CachedRowSet;

import dynamicWebProject.dbconnector;

public class user {

	public static boolean addUser(String username, String first, String last, String password){
		//Creates a User, returns a account id
		String l_in[] = {"user_name,first_name,last_name, password"};
		String l_in2[] = {username,first, last, password};
		
		try {
			dbconnector.insertStatement("user",l_in,l_in2);
			return true;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public static boolean userExists(String username){
			try {
				CachedRowSet c = dbconnector.selectStatement("*","user"," user_name = '" + username + "' ","");
				
				if (c.next()){
					return true;
				}
				else {
					return false;
				}
				
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
				return false;
			}
	}
	
	public static CachedRowSet login(String username, String password){
		try {
			CachedRowSet c = dbconnector.selectStatement("*","user"," user_name = '" + username + "' ","");
			
			return c;
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			return null;
		}
}
	
	public static boolean addQuest(String charname,int questid){
		String l_in[] = {"char_name","quest_id"};
		String l_in2[] = {charname,Integer.toString(questid)};
		
		try {
			dbconnector.insertStatement("user_quests",l_in,l_in2);
				
			return true;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return false;
		}

	}
	
	public static boolean completeQuest(String username, int questid){
		
		String l_in[] = {"completion"};
		String l_in2[] = {"1"};
		
		try {
			dbconnector.updateStatement("user_quests",l_in, l_in2, "user_quests.char_name = " + "'" + username + "' AND user_quests.quest_id = " + questid);
				
			return true;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public static CachedRowSet getUserData(String account_number){
		try {
			CachedRowSet c = dbconnector.selectStatement("*","user_data"," account_number = '" + account_number + "' ","");
			
			return c;
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public static boolean initUserData(String account_number){
		//Creates a User, returns a account id
				String l_in[] = {"account_number,char_level,quests_completed, image_path"};
				String l_in2[] = {account_number,"1", "0", ""};
				
				try {
					dbconnector.insertStatement("user_data",l_in,l_in2);
					return true;
				} catch (ClassNotFoundException e) {
					e.printStackTrace();
					return false;
				}
	}
	
	public static String getAccountNumber(String user_name){
		try {
			CachedRowSet c = dbconnector.selectStatement("*","user"," user_name = '" + user_name + "' ","");
			c.next();
			
			return c.getString(1);
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	//--------------------------------------------------- TO DO
	
	//increments quests completed for account number
	public static boolean incrementQuestsCompleted(String account_number){
		String l_in[] = {"account_number,char_level,quests_completed, image_path"};
		String l_in2[] = {account_number,"1", "0", ""};
		
		try {
			dbconnector.insertStatement("user_data",l_in,l_in2);
			return true;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	//increments character level based on incAmount
	public static boolean updateCharacterLevel(String account_number, int incAmount){
		String l_in[] = {"char_level"};
		String l_in2[] = {Integer.toString(incAmount)};
		
		try {
			dbconnector.updateStatement("user_data", l_in, l_in2, "account_number = " + account_number);
			return true;
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		
	}
	
	//updates image path for account
	public static boolean updateImagePath(String account_number, String path){
		String l_in[] = {"img_path"};
		String l_in2[] = {path};
		
		try {
			dbconnector.updateStatement("user_data", l_in, l_in2, "account_number = " + account_number);
			return true;
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
	
	
	
	//------------------------------------------------------
}
