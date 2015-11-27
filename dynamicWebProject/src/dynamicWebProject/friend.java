package dynamicWebProject;
import dynamicWebProject.dbconnector;

public class friend {

	public static boolean addFriend(int accountnum, String friend){
		
		String l_in[] = {"account_number,friend_name"};
		String l_in2[] = {Integer.toString(accountnum), friend};
		
		
		try {
			dbconnector.insertStatement("user_friends", l_in, l_in2);
			return true;
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		
	}
	
	public static boolean deleteFriend(String username, String friend){
		
		
		return true;
	}
	
	//other methods to get friends list
}
