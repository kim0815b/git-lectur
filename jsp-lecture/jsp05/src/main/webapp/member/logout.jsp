<%--
  Created by IntelliJ IDEA.
  User: jhta
  Date: 2024-05-10
  Time: 오후 12:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    session.invalidate();
    out.println("<script>alert(\"로그아웃되었습니다.\");location.href=\"login.jsp\";</script>");
    response.sendRedirect("login.jsp");
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
