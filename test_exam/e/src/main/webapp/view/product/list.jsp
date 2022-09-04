<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 8/30/2022
  Time: 10:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>CRUD Data Table for Database with Modal Form</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    \
    <link rel="stylesheet" href="view/product/style/list.css">

    <script>
        $(document).ready(function () {
            // Activate tooltip
            $('[data-toggle="tooltip"]').tooltip();

            // Select/Deselect checkboxes
            var checkbox = $('table tbody input[type="checkbox"]');
            $("#selectAll").click(function () {
                if (this.checked) {
                    checkbox.each(function () {
                        this.checked = true;
                    });
                } else {
                    checkbox.each(function () {
                        this.checked = false;
                    });
                }
            });
            checkbox.click(function () {
                if (!this.checked) {
                    $("#selectAll").prop("checked", false);
                }
            });
        });

    </script>
</head>

<body>
<div class="container-xl">
    <div class="table-responsive">
        <div class="table-wrapper">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-4">
                        <h2>Product <b>List</b></h2>
                    </div>
                    <div class="col-sm-4">

                        <a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal"><i
                                class="material-icons">&#xE147;</i> <span>Add New Product</span></a>

                        <%--                        <a href="#deleteEmployeeModal" class="btn btn-danger" data-toggle="modal"><i--%>
                        <%--                                class="material-icons">&#xE15C;</i> <span>Delete</span></a>--%>

                    </div>
                    <div class="col-sm-4" id="search-box">
                        <i class="material-icons" id="search">&#xE8B6;</i>
                        <input type="text" value="${value}" id="valueSearch" class="form-control" placeholder="Search&hellip;">
                    </div>
                </div>
            </div>
            <table class="table table-striped table-hover">
                <thead>
                <tr>
                    <%--                    <th>--%>
                    <%--                <span class="custom-checkbox">--%>
                    <%--                  <input type="checkbox" id="selectAll">--%>
                    <%--                  <label for="selectAll"></label>--%>
                    <%--                </span>--%>
                    <%--                    </th>--%>
                    <th>Id</th>
                    <th>Product Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Color</th>
                    <th>Category</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>

                <%--                    <td>--%>
                <%--                <span class="custom-checkbox">--%>
                <%--                  <input type="checkbox" id="checkbox1" name="options[]" value="1">--%>
                <%--                  <label for="checkbox1"></label>--%>
                <%--                </span>--%>
                <%--                    </td>--%>
                <c:forEach var="p" items="${productList}">
                    <tr>

                        <td>${p.id}</td>
                        <td>${p.productName}</td>
                        <td>${p.price}</td>
                        <td>${p.quantity}</td>
                        <td>${p.color}</td>
                        <c:forEach var="c" items="${categoryList}">
                            <c:if test="${p.id_category == c.id}">
                                <td>${c.name}</td>
                            </c:if>
                        </c:forEach>
                        <td>
                            <a href="#editEmployeeModal" class="edit" id="edit" onclick="getId(${p.id})" data-toggle="modal"><i
                                    class="material-icons"
                                    data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                            <a href="#deleteEmployeeModal" class="delete" data-toggle="modal" onclick="getDeleteId(${p.id})"><i class="material-icons"
                                                                                                 data-toggle="tooltip"
                                                                                                 title="Delete">&#xE872;</i></a
                            <input hidden value="${p.id}" name="idProduct">
                        </td>
                    </tr>

                </c:forEach>


                </tbody>
            </table>
            <!-- <div class="clearfix">
              <div class="hint-text">Showing <b>5</b> out of <b>25</b> entries</div>
              <ul class="pagination">
                <li class="page-item disabled"><a href="#">Previous</a></li>
                <li class="page-item"><a href="#" class="page-link">1</a></li>
                <li class="page-item"><a href="#" class="page-link">2</a></li>
                <li class="page-item active"><a href="#" class="page-link">3</a></li>
                <li class="page-item"><a href="#" class="page-link">4</a></li>
                <li class="page-item"><a href="#" class="page-link">5</a></li>
                <li class="page-item"><a href="#" class="page-link">Next</a></li>
              </ul>
            </div> -->
        </div>
    </div>
