<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.kim0815.jsp05.connect.JDBCConnect" %>
<%@ page import="com.kim0815.jsp05.connect.JDBCConnectionPool" %><%--
  Created by IntelliJ IDEA.
  User: jhta
  Date: 2024-05-10
  Time: 오후 2:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //db연결 조회해서 resultset에 값 담아서 아래쪽에 뿌리기.
    String userId =(String) session.getAttribute("userID");
//    JDBCConnect jdbcConnect = new JDBCConnect();
    JDBCConnectionPool jdbcConnectionPool = new JDBCConnectionPool();
    String sql = "SELECT * from member where userId = ?"; // sql
    PreparedStatement pstmt = jdbcConnectionPool.conn.prepareStatement(sql);
    pstmt.setString(1, userId);
    ResultSet rs = pstmt.executeQuery();

    String userName = "";
    String birth = "";
    int no = 0;
    if (rs.next()) {
        no = rs.getInt("no");
        userName = rs.getString("userName");
        birth = rs.getString("birth");
    }
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <div>no : <%=no%></div>
    <div>id : <%=userId%></div>
    <div>이름 : <%=userName%></div>
    <div>생년월일 : <%=birth%></div>
    <a href="delete-member.jsp">회원탈퇴</a>
</body>
</html>
