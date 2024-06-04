<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.kim0815.jsp05.connect.JDBCConnectionPool" %><%--
  Created by IntelliJ IDEA.
  User: jhta
  Date: 2024-05-10
  Time: 오전 9:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //동적 로딩
    JDBCConnectionPool jdbcConnectionPool = new JDBCConnectionPool();
    //conn.setAutoCommit(false); 자동커밋 취소
    System.out.println("db connect");
    String sql = "insert into member values('kim110815','122334','최지훈')";
    PreparedStatement pstmt = jdbcConnectionPool.conn.prepareStatement(sql);
    int result = pstmt.executeUpdate();
    System.out.println(result);
%>


<html>
<head>
    <title>Title</title>
</head>
<body>
    <h1>db연결</h1>
    <%
        System.out.println("한글테스트");
    %>
</body>
</html>
