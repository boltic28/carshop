<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin-panel Cars</title>
    <jsp:include page="../elements/head.jsp"/>
</head>

<body>

<ul class="nav nav-tabs">
    <li role="presentation"><a href="/admin/user">Пользователи</a></li>
    <li role="presentation" class="active"><a href="/admin/car">Авто</a></li>
    <li role="presentation"><a href="/admin/moto">Мото</a></li>
    <li role="presentation"><a href="/admin/out">Выйти</a></li>
</ul>

<section class="main_section">
    <h2>Работа с автомобилями</h2>
    <hr>
</section>


<table class="table display cars_table" id="carsTable">
    <thead>
    <tr>
        <th></th>
        <th>Марка</th>
        <th>Модель</th>
        <th>Год</th>
        <th>Кузов</th>
        <th>Цвет</th>
        <th>Двигатель</th>
        <th>КПП</th>
        <th>Состояние</th>
        <th>Пробег</th>
        <th>Стоимость</th>
        <th>Продана</th>
        <th></th>
    </tr>
    </thead>
    <c:forEach items="${carList}" var="car">
        <jsp:useBean id="car" scope="page" type="models.Car"/>
        <tr>
            <td class="cars_img_admin"><a href="cars/${car.id}"><img src="${pageContext.request.contextPath}/pages/img/${car.img1}"></a></td>
            <td>${car.brand.toUpperCase()}</td>
            <td>${car.model.toUpperCase()}</td>
            <td>${car.year}</td>
            <td>${car.frame.toUpperCase()}</td>
            <td>${car.color.toUpperCase()}</td>
            <td>${car.engine.toUpperCase()}</td>
            <td>${car.transmition.toUpperCase()}</td>
            <td>${car.agregate.toUpperCase()}</td>
            <td>${car.odo} km</td>
            <td>${car.price}</td>
            <td>${car.hasCastDisk()}</td>

            <td>
                <button class="btn btn-info btn-sm" onclick=""><span class="glyphicon glyphicon-cog" aria-hidden="true"></span></button>
                <button class="btn btn-danger btn-sm car-del-btn"><a href="/admin/car/${car.id}/del"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a> </button>
            </td>
        </tr>
    </c:forEach>
</table>
<hr>
<div class="new-user">
    <button class="btn btn-success btn-md" onclick="add_car()">Добавить автомобиль</button>
</div>
</body>

<jsp:include page="../elements/car_add.jsp"/>
<jsp:include page="../elements/footer.jsp"/>

</html>