<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 8/26/2022
  Time: 4:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Management Application</title>
</head>
<body>

<center>
    <h1>User Management</h1>
    <h2 onclick="openPopup()">
        Add New User
    </h2>
</center>
<div align="center">
    <table border="1" cellpadding="5">
        <caption><h2>List of Users</h2></caption>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Country</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="user" items="${listUser}">
            <tr>
                <td><c:out value="${user.id}"/></td>
                <td><c:out value="${user.name}"/></td>
                <td><c:out value="${user.email}"/></td>
                <td><c:out value="${user.country}"/></td>
                <td>
                    <span onclick="openPopup(${user.id})">Edit</span>

<%--                    <a href="/userSv?editId=${user.id}">Edit</a>--%>
                    <a href="/userSv?deleteId=${user.id}">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
    <input type="hidden" id="userId">
    <div id="modal">

    </div>
</div>
<script>
    const closePopup = () => {
        document.getElementById("modal").innerHTML = '';
    }
    const openPopup = (id) => {
        fetch("http://localhost:8080/view/user/popup.jsp").then(res => res.text()).then(res => {
            document.getElementById("modal").innerHTML = res;
            fetch("http://localhost:8080/"+ (id ? ("userSv?editId="+id)
                : "view/user/form.jsp")).then(res_ => res_.text()).then(res_ => {
                document.querySelector(".modal_content > div").innerHTML = res_
            });
        })
    }

</script>
</body>
</html>
