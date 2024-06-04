<%--<%@ page import="com.kim0815.jsp05.utills.CookieManager" %>--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%
    String loggedID = CookieManager.readCookie(request, "loggedID");
    String isChecked = "";
    if (loggedID.equals("")) {
        isChecked = "checked";
    }
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="include/header.jsp"%>

<main class="form-signin w-100 m-auto">
    <form action="login-member-process.jsp" method="post">
<%--        <img class="mb-4" src="/docs/5.3/assets/brand/bootstrap-logo.svg" alt="" width="72" height="57">--%>
        <h1 class="h3 mb-3 fw-normal">Please log in</h1>

        <div class="form-floating">
            <input type="text" class="form-control" id="floatingInput" placeholder="name@example.com" name = "userID">
            <label for="floatingInput">User ID</label>
        </div>
        <div class="form-floating">
            <input type="password" class="form-control" id="floatingPassword" placeholder="Password" name = "userPW">
            <label for="floatingPassword">Password</label>
        </div>

        <div class="form-check text-start my-3">
            <input class="form-check-input" type="checkbox" value="yes" id="flexCheckDefault" name = "saveID">
            <label class="form-check-label" for="flexCheckDefault">
                Remember me
            </label>
        </div>
        <button class="btn btn-primary w-100 py-2" type="submit">Log in</button>
    </form>
</main>
</form>
<%@include file="include/footer.jsp"%>
