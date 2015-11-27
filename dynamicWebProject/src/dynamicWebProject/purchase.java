package dynamicWebProject;

public class purchase {
	
	public static boolean addPurchase(int account, String card, String cardtype, int amount, int date){
		
		String l_in[] = {"account_number","card_number","card_type","transaction_amt","date"};
		String l_in2[] = {Integer.toString(account), card, cardtype, Integer.toString(amount),Integer.toString(date)};
		
		try {
			dbconnector.insertStatement("purchase_table",l_in,l_in2);
			return true;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return false;
		}
		
	}
	
	
	
	
	
	
	
}
