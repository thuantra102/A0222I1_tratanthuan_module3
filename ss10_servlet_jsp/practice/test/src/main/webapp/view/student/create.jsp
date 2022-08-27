<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 8/21/2022
  Time: 4:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1> Thêm mới</h1>
<a href="/student">Quay lai trang list</a>
<c:if test="${mess!=null}">
    <p style="color: red">${mess}</p>
</c:if>
<form action="/student?action=create" method="post">
    <pre>ID:       <input type="text" name="id"/></pre>
    <pre>Name:     <input type="text" name="name"> </pre>
    <pre>Gender :  <input type="radio" name="gender">Nam <input type="radio" name="gender"> Nữ </pre>
    <pre>Birthday: <input type="date" name="birthday"> </pre>
    <pre>Point:    <input type="number" name="point"> </pre>
    <pre>Account:  <input type="text" name="account"> </pre>
    <pre>Email:    <input type="text" name="email"> </pre>
    <pre>ClassId:  <input type="number" name="classId"></pre>
    <pre>           <button>Save</button></pre>
</form>
</body>
</html>
