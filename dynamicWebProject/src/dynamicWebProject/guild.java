package dynamicWebProject;

import java.sql.SQLException;

public class guild {

	public static boolean addGuild(String guildname, String member, boolean leader){
		
		String l_in[] = {"guild_title,char_name,leaderflag"};
		String l_in2[] = {guildname,member, Boolean.toString(leader)};
		
		try {
			dbconnector.insertStatement("guild",l_in,l_in2);
			return true;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean guildExists(String guildname){
		
		try {
			dbconnector.selectStatement("*", "guild", "guild_title =" + guildname, null);
			return true;
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}

	}
	
	//methods to get guild, get users of guilds
}
