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

<section class="head_block">
    <h2>Работа с автомобилями</h2>
    <p>${mess} ${exception}</p>
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
        <th>Диски</th>
        <th>Конд</th>
        <th>Кожа</th>
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
            <td>${car.hasConditioner()}</td>
            <td>${car.hasSkin()}</td>

            <td>
                <button class="btn btn-info btn-sm" onclick="set_car('${car.id}','${car.brand}','${car.model}','${car.transmition}',
                    '${car.color}','${car.engine}','${car.year}','${car.price}','${car.odo}','${car.view}','${car.frame}','${car.agregate}',
                    '${car.hasSkin()}','${car.hasConditioner()}','${car.hasCastDisk()}','${car.img1}','${car.img2}','${car.img3}')">

                    <span class="glyphicon glyphicon-cog" aria-hidden="true"></span></button>
                <button class="btn btn-danger btn-sm car-del-btn"><a href="/admin/car/${car.id}/del"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a> </button>
                <button class="btn btn-success btn-sm car-del-btn" onclick="add_photo('/admin/car/add/${car.id}/photos')"><span class="glyphicon glyphicon-picture" aria-hidden="true"></span> </button>
            </td>
        </tr>
    </c:forEach>
</table>
<hr>
<div class="new-user">
    <button class="btn btn-success btn-md" onclick="add_car()">Добавить автомобиль в ручную</button>
    <button class="btn btn-success btn-md" onclick="add_car_exc()">Добавить автомобиль из EXCEL</button>
</div>
</body>

<jsp:include page="../elements/goods_add/carAdd.jsp"/>
<jsp:include page="../elements/goods_add/carAddPhoto.jsp"/>
<jsp:include page="../elements/goods_add/carFromExcel.jsp"/>
<jsp:include page="../elements/footer.jsp"/>

</html>