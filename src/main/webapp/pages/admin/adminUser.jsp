<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin-panel Users</title>
    <jsp:include page="../elements/head.jsp"/>
</head>

<body>

    <ul class="nav nav-tabs">
        <li role="presentation" class="active"><a href="/admin/user">Пользователи</a></li>
        <li role="presentation"><a href="/admin/car">Авто</a></li>
        <li role="presentation"><a href="/admin/moto">Мото</a></li>
        <li role="presentation"><a href="/admin/out">Выйти</a></li>

    </ul>

    <section class="main_section">
        <h2>Работа с пользователями</h2>
        <hr>
    </section>


    <table class="table display cars_table" id="usersTable">
        <thead>
        <tr>
            <th>Id</th>
            <th>Имя</th>
            <th>Пароль</th>
            <th>E-mail</th>
            <th></th>
        </tr>
        </thead>
        <c:forEach items="${userList}" var="user">
            <jsp:useBean id="user" scope="page" type="models.User"/>
            <tr>
                <td>${user.id}</td>
                <td>${user.name}</td>
                <td>${user.password}</td>
                <td>${user.email}</td>

                <td>
                    <button class="btn btn-info btn-sm" onclick=""><span class="glyphicon glyphicon-cog" aria-hidden="true"></span></button>
                    <button class="btn btn-danger btn-sm car-del-btn a" ><a href="/admin/user/${user.id}/del"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a></button>
                </td>
            </tr>
        </c:forEach>
    </table>
<hr>
    <div class="new-user">
        <button class="btn btn-success btn-md" onclick="add_user('register/admin')">Добавить пользователя</button>
    </div>

</body>

<jsp:include page="../elements/user_add.jsp"/>
<jsp:include page="../elements/footer.jsp"/>

</html>