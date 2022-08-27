<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 8/26/2022
  Time: 5:02 PM
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
    <h2>
        <a href="/userSv">List All Users</a>
    </h2>
</center>
<div align="center">
    <form method="post"  action="/userSv">
        <input hidden name="id" value="${user.id}">
        <table border="1" cellpadding="5">
            <caption>
                <c:if test="${user == null}">
                    <h2>Add New User</h2>
                </c:if>
                <c:if test="${user != null}">
                    <h2>Edit User</h2>
                </c:if>

            </caption>
            <tr>
                <th>User Name:</th>
                <td>
                    <input type="text" name="name" id="name" size="45" value="${user.name}"/>
                </td>
            </tr>
            <tr>
                <th>User Email:</th>
                <td>
                    <input type="text" name="email" id="email" size="45" value="${user.email}"/>
                </td>
                <td>
                    <span>${error.get("email")}</span>
                </td>

            </tr>
            <tr>
                <th>Country:</th>
                <td>
                    <input ty name="country" id="country" size="15" value="${user.country}"/>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="Save"/>
                </td>
            </tr>
        </table>

    </form>
</div>
</body>
</html>