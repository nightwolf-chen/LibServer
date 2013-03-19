/*
 *  Copyright 2013 Jidong Chen, Inc. All rights reserved.
 * 
 */
package Database;

import com.mysql.jdbc.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Stack;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author nightwolf 陈纪栋
 */
public class ConnectionPool {

    private final String driver = "com.mysql.jdbc.Driver";
    private final String DatabaseName = "libserver";
    private final String Encode = "utf8";
    private final String ServerHost = "localhost";
    private final String conStr = "jdbc:mysql://" + ServerHost + ":3306/" + DatabaseName + "?characterEncoding=" + Encode;
    private final String userName = "root";
    private final String passWord = "466202783";
    private final int MAX_CONNECTION_NUMBER = 50;
    private Stack<Connection> connections = new Stack<Connection>();

  
    public ConnectionPool() {
        for (int i = 0; i < MAX_CONNECTION_NUMBER; i++) {
            Connection con = getConnection();
            connections.push(con);
        }
    }

    private Connection getConnection() {
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ConnectionPool.class.getName()).log(Level.SEVERE, null, ex);
        }
        Connection con = null;
        try {
            con = (Connection) DriverManager.getConnection(conStr, userName, passWord);
        } catch (SQLException ex) {
            Logger.getLogger(ConnectionPool.class.getName()).log(Level.SEVERE, null, ex);
        }
        return con;
    }

    private String getConnectionStr() {
        return "jdbc:mysql://" + ServerHost + ":3306/" + DatabaseName + "?characterEncoding=" + Encode;
    }

    public Connection getConnectionFromPool() {
        if (connections.isEmpty()) {
            connections.push(getConnection());
        }
            return connections.pop();
    }
    
    public void returnConnectionToPool(Connection con){
            connections.push(con);
    }
}
