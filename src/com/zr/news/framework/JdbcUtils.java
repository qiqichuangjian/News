package com.zr.news.framework;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * @Acthor:孙琪; date:2019/3/24;
 */
public class JdbcUtils {

    private static String driverClassName="com.mysql.cj.jdbc.Driver";
    private static String url="jdbc:mysql:///news?serverTimezone=UTC";
    private static String user="root";
    private static String password="123456";
    private static Connection connection;
    /*
        1. 知识点学了，不知道怎么用
        2. 学了知识点，用的时候全忘了
        3. 之前的知识和现在的知识不能混合使用
     */

    public static Connection getConnection(){

        try {
            Class.forName(driverClassName);
            connection = DriverManager.getConnection(url,user,password);
            return connection;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void close(){
        if(connection!=null){
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

}
