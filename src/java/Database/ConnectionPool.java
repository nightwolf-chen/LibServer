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
    private String DatabaseName = "libserver";
    private final String Encode = "utf8";
    private String ServerHost = "192.168.235.39";
    private String port = "3306";
    private String conStr = "jdbc:mysql://" + ServerHost + ":" + port + "/" + DatabaseName + "?characterEncoding=" + Encode;
    private String userName = "libserver";
    private String passWord = "123";
    private final int MAX_CONNECTION_NUMBER = 8;
    private Stack<Connection> connections = new Stack<Connection>();

    /*"name":"d6d665aa69817406d8901cd145e05e3c6",9.       
     * "hostname":"mysql-node01.us-east-1.aws.af.cm",10.         
     * "host":"mysql-node01.us-east-1.aws.af.cm",11.        
     * "port":3306,12.          
     * "user":"uB7CoL4Hxv9Ny",13.       
     * "username":"uB7CoL4Hxv9Ny",14.       
     * "password":"pzAx0iaOp2yKB"
     *
     * 
     */
    public ConnectionPool() {
        //VCAP_SERVICES
        String databaseInfo = java.lang.System.getenv("VCAP_SERVICES");
        
        if (databaseInfo != null) {
         
        }
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

    public void returnConnectionToPool(Connection con) {
        connections.push(con);
    }
}
