package dynamicWebProject;

import java.io.IOException;
import java.sql.SQLException;

import javax.sql.rowset.CachedRowSet;

import com.google.gson.JsonObject;

public class quest {

	public static boolean addQuest(String questID, String questname, String reqLevel){
		String l_in[] = {"quest_id, quest_title, quest_reqlvl"};
		String l_in2[] = {questID, questname, reqLevel};
		
		try {
			dbconnector.insertStatement("quests",l_in,l_in2);
				
			return true;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return false;
		}

	}
	
	//uses blizzard api to add quests from an id range
	public static void populateQuests(int from, int to) throws IOException{
		
		for(int i = from; i < to; i++){
			
			JsonObject o = apiRequest.getQuest(i);
			
			
			if (o != null) {
				String id = o.get("id").getAsString();
				String title = o.get("title").getAsString();
				String reqLevel = o.get("reqLevel").getAsString();
				
				title = title.replace("'", "\\'");
				
				quest.addQuest(id, title, reqLevel);
			}
			
		}
		
	}
	
	//add quest by single id
	public static void addQuestById(int id) throws IOException{
		JsonObject o = apiRequest.getQuest(id);
		
		if (o != null){
			String i = o.get("id").getAsString();
			String title = o.get("title").getAsString();
			String reqLevel = o.get("reqLevel").getAsString();
			
			title = title.replace("'", "\\'");
			
			quest.addQuest(i, title, reqLevel);
		}
	}
	
	//get all available quests	
	public static CachedRowSet getAllQuests(){
		try {
			CachedRowSet c = dbconnector.selectStatement("*","quests","","quest_reqlvl");
			
			return c;
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public static void deleteQuest(String quest_id){
		try {
			dbconnector.deleteStatement("quests", "quest_id = '" + quest_id + "'");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	}
