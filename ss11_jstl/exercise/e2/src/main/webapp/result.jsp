<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 8/19/2022
  Time: 7:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:if test="${exception == null}">
    <h1>Result = ${result}</h1>
</c:if>
<c:if test="${exception != null}">
    <h1>${exception}</h1>
</c:if>

</body>
</html>
