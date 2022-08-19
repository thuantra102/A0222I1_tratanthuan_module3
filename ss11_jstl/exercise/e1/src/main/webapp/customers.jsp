<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 8/19/2022
  Time: 8:49 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

    <table>
        <tr>
            <th>Name</th>
            <th>Birthday</th>
            <th>Address</th>
            <th>Avatar</th>
        </tr>
        <c:forEach var="c" items="${customerList}">
            <tr>
                <td>${c.getName()}</td>
                <td>${c.birthDay} </td>
                <td>${c.address}</td>
                <td><img src="${c.image}"></td>

            </tr>
        </c:forEach>
        <img src="">
    </table>


</body>
</html>
