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
public class SeatsOperator {

    String[] seats;

    public String[] getSeats(String user) {
        ResultSet rs = Database.DatabaseManager.select("select seatname from seat where seatid in(select distinct(seatid) from users,favorite where users.userid=favorite.userid and username=" + user + ")");
        ArrayList<String> s = new ArrayList<String>();
        try {
            while (rs.next()) {
                //System.out.println(rs.getNString("fusername"));
                s.add(rs.getNString("seatname"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(FriendsOperator.class.getName()).log(Level.SEVERE, null, ex);
        }
        seats = new String[s.size()];
        for (int i = 0; i < s.size(); i++) {
            seats[i] = s.get(i);
        }
        return seats;
    }

    public void addSeat(String uands) {
        try {
            String t[] = uands.split("@");
            String user = t[0];
            String seat = t[1];
            String userid = "";
            String seatid = "";

            ResultSet rs = DatabaseManager.select("select userid from users where username='" + user + "'");
            if (rs.next()) {
                userid = rs.getString("userid");
            }

            rs = DatabaseManager.select("select seatid from seat where seatname='" + seat + "'");
            if (rs.next()) {
                seatid = rs.getString("seatid");
            }

            DatabaseManager.insert("insert into favorite (userid,seatid) values (" + userid + "," + seatid + ")");
        } catch (SQLException ex) {
            Logger.getLogger(SeatsOperator.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteSeat(String uands) {
        try {
            String t[] = uands.split("@");
            String user = t[0];
            String seat = t[1];
            String userid = "";
            String seatid = "";

            ResultSet rs = DatabaseManager.select("select userid from users where username='" + user + "'");
            if (rs.next()) {
                userid = rs.getString("userid");
            }

            rs = DatabaseManager.select("select seatid from seat where seatname='" + seat + "'");
            if (rs.next()) {
                seatid = rs.getString("seatid");
            }

            DatabaseManager.insert("delete from seat where userid='"+userid+"' and seatid='"+seatid+"'");
        } catch (SQLException ex) {
            Logger.getLogger(SeatsOperator.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
