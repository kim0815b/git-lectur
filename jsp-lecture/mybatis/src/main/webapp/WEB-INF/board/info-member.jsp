<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="../include/header.jsp" %>
<div class="container">
   <h2 class="mt-5 mb-5"> 회원정보 </h2>
   <table class="table table-bordered">
      <tr>
         <th>PROFILE</th>
         <td>
            <%--
                ${request.contextPath}
                localhost:8080/upload/jun_20240523154512.jpg
            --%>
            <img src="${request.contextPath}/upload/${infoMemberDto.renameProfile}"
                 class="profile">
         </td>
      </tr>
      <tr>
         <th>USER ID</th>
         <td>${infoMemberDto.userID}</td>
      </tr>
      <tr>
         <th>USER NAME</th>
         <td>${infoMemberDto.userName}</td>
      </tr>
      <tr>
         <th>EMAIL</th>
         <td>${infoMemberDto.email}</td>
      </tr>
      <tr>
         <th>POST CODE</th>
         <td>${infoMemberDto.postCode}</td>
      </tr>
      <tr>
         <th>ADDRESS</th>
         <td>${infoMemberDto.address} <br>${infoMemberDto.addressDetail} </td>
      </tr>
      <tr>
         <th>BIRTH</th>
         <td>${infoMemberDto.birth}</td>
      </tr>
   </table>
   <div>
      <a href="../member/password-change">비밀번호 변경</a>
      <!--페이지 만들고 기본 비밀번호 만들고 바꿀 비밀번호 , 비밀번호 확인 입력 후 바꾸기 -->
   </div>
</div>
<%@ include file="../include/footer.jsp"%>
