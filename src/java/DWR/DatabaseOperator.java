/*
 *  Copyright 2013 Jidong Chen, Inc. All rights reserved.
 * 
 */
package DWR;

import Database.DatabaseManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author nightwolf 陈纪栋
 */
public class DatabaseOperator {

    public void addPost(String title, String content, String username) {

        DatabaseManager.insert("insert into post(post_userid,content,title) values('" + username + "','" + content + "','" + title + "')");
    }

    public void delPost(String postId) {
        DatabaseManager.delete("delete from post where postid='" + postId + "'");
        delPostComments(postId);
    }

    public void delPostComments(String postId) {
        DatabaseManager.delete("delete from post_comments where postid='" + postId + "'");
    }

    public void addPostComment(String username, String content, String postId) {

        System.out.println(username + content + postId);
        DatabaseManager.insert("insert into post_comments(userid,content,postid) values('" + username + "','" + content + "','" + postId + "')");

    }

    public String getEmptySeatNumber() {
        try {
            ResultSet rsEmptySeat = DatabaseManager.select("select count(seatname) from seat where userid is null");
            rsEmptySeat.next();
            String emptySeatsNumber = rsEmptySeat.getString("count(seatname)");
            return emptySeatsNumber;

        } catch (SQLException ex) {
            Logger.getLogger(DatabaseOperator.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "0";
    }

    public void addNotice(String title, String content) {
        DatabaseManager.insert("insert into notice(title,content) values('" + title + "','" + content + "')");
    }

    public void delNotice(String nid) {
        DatabaseManager.delete("delete from notice where nid='" + nid + "'");
    }

    public void sendMessage(String sender, String reciever, String content) {
        DatabaseManager.insert("insert into message(senderid,reciever,content) values('" + sender + "','" + reciever + "','" + content + "')");
    }

    public void delMessage(String messageId) {
        DatabaseManager.delete("delete from message where messageid='" + messageId + "'");
    }

    public void delFriend(String username, String fUsername) {
        DatabaseManager.delete("delete from friends where username='" + username + "' and fusername='" + fUsername + "'");
    }

    public HashMap<String,String> getTestSeat() throws SQLException {
        
        HashMap<String, String> status = new HashMap<String, String>();
        ResultSet rs = DatabaseManager.select("select * from seat_status");
        while (rs.next()) {
            String seatName = rs.getString("seatid");
            String curStatus = rs.getString("status");
            //System.out.println(seatName+":"+userId) ;
            status.put(seatName, curStatus);
        }
        return status;
    }
}
