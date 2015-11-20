package dynamicWebProject;
import java.sql.SQLException;

import dynamicWebProject.dbconnector;

public class user {

	public static int createUser(String username, String first, String last){
		//Creates a User, returns a account id
		String l_in[] = {"first_name,last_name"};
		String l_in2[] = {first, last};
		
		try {
			dbconnector.insertStatement("user",l_in,l_in2);
			
			
			return 1;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return -1;
		}
	}
	
	public boolean userExists(String username, int account){
		
		try {
			dbconnector.selectStatement("*","user","","");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		
		return true;
	}
	
	
}
