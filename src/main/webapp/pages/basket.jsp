<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>My goods</title>
    <jsp:include page="elements/head.jsp"/>
</head>
<body>
<section class="main_section">
    <h2>Ваша корзина (${totGoods} товаров, на сумму $${total})</h2>
    <hr>
</section>

<table class="table table-striped display" id="carsTable">
    <thead>
    <tr>
        <th></th>
        <th>Описание</th>
        <th>Просмотров</th>
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
                <td><c:out value="${car.view}"/></td>
                <td class="cars_price">$<c:out value="${car.price}"/></td>
                <td><a href="inbasket/${car.id}/del">Убрать</a></td>
            </tr>
        </c:forEach>

</table>
</body>

<jsp:include page="elements/footer.jsp"/>

</html>
