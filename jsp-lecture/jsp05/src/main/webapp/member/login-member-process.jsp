<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.kim0815.jsp05.utills.CookieManager" %>
<%@ page import="com.kim0815.jsp05.connect.JDBCConnectionPool" %><%--
  Created by IntelliJ IDEA.
  User: jhta
  Date: 2024-05-10
  Time: 오전 11:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String userID = request.getParameter("userID");
    String userPW = request.getParameter("userPW");
    String saveID = request.getParameter("saveID");

    JDBCConnectionPool jdbcConnectionPool = new JDBCConnectionPool();
    String sql = "Select * from member where userID = ? and userPW = ? ";
    PreparedStatement pstmt = jdbcConnectionPool.conn.prepareStatement(sql);
    pstmt.setString(1,userID);
    pstmt.setString(2,userPW);
    ResultSet rs = pstmt.executeQuery();
    //결과 돌려주기
    if (rs.next()) {
        //로그인 됐음
        String userid = rs.getString("userid");
        String userName = rs.getString("username");
//        System.out.println(userID + "==" + userName);
        if (saveID != null && saveID.equals("yes")) {
            //쿠키설정
            CookieManager.createCookie(response, "loggedID", userid, 60 * 60 * 24 * 365);
        } else {
            CookieManager.deleteCookie(response, "loggedID");
        }
        session.setAttribute("userID", userid); // "" < session에 넣는 키값
        session.setAttribute("userName", userName);
        response.sendRedirect("index.jsp");
    } else {
        response.sendRedirect("login.jsp");
    }
%>