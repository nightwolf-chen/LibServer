/*
 *  Copyright 2013 Jidong Chen, Inc. All rights reserved.
 * 
 */
package DWR;

import Database.DatabaseManager;
import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author nightwolf 陈纪栋
 */
public class DataUpdator {

    /**
     *
     * @return
     */
    public HashMap<String, String> getData() throws UnsupportedEncodingException, FileNotFoundException, IOException {

        HashMap<String, String> status = new HashMap<String, String>();
       
        String filePath = "C:\\Users\\nightwolf\\Documents\\NetBeansProjects\\LibServer\\location.txt";
        BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(filePath), "utf8"));
        String line = "";
        while ((line = br.readLine()) != null) {
            //System.out.println(line);
            String[] seats = line.split(",");
            if (seats.length < 3) {
                continue;
            }
            String name = seats[0];
            String is ;
            int tmp = (int)(Math.random()*1000);
            if(tmp%2==0){
                is ="true";
            }else{
                is="false" ;
            }
            status.put(name, is) ;
            
            //System.out.println(name+is) ;
        }
        
        status.put("a1", "false");
        return status;
    }
    
   public HashMap<String, String> getUsers() throws SQLException {
       HashMap<String, String> status = new HashMap<String, String>();
       
       ResultSet rs = DatabaseManager.select("select * from seat") ;
       while(rs.next()){
           String seatName = rs.getString("seatname") ;
           String userId = rs.getString("userid");
           //System.out.println(seatName+":"+userId) ;
           status.put(seatName, userId) ;
       }
        
       return status;
   }
   
   public HashMap<String, String> getStatus() throws SQLException {
       HashMap<String, String> status = new HashMap<String, String>();
       
       ResultSet rs = DatabaseManager.select("select * from seat") ;
       while(rs.next()){
           String seatName = rs.getString("seatname") ;
           String curStatus = rs.getString("status");
           //System.out.println(seatName+":"+userId) ;
           status.put(seatName, curStatus) ;
       }
       return status;
   }
   
   
    public static void main(String[] args) throws SQLException{
       
            HashMap<String, String> data2 = new DataUpdator().getStatus();
    }
}
