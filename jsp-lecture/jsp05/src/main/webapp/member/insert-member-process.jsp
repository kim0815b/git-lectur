<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Date" %>
<%@ page import="com.kim0815.jsp05.connect.JDBCConnect" %>
<%@ page import="com.kim0815.jsp05.utills.ScirptWriter" %>
<%@ page import="com.kim0815.jsp05.connect.JDBCConnectionPool" %>
<%--
  Created by IntelliJ IDEA.
  User: jhta
  Date: 2024-05-10
  Time: 오전 10:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // frame work
    // 데이터 받기
    String userID = request.getParameter("userID");
    String userPW = request.getParameter("userPW");
    String userName = request.getParameter("userName");
    String userBirth = request.getParameter("userBirth");
    //String 던져도 알아서 들어간다.
//    JDBCConnect jdbcConnect = new JDBCConnect();
    //설정파일 web.xml 서버 재가동하는게 좋다.
    //web.xml에 아이디 비밀번호 저장해두고 쓰기
    //JDBCConnect jdbcConnect = new JDBCConnect(application);
    //pool을 넣어서 사용
    JDBCConnectionPool jdbcConnectionPool = new JDBCConnectionPool();

   //sql injection
   String sql = "insert into member values(member_seq.nextval,?,?,?,?)"; // sql
   PreparedStatement pstmt = jdbcConnectionPool.conn.prepareStatement(sql);
   pstmt.setString(1,userID); //"insert into member values(?,?,?)" 이 구문에 다른 물음표 제한 다른 메개변수가 있어서
   pstmt.setString(2,userPW); // setString()에서 숫자는 꼭 물음표 수만 센다
   pstmt.setString(3,userName);
   pstmt.setString(4,userBirth);
   int result = pstmt.executeUpdate();
    if (result > 0) {
        //일반 경고창만 뜨는 경우, 경고창 띄우고 페이지 바뀌는 경우, 경고창 띄우고 뒤로 빽하기
//        out.println("<script>alert(\"회원가입 되었습니다.\") location.href=\"index.jsp\"</script>");
        ScirptWriter.alertAndNext(response,"회원가입 되었습니다.","index.jsp");
    } else {
        ScirptWriter.alertAndBack(response,"회원가입 되지 않았습니다. 다시 가입해 주세요.");
//        out.println("<script>alert(\"회원가입 안되었습니다.\") history.back();</script>");
    }
//    jdbcConnect.close();
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>