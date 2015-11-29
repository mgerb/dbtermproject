package dynamicWebProject;

import java.sql.SQLException;

import javax.sql.rowset.CachedRowSet;

public class purchase {
	
	public static boolean addPurchase(String account, String card, String cardtype, String first_name, String last_name, String date){
		
		String l_in[] = {"account_number","card_number","card_type","first_name", "last_name", "date"};
		String l_in2[] = {account, card, cardtype, first_name, last_name, date};
		
		try {
			dbconnector.insertStatement("purchase_table",l_in,l_in2);
			return true;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return false;
		}
		
	}
	
	public static boolean checkSubscription(String account){
		try {
			CachedRowSet c = dbconnector.selectStatement("*","purchase_table"," account_number = '" + account + "' ","");
			
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
	
	public static boolean deleteSubscription(String account, String date){
		try {
			dbconnector.deleteStatement("purchase_table", "account_number = '" + account + "' AND date = '" + date + "'");
			
			return true;
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
	
	
}
