package dynamicWebProject;
import java.sql.SQLException;

import javax.sql.rowset.CachedRowSet;

import dynamicWebProject.dbconnector;

public class friend {

	public static boolean addFriend(String accountnum, String friend){
		
		String l_in[] = {"account_number,friend_name"};
		String l_in2[] = {accountnum, friend};
		
		
		try {
			dbconnector.insertStatement("user_friends", l_in, l_in2);
			return true;
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		
	}
	
	public static CachedRowSet getFriends(String account_number) {
		try {
			CachedRowSet c = dbconnector.selectStatement("*","user_friends"," account_number = '" + account_number + "' ","");
			
			
			return c;
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public static boolean deleteFriend(String account_number, String friend){
		try {
			dbconnector.deleteStatement("user_friends", "account_number = " + account_number + " AND " + "friend_name = '" + friend + "'");
			
			return true;
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
	
	//other methods to get friends list
}
