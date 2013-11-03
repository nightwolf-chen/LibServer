/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package DWR;

import Database.DatabaseManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Administrator
 */
public class UserOperator {

    public User findUser(User user) {
        String username=user.getUsername();
        String password=user.getPassword();
        ResultSet rs = DatabaseManager.select("select * from users where username = '"+username+"' and password = '"+password+"'");
        try {
            if (rs.next()) {
                return user;
            } else {
                return null;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserOperator.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