</div>
<!-- Edit Modal HTML -->
<div id="addEmployeeModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="/productSv?action=save" method="post">
                <div class="modal-header">
                    <h4 class="modal-title">Add Product</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Product Name</label>
                        <input type="text" class="form-control" required name="name">
                    </div>
                    <div class="form-group">

                        <label>Price</label>
                        <input type="number" class="form-control" required name="price">
                    </div>
                    <div class="form-group">
                        <label>Quantity</label>
                        <input type="number" class="form-control" required name="quantity">
                    </div>
                    <div class="form-group">
                        <label>Color</label>
                        <input type="text" class="form-control" required name="color">
                    </div>
                    <div class="form-group">
                        <label>Category</label>
                        <select class="form-select" name="category">
                            <c:forEach var="c" items="${categoryList}">
                                <option value="${c.id}">${c.name}</option>
                            </c:forEach>
                        </select>
                    </div>

                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                    <input type="submit" class="btn btn-success" value="Add">
                </div>
            </form>
        </div>
    </div>
</div>
<!-- Edit Modal HTML -->
<div id="editEmployeeModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="/productSv?action=save" method="post">
                <div class="modal-header">
                    <h4 class="modal-title">Edit Product</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>

                <input hidden id = "idProduct" name="idProduct">

                <div class="modal-body">
                    <div class="form-group">
                        <label>Product Name</label>
                        <input type="text" class="form-control" required name="name" id="productName">
                    </div>
                    <div class="form-group">
                        <label>Price</label>
                        <input type="number" class="form-control" required name="price" id="price">
                    </div>
                    <div class="form-group">
                        <label>Quantity</label>
                        <input type="number" class="form-control" required name="quantity" id="quantity">
                    </div>
                    <div class="form-group">
                        <label>Color</label>
                        <input type="text" class="form-control" required name="color" id="color">
                    </div>
                    <div class="form-group">
                        <label>Category</label>
                        <select class="form-select" id="category" name="category">
                            <c:forEach var="c" items="${categoryList}">
                                <option  value="${c.id}">${c.name}</option>
                            </c:forEach>
                        </select>

                    </div>

                </div>

                <div class="modal-footer">
                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                    <input type="submit" class="btn btn-info" value="Save">
                </div>
            </form>
        </div>
    </div>
</div>
<!-- Delete Modal HTML -->
<div id="deleteEmployeeModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="/productSv?action=delete" method="post">
                <input hidden name="deleteId" id="deleteId">
                <div class="modal-header">
                    <h4 class="modal-title">Delete Product</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <p>Are you sure you want to delete these Records?</p>
                    <p id="info" style="color: red; font-size: 10px"></p>
                    <p class="text-warning"><small>This action cannot be undone.</small></p>
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                    <input type="submit" class="btn btn-danger" value="Delete">
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    const search = document.getElementById("search");
    function getId(id) {
        fetch("http://localhost:8080/productSv?action=find&id=" + id)
            .then((response)=>(
                response.json()
            ))
            .then(function (data) {
                document.getElementById("idProduct").value = data.id;
                document.getElementById("productName").value = data.productName;
                document.getElementById("price").value = data.price;
                document.getElementById("quantity").value = data.quantity;
                document.getElementById("color").value = data.color;
                document.getElementById("category").value = data.id_category;
            })
    }
    function getDeleteId(id) {
        document.getElementById("deleteId").value = id;
        fetch("http://localhost:8080/productSv?action=find&id=" + id)
            .then(function (response) {
                return response.json()
            })
            .then(function (info) {
                document.getElementById("info").innerText = "id = " + info.id + " and name = " + info.productName;
            })
    }
    search.addEventListener("click",function () {
        let value = document.getElementById("valueSearch").value;
        window.location.href = "/productSv?action=search&value=" + value;
    })
</script>
<%--<script src="view/style/list.js"></script>--%>
</body>

</html>
