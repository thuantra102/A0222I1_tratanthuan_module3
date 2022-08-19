<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 8/16/2022
  Time: 11:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <h1>Welcome to my website</h1>

  <p>Hello world</p>
  <%
    Date today = new Date();
  %>
  <div id="current-time"><%= today %></div>
  </body>
</html>
