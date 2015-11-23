package dynamicWebProject;
import java.io.File;
import java.io.IOException;
import java.sql.*;

import javax.sql.rowset.CachedRowSet;
import javax.sql.rowset.RowSetProvider;

import com.google.gson.JsonObject;
import com.mysql.jdbc.PreparedStatement;

public class dbconnector {
	
	// JDBC driver name and database URL
	   static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
	   static final String DB_URL = "jdbc:mysql://localhost:3306";
	   static final String DB_NAME = "wom.";

	   //  Database credentials
	   static final String USER = "root";
	   static final String PASS = "";
	   
	   
	   public static Connection getConnection() throws ClassNotFoundException{
		   try{
			   Class.forName("com.mysql.jdbc.Driver");
			   
			   return DriverManager.getConnection(DB_URL,"root","");
		   }
		   
		   catch(SQLException se){
			   return null;
		   }
		   
	   }
	   
	   public static CachedRowSet selectStatement(String select, String from, String where, String order) throws ClassNotFoundException, SQLException{
		   Connection conn = getConnection();
		   CachedRowSet cachedResults = null;
		   
		   String query = "Select " + select + " from " + DB_NAME + from;
		   
		   if(!where.equals("")){
			   //Where is not blank
			 query = query.concat(" where " + where);  
		   }
		   if(!order.equals("")){
			   //order is not blank
			   query = query.concat(" order by " + order);
		   }
		   
		   System.out.println("query="+query);
		   PreparedStatement sql=(PreparedStatement) conn.prepareStatement(query);
		   ResultSet results;
		   results=sql.executeQuery();
			
		   cachedResults = RowSetProvider.newFactory().createCachedRowSet();
		   cachedResults.populate(results);
			
		   //cachedResults.next();
		   
		   return cachedResults;
	   }
	   
	   public static boolean insertStatement(String into, String[] cols, String[] data) throws ClassNotFoundException{
		   Connection conn = getConnection();
		   
		   if(cols.length > 0 && data.length > 0){
			   //Check for the data length size
			   String query = "insert into "+ DB_NAME + into + " (";
			   
			   for(int i=0;i<cols.length;i++){
				   //For each Column, we add to the query
				   System.out.println("Adding:" + cols[i]);
				   query = query.concat(cols[i] +", ");
				   System.out.println("Query:" + query);
			   }
			   
			   	   query = query.substring(0, query.length() - 2);
			   
			   
			  query = query.concat(") values(");
			   
			   for(int i=0;i<cols.length;i++){
				   //For each value
				   query = query.concat(data[i] +", ");
			   }
			   
			   query = query.substring(0, query.length() - 2);
			   
			   query = query.concat(")");
			   
			   System.out.println("query="+query);
			   PreparedStatement sql;
			try {
				sql = (PreparedStatement) conn.prepareStatement(query);
				 sql.executeUpdate();
				 return true;
				 
			} catch (SQLException e) {
				e.printStackTrace();
				return false;
			}		
			   
		   }else{
			   
			   return false;
		   }
	   }
	   
	   public static boolean updateStatement(String into, String[] cols, String[] data) throws ClassNotFoundException{
		   Connection conn = getConnection();
		   
		   if(cols.length > 0 && data.length > 0){
			   //Check for the data length size
			   String query = "update "+ DB_NAME + into + " (";
			   
			   for(int i=0;i<cols.length;i++){
				   //For each Column, we add to the query
				   System.out.println("Adding:" + cols[i]);
				   query = query.concat(cols[i] +", ");
				   System.out.println("Query:" + query);
			   }
			   
			   	   query = query.substring(0, query.length() - 2);
			   
			   
			  query = query.concat(") set(");
			   
			   for(int i=0;i<cols.length;i++){
				   //For each value
				   query = query.concat(data[i] +", ");
			   }
			   
			   query = query.substring(0, query.length() - 2);
			   
			   query = query.concat(")");
			   
			   System.out.println("query="+query);
			   PreparedStatement sql;
			try {
				sql = (PreparedStatement) conn.prepareStatement(query);
				 sql.executeUpdate();
				 return true;
				 
			} catch (SQLException e) {
				e.printStackTrace();
				return false;
			}		
			   
		   }else{
			   
			   return false;
		   }
	   }
	   
	   
	   public static void main(String[] args) throws IOException, ClassNotFoundException, SQLException {
			
		   //selectStatement("*","user","","");
		   
		   JsonObject j = new JsonObject();
		   
		   j = apiRequest.getQuest(1);
		   
		   System.out.println(j.get("title"));
		   
		   
		   
		 //  String l_in[] = {"first_name","last_name"};
		  // String l_in2[] = {"'NAMESET'","'NAMELAST'"};
		 // System.out.println(insertStatement("user",l_in,l_in2));
		   
		}
}

/*
 * Connection conn = null;
   Statement stmt = null;
   try{
      //STEP 2: Register JDBC driver
      Class.forName("com.mysql.jdbc.Driver");

      //STEP 3: Open a connection
      System.out.println("Connecting to database...");
      conn = DriverManager.getConnection(DB_URL,USER,PASS);

      //STEP 4: Execute a query
      System.out.println("Creating statement...");
      stmt = conn.createStatement();
      String sql;
      sql = "SELECT id, first, last, age FROM Employees";
      ResultSet rs = stmt.executeQuery(sql);

      //STEP 5: Extract data from result set
      while(rs.next()){
         //Retrieve by column name
         int id  = rs.getInt("id");
         int age = rs.getInt("age");
         String first = rs.getString("first");
         String last = rs.getString("last");

         //Display values
         System.out.print("ID: " + id);
         System.out.print(", Age: " + age);
         System.out.print(", First: " + first);
         System.out.println(", Last: " + last);
      }
      //STEP 6: Clean-up environment
      rs.close();
      stmt.close();
      conn.close();
   }catch(SQLException se){
      //Handle errors for JDBC
      se.printStackTrace();
   }catch(Exception e){
      //Handle errors for Class.forName
      e.printStackTrace();
   }finally{
      //finally block used to close resources
      try{
         if(stmt!=null)
            stmt.close();
      }catch(SQLException se2){
      }// nothing we can do
      try{
         if(conn!=null)
            conn.close();
      }catch(SQLException se){
         se.printStackTrace();
      }//end finally try
   }//end try
   System.out.println("Goodbye!");
 */