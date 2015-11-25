package dynamicWebProject;

public class quest {

	public static boolean addQuest(String questname){
		String l_in[] = {"quest_title"};
		String l_in2[] = {questname};
		
		try {
			dbconnector.insertStatement("quests",l_in,l_in2);
				
			return true;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return false;
		}

	}
	
	public static boolean completeQuest(String username, int questid){
		
		String l_in[] = {"quest_title"};
		String l_in2[] = {Integer.toString(questid)};
		
		try {
			dbconnector.updateStatement("user_quests",l_in,l_in2, "");
				
			return true;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return false;
		}
		
	}
	
	//other methods to get quest information
}
