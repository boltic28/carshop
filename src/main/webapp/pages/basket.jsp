<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>My goods</title>
    <jsp:include page="elements/head.jsp"/>
</head>

<body>

<jsp:include page="elements/navHead.jsp"/>

<section class="head_block item">
    <h2>Ваша корзина (${totGoods} товаров)</h2> на сумму $${total}
    <hr>
</section>

<table class="table table-striped display" id="basketTable">
    <thead>
    <tr>
        <th></th>
        <th>Описание</th>
        <th>Стоимость</th>
        <th></th>
    </tr>
    </thead>


        <c:forEach items="${goodsList}" var="car">
            <jsp:useBean id="car" scope="page" type="models.Car"/>
            <tr>
                <td class="cars_img"><a href="cars/${car.id}"><img src="${pageContext.request.contextPath}/pages/img/${car.img1}"></a></td>
                <td><h3>${car.brand}  ${car.model}, ${car.year}г.</h3>
                    <p> ${car.odo}км, ${car.frame}, состояние ${car.agregate}, </p>
                </td>
                <td class="cars_price">$<c:out value="${car.price}"/></td>
                <td><a href="inbasket/${car.id}/del">Убрать</a></td>
                <td><a href="getpdf/${car.id}">в PDF-файл</a></td>
            </tr>
        </c:forEach>


</table>

<div class="new-user">
    <a href="basket/sendmail" class="btn btn-success btn-md" >Сформировать и отправить заказ </a>
</div>
</body>

<jsp:include page="elements/footer.jsp"/>

</html>
