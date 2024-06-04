<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.kim0815.jsp05.utills.CookieManager" %>
<%@ page import="com.kim0815.jsp05.connect.JDBCConnect" %>
<%@ page import="com.kim0815.jsp05.utills.ScirptWriter" %>
<%@ page import="com.kim0815.jsp05.connect.JDBCConnectionPool" %><%--
  Created by IntelliJ IDEA.
  User: jhta
  Date: 2024-05-10
  Time: 오후 3:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String userID = request.getParameter("userID");
    String userPW = request.getParameter("userPW");
    System.out.println(userID+"==="+userPW);

//    JDBCConnect jdbcConnect = new JDBCConnect();
    JDBCConnectionPool jdbcConnectionPool = new JDBCConnectionPool();
    String sql = "delete from member where userId = ? and userPw = ?"; // sql
    PreparedStatement pstmt = jdbcConnectionPool.conn.prepareStatement(sql);
    pstmt.setString(1, userID);
    pstmt.setString(2, userPW);

    System.out.println(userID);
    System.out.println(userPW);
    int result = pstmt.executeUpdate(); //행에 영향을 미친 개수 리턴됨 0보다 크면 쿼리가 실행이 되어서 table에 영향을 미침
    System.out.println(result);
    if (result > 0) {
        session.invalidate(); // session 삭제
        CookieManager.deleteCookie(response, "loggedID");
        ScirptWriter.alertAndNext(response,"회원탈퇴되었습니다.","index.jsp");
//        out.println("<script>alert("+result+");location.href=\"index.jsp\";</script>");
    }
    pstmt.close();;
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>