package com.kim0815.jsp04.connect;

import java.sql.*;

public class JDBCConnect {
    Connection conn;
    //query를 날리기 위한 객체
    PreparedStatement pstmt;
    // select 에서 값 받아오기..
    ResultSet rs;
    public JDBCConnect() {
        {
            try {
                Class.forName("oracle.jdbc.OracleDriver");
                String url = "jdbc:oracle:thin:@localhost:1521:xe";
                String id = "jin0815";
                String password = "1234";
                //외부에 있는 파일이라 try catch문 안에
                conn = DriverManager.getConnection(url, id, password);
                System.out.println("db connect");
            } catch (SQLException e) {
                throw new RuntimeException(e);
            } catch (ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
        }
    }
    public void close() {
        // ip aws
        //pool  연결할 수 있는 것들 모아두기
        try {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
            System.out.println("jdbc disconnect");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

}

