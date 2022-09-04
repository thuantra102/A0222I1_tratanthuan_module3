package dao;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;

public class ConfigurationDB {
    public static Connection getConnection(){
        Connection connection = null;
        try{
            Context initContext = new InitialContext();
            Context envContext = (Context) initContext.lookup("java:comp/env");
            DataSource ds = (DataSource) envContext.lookup("jdbc/quoc");
            connection = ds.getConnection();
        }
        catch (SQLException| NamingException e){
            e.printStackTrace();
        }
        return connection;
    }
}
