<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 8/19/2022
  Time: 6:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <h1>Simple Calculator</h1>
  <form action="/calculate" method="post">
    <fieldset>
      <legend>Calculator</legend>
      <table>
        <tr>
          <td>First Operator</td>
          <td>
            <input type="text" name="firstOperator">
          </td>
        </tr>
        <tr>
          <td>Operator</td>
          <td>
            <select name = "operator">
              <option value="Addition" name="add">Addition</option>
              <option value="Subtraction" name="minus">Subtraction</option>
              <option value="Multiplication" name="multi">Multiplication</option>
              <option value="Division" name="divide">Division</option>
            </select>
          </td>
        </tr>
        <tr>
          <td>Second Operator</td>
          <td>
            <input type="text" name="secondOperator">
          </td>
        </tr>
        <tr>
          <td></td>
          <td><input type="submit" value="Calculate"></td>
        </tr>
      </table>
    </fieldset>

  </form>

  </body>
</html>
