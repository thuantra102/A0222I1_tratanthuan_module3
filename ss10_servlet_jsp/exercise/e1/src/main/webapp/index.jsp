<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 8/18/2022
  Time: 2:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <form action="/calculate" method="post">
    <label>Product Description</label>
    <input type="text" name="description" placeholder="Product Description"><br><br>
    <label>List Price</label>
    <input type="text" name="price" placeholder="List Price"><br><br>
    <label>Discount Percent</label>
    <input type="text" name="percent" placeholder="Discount Percent"><br><br>
    <input type = "submit" id = "submit" value = "Calculate Discount"/>
  </form>
  </body>
</html>
