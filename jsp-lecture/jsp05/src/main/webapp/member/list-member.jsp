<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.kim0815.jsp05.connect.JDBCConnectionPool" %><%--
  Created by IntelliJ IDEA.
  User: jhta
  Date: 2024-05-10
  Time: 오전 11:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    JDBCConnectionPool jdbcConnectionPool = new JDBCConnectionPool();
    String sql = "select * from member";
    PreparedStatement pstmt = jdbcConnectionPool.conn.prepareStatement(sql);
    ResultSet rs = pstmt.executeQuery(); //executeQuery() 의 리턴값은  resultSet
    /*if (rs.next()) {
        System.out.println(rs.getInt("no"));
        System.out.println(rs.getString("userID"));
        System.out.println(rs.getString("userPW"));
        System.out.println(rs.getString("username"));
        System.out.println(rs.getString("birth"));
//        System.out.println("gggggggg");
    }*/
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <table border="1" width="800px">
        <thead>
            <tr>
                <th>no</th>
                <th>id</th>
                <th>name</th>
                <th>birth</th>
            </tr>
        </thead>
        <tbody>
        <%
            while (rs.next()) {
                System.out.println("gogogogoog");
                out.println("<tr>");
                out.println("<td>"+rs.getInt("no")+ "</td>");
                out.println("<td>"+rs.getString("userID")+ "</td>");
                out.println("<td>"+rs.getString("userName")+ "</td>");
                out.println("<td>"+rs.getString("birth")+ "</td>");
                out.println("</tr>");
            }
        %>
        </tbody>
    </table>
</body>
</html>
