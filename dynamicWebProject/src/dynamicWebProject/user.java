package dynamicWebProject;
import java.sql.SQLException;

import dynamicWebProject.dbconnector;

public class user {

	public static boolean addUser(String username, String first, String last){
		//Creates a User, returns a account id
		String l_in[] = {"user_name,first_name,last_name"};
		String l_in2[] = {username,first, last};
		
		try {
			dbconnector.insertStatement("user",l_in,l_in2);
			return true;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean userExists(String username, int account){
			try {
				dbconnector.selectStatement("*","user","","");
				return true;
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
				return false;
			}
	}
	
	
}
