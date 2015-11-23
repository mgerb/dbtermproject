package dynamicWebProject;

public class purchase {

	public static boolean storeCardInformation(String cardNumber, String firstname, String lastname){
		return true;

	
	
	
	
	}
	
	public static boolean addPurchase(int account, int amount, int date){
		
		String l_in[] = {"quest_title"};
		String l_in2[] = {Integer.toString(questid)};
		
		try {
			dbconnector.insertStatement("user",l_in,l_in2);
				
			return true;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return false;
		}
		
	}
	
	
	
	
	
	
	
}
