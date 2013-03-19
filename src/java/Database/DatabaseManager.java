/*
 *  Copyright 2013 Jidong Chen, Inc. All rights reserved.
 * 
 */
package Database;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author nightwolf 陈纪栋
 */
public class DatabaseManager {

    private static ConnectionPool databasePool = new ConnectionPool();

    private static Statement getStatement() {
        Connection con = databasePool.getConnectionFromPool();
        Statement stmt = null;
        try {
            stmt = (Statement) con.createStatement();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        databasePool.returnConnectionToPool(con);
        return stmt;
    }

    public static ResultSet select(String sql) {

        Statement stmt = getStatement();
        ResultSet rs = null;
        try {
            rs = stmt.executeQuery(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    public static boolean insert(String sql) {

        Statement stmt = getStatement();
        try {
            return stmt.execute(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseManager.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
    
    public static int update(String sql){
        Statement stmt =getStatement();
        try {
            return stmt.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseManager.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
    }
    
    public static int delete(String sql){
         return update(sql) ;
    }
}
