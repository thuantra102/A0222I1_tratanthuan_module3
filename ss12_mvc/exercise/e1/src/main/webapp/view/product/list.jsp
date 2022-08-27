<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 8/21/2022
  Time: 7:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>


</head>
<body>
<h1>List Product</h1>
<a id="btSearch" class="btn btn-primary" href="">Search</a> <input type="text" id="valSearch" name="id">
<table class="table table-hover">
    <tr>
        <th>ID</th>
        <th>NAME</th>
        <th>PRICE</th>
        <th>DESCRIPTION</th>
        <th>MANUFACTURE</th>
        <td>Action</td>
        <td>Delete</td>
    </tr>
    <c:forEach var="product" items="${listProduct}" varStatus="status">
        <tr>
            <td>${product.id}</td>
            <td>${product.name}</td>
            <td>${product.price}</td>
            <td>${product.description}</td>
            <td>${product.manufacture}</td>
            <td><a href="/productSv?id=${product.id}">Edit</a> </td>
            <td>
                <button type="button" onclick="deleteInfo('${product.id}','${product.name}')" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    Delete
                </button>
            </td>
        </tr>
    </c:forEach>
</table>
<button class="btn btn-secondary"><a href="view/product/form.jsp" class="text-decoration-none text-dark">Create</a></button>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form method="post" action="/productSv">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input hidden name = "id" id = "deleteId">
                    <span>Do you want to delete product having id = </span>
                    <span id = "id">
                    </span>
                    <span> with the name is</span>
                    <span id="nameProduct"> </span>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>

                    <input type="submit" value="OK" class="btn btn-primary">

                </div>
            </form>
        </div>
    </div>
</div>
<script>
    const search = document.getElementById("btSearch");
    function deleteInfo(id,name) {
        document.getElementById("deleteId").value = id;
        document.getElementById("id").innerText = id;
        document.getElementById("nameProduct").innerText = name;
    }
    search.addEventListener("click", function () {
        let value = document.getElementById("valSearch").value;
        document.getElementById("btSearch").href = "/productSv?q=" + value;
    })
</script>
</body>
</html>
