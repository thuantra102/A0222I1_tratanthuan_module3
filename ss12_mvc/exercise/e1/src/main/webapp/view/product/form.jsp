<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create</title>
    <style>
        .input-value {
            display: flex;
            gap: 30px;
            align-content: center;
            margin-bottom: 10px;
        }
        .input-value span {
            width: 60px;
        }
        a {
            text-decoration: none;
        }

    </style>
</head>
<body>
<h1>From Product</h1>
<form method="post" action="/productSv">
    <c:if test="${product != null}">
        <div class="input-value">
            <span>Id</span>
            <input type="text" name ="id" value="${product.id}">
        </div>
    </c:if>
<c:if test="${product == null}">
    <input type="hidden" name ="id" value="0">
</c:if>

    <div class="input-value">
    <span>Name</span>
    <input type="text" name ="name" value="${product.name}">
    </div>
    <div class="input-value">
        <span>Price</span>
        <input type="number" name = "price" value="${product.price}">
    </div>
    <div class="input-value">
    <span>Description</span>
    <input type="text" name = "description" value="${product.description}">
    </div>
    <div class="input-value">
    <span>Manufacture</span>
    <input type="text" name = "manufacture" value="${product.manufacture}">
    </div>
    <input type="submit" value="Save">

</form>
<button class="btn btn-secondary" ><a href="/productSv" class="text-decoration-none">Back To List Product</a></button>

</body>
</html>
