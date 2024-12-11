package com.Staff;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class connclass {
    private static final String url = "jdbc:mysql://localhost:3306/user";
    private static final String uname = "root";
    private static final String pass = "0000";
    private Connection conn;

    public connclass() {
        try {
            conn = DriverManager.getConnection(url, uname, pass);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Connection getConnection() {
        return conn;
    }
}