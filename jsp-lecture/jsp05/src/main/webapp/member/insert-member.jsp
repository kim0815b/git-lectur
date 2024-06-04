<%--
  Created by IntelliJ IDEA.
  User: jhta
  Date: 2024-05-10
  Time: 오전 10:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="include/header.jsp"%>
    <div class = "container">
        <h2>회원가입</h2>
        <form action="insert-member-process.jsp" method="post">
            <div class="mb-3">
                <label for="userID" class="form-label">User ID</label>
                <input type="text" class="form-control" id="userID" placeholder="User ID" name="userID">
                <button type="button" id="btn-duplication" class="btn btn-dark mt-2">아이디 중복 체크</button> <!-- type설정하지 않으면 form의 action 링크로 넘어감 -->
            </div>
            <div class="mb-3">
                <label for="userPW" class="form-label">PASSWORD</label>
                <input type="password" class="form-control" id="userPW" placeholder="userPW" name="userPW">
            </div>
            <div class="mb-3">
                <label for="userName" class="form-label">USER NAME</label>
                <input type="text" class="form-control" id="userName" placeholder="userName" name="userName">
            </div>
            <div class="mb-3">
                <label for="birth" class="form-label">BIRTH</label>
                <input type="date" class="form-control" id="birth" placeholder="select birth day" name="userBirth">
            </div>
            <div>
                <button class="btn btn-primary">SIGN IN</button>
                <button class="btn btn-outline-primary">RESET</button>
            </div>
        </form>
    </div>
<script>
    //ajax - jquery axios fetch
    $("#btn-duplication").on("click",function () {
        $.ajax({
            url: "id-check-process.jsp",
            data: {
                userID: $("#userID").val()
            },
            method:"post",
            //결과를 받기 위해
            success:function (data) {
                console.log(data);
                if (data.count > 0) {
                    alert("중복된 아이디 입니다.");
                    $("#userID").val("");
                    $("#userID").focus();
                } else {
                    const used = confirm("쓸 수 있는 아이디입니다. 사용하시겠습니까?");
                    if (used) {
                        $("#userID").attr("readonly",true);
                    } else {
                        $("#userID").val("");
                        $("#userID").focus();
                    }
                }
            }
        })
    })
</script>
<%@include file="include/footer.jsp"%>