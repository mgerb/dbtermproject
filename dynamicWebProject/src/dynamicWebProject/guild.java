package dynamicWebProject;

import java.sql.SQLException;

import javax.sql.rowset.CachedRowSet;

public class guild {

	public static boolean addGuild(String guild_title, String account_number, String leader){
		
		String l_in[] = {"guild_title,account_number,leaderflag"};
		String l_in2[] = {guild_title, account_number, leader};
		
		try {
			dbconnector.insertStatement("guild",l_in,l_in2);
			return true;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public static boolean guildExists(String guild_title){
		
		try {
			CachedRowSet c = dbconnector.selectStatement("*", "guild", "guild_title ='" + guild_title + "'", "");
			
			if(c.next()){
				return true;
			}
			else {
				return false;
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}

	}
	
	public static CachedRowSet getGuildInfo(String account_number){
		try {
			CachedRowSet c = dbconnector.selectStatement("*", "guild join wom.user", "guild.account_number = user.account_number and guild_title = (select guild_title from wom.guild where account_number = '" + account_number + "')", "");
			
			if(c.next()){
				c.beforeFirst();
				return c;
			}
			
			else {
				return null;
			}
			
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	public static void deleteUserFromGuild(String account_number){
		try {
			dbconnector.deleteStatement("guild", "account_number = " + account_number);
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void deleteGuild(String account_number){
		try {
			dbconnector.deleteStatement("guild", "guild_title in (select * from (select guild_title from wom.guild where account_number = " + account_number + ") as x)");
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static boolean checkLeader(String account_number){
		try {
			CachedRowSet c = dbconnector.selectStatement("*", "guild", "account_number = " + account_number, "");
			
			if(c.next()){
				return c.getBoolean(3);
			}
			
			else {
				return false;
			}
			
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
	
	//get all guilds
	public static CachedRowSet getAllGuilds(){
		try {
			CachedRowSet c = dbconnector.selectStatement("*", "guild", "1 = 1 group by guild_title", "");
			
				return c;
			
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
}
