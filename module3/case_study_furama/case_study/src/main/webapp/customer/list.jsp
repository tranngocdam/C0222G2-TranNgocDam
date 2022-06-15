<%--
  Created by IntelliJ IDEA.
  User: Dam BKDN
  Date: 6/4/2022
  Time: 11:10 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/bootstrap-5.0.2-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="bootstrap413/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap4.min.css"/>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
</head>
<body>
<div class="container">
    <div class="row">
        <nav class="navbar navbar-expand-sm bg-warning navbar-dark sticky-top">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <div class="container-fluid">
                        <a class="navbar-brand" href="#">
                            <a><img src="https://images.vietnamtourism.gov.vn/vn/images/Furama12.jpg" alt="Logo"
                                    style="width:70px;" class="rounded"></a>
                        </a>
                    </div>
                </li>
            </ul>
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <form>
                        <a class="btn btn-primary" href="/home">HOME</a>
                    </form>
                </li>
                <li class="nav-item">
                    <form action="/employee">
                        <a class="btn btn-primary" href="/employee">EMPLOYEE</a>
                    </form>
                </li>
                <li class="nav-item">
                    <form action="/customer">
                        <a class="btn btn-primary" href="/customer">CUSTOMER</a>
                    </form>
                </li>
                <li class="nav-item">
                    <form action="/service">
                        <a class="btn btn-primary" href="/service">SERVICE</a>
                    </form>
                </li>
                <li class="nav-item">
                    <form action="/contract">
                        <a class="btn btn-primary" href="/contract">CONTRACT</a>
                    </form>
                </li>
            </ul>
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="btn btn-primary">A VAN NGUYEN</a>
                </li>
            </ul>
        </nav>
    </div>
    <div class="row">
        <nav class="navbar navbar-expand-sm navbar-dark bg-dark">
            <div class="container-fluid">
                <div class="collapse navbar-collapse">
                    <ul class="navbar-nav me-auto">
                        <li class="nav-item">
                            <a class="btn btn-primary" href="customer?action=save">CREATE</a>
                        </li>
                    </ul>
                    <form class="d-flex" action="/customer" method="post">
                        <input class="form-control me-2" type="text" placeholder="Enter name customer" name="customerName">
                        <input type="submit" value="search" name="action">
                    </form>
                </div>
            </div>
        </nav>
    </div>
    <br>
    <br>
    <br>
    <div class="row">
        <div class="container-fluid">
            <div class="class1">
                <table id="tableCustomer" class="table table-striped table-sm">
                    <thead class="table-light">
                    <tr>
                        <th>ID</th>
                        <th>Type_Id</th>
                        <th>Name</th>
                        <th>Birthday</th>
                        <th>Gender</th>
                        <th>Card</th>
                        <th>Phone</th>
                        <th>Email</th>
                        <th>Address</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${customerList}" var="e">
                        <tr>
                            <td>${e.customerId}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${e.customerTypeId==1}">Diamond</c:when>
                                    <c:when test="${e.customerTypeId==2}">Platinium</c:when>
                                    <c:when test="${e.customerTypeId==3}">Gold</c:when>
                                    <c:when test="${e.customerTypeId==4}">Sliver</c:when>
                                    <c:when test="${e.customerTypeId==5}">Member</c:when>
                                </c:choose>
                            </td>

<%--                            <c:choose>--%>
<%--                                <c:when test="${e.customerTypeId==1}">--%>
<%--                                    <td>type name</td>--%>
<%--                                    <td>cost</td>--%>
<%--                                </c:when>--%>
<%--                                <c:when test="${e.customerTypeId==2}">--%>
<%--                                    <td></td>--%>
<%--                                    <td></td>--%>
<%--                                </c:when>--%>
<%--                            </c:choose>--%>

                            <td>${e.customerName}</td>
                            <td>${e.customerBirthday}</td>
                            <td>
                                <c:if test="${e.customerGender == 1}">
                                    Nam
                                </c:if>
                                <c:if test="${e.customerGender == 0}">
                                    Nữ
                                </c:if>
                            </td>
                            <td>${e.customerIdCard}</td>
                            <td>${e.customerPhone}</td>
                            <td>${e.customerEmail}</td>
                            <td>${e.customerAddress}</td>
                            <td>
                                <a class="btn btn-primary"
                                   href="/customer?action=edit&customerId=${e.customerId}">Edit</a>
                            </td>
                            <td>
                                <!-- Button trigger modal -->
                                <button type="button" class="btn btn-primary" data-toggle="modal"
                                        data-target="#exampleModal${e.customerId}">
                                    Delete
                                </button>
                                <!-- Modal -->
                                <div class="modal fade" id="exampleModal${e.customerId}" tabindex="-1"
                                     role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                                                <button type="button" class="close" data-dismiss="modal"
                                                        aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                Do you want delete customer is have ${e.customerId} and name
                                                is ${e.customerName} ?
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">
                                                    Close
                                                </button>
                                                <button type="button" class="btn btn-primary"><a class="btn btn-primary"
                                                                                                 href="/customer?action=delete&customerId=${e.customerId}">Delete</a>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"

        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap4.min.js"></script>
<script>
    $(document).ready(function () {
        $('#tableCustomer').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 4
        });
    });
</script>
</html>
