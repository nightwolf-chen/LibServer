/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package DWR;

import Database.DatabaseManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Administrator
 */
public class FriendsOperator {

    String[] friends;

    public String[] getFriends(String user) {
        ResultSet rs = DatabaseManager.select("select fusername from friends where username='" + user + "'");
        ArrayList<String> f = new ArrayList<String>();
        try {
            while (rs.next()) {
                //System.out.println(rs.getNString("fusername"));
                f.add(rs.getString("fusername"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(FriendsOperator.class.getName()).log(Level.SEVERE, null, ex);
        }
        friends = new String[f.size()];
        for (int i = 0; i < f.size(); i++) {
            friends[i] = f.get(i);
        }
        return friends;
    }

    public int addFriend(String uandf) {
        String[] t = uandf.split("@");
        String user = t[0];
        String friend = t[1];
        DatabaseManager.insert("insert into friends (username,fusername) values (" + user + "," + friend + ")");
        return 1;
    }

    public void deleteFriend(String uandf) {
        String[] t = uandf.split("@");
        String user = t[0];
        String friend = t[1];
        DatabaseManager.delete("delete from friends where username='"+user+"' and fusername='"+friend+"'");
    }
}
