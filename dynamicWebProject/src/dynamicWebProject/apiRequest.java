package dynamicWebProject;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

public class apiRequest {

	
	public static JsonObject getQuest(int questID) throws IOException{
		
		URL request = new URL("https://us.api.battle.net/wow/quest/" + questID +"?locale=en_US&apikey=9uyk8253nk5hc4ap2ue45bb5mbqtuvhm");
        URLConnection uc = request.openConnection();
        BufferedReader in = new BufferedReader(
                                new InputStreamReader(
                                uc.getInputStream()));
        String inputLine, output = "";
        
        while ((inputLine = in.readLine()) != null) {
        	output += inputLine + "\n";
        }
        JsonParser parser = new JsonParser();
        
        JsonObject o = parser.parse(output).getAsJsonObject();
        
        System.out.println(o.toString());
        in.close();
        
        return o;
		
	}
	
}
