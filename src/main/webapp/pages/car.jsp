<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean class="models.Car"  id="car" scope="page" type="models.Car"/>
<html>


<head>
    <c:set var="car" scope="page" value="${curcar}" />
    <title>${car.brand} ${car.model}</title>
    <jsp:include page="elements/head.jsp"/>
</head>
<body>
    <jsp:include page="elements/navHead.jsp"/>

    <section class="main_section item">
        <h2> ${car.brand} ${car.model},  ${car.year} года.   </h2>
        <hr>
    </section>

    <section class="description_car">
    <c:set var="car" scope="page" value="${curcar}" />
        <div class="row">

            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 common_car main_car">
                <img src="${pageContext.request.contextPath}/pages/img/${car.img1}">
            </div>

            <div class="col-lg-8 col-md-8 col-sm-6 col-xs-12 common_car descr_car">
                <tspan class="glyphicon glyphicon-eye-open" aria-hidden="true"></tspan> ${car.view}
                <h3>Описание</h3>

                <table class="table display table-striped cars_table" id="carsTable">
                    <thead>
                    <tr>
                        <th></th>
                        <th></th>
                    </tr>
                    </thead>
                        <tr><td>Пробег</td><td>${car.odo} км</td></tr>
                        <tr><td>Тип КПП</td><td>${car.transmition}</td></tr>
                        <tr><td>Тип Двигателя</td><td>${car.engine}</td></tr>
                        <tr><td>Тип кузова</td><td>${car.frame}</td></tr>
                        <tr><td>Цвет</td><td>${car.color}</td></tr>
                        <tr><td>Состояние</td><td>${car.agregate}</td></tr>
                        <tr><td>Цена</td><td>
                            <c:if test="${curUser != null}">
                                <span>$${car.price}</span>
                            </c:if>
                            <c:if test="${curUser == null}">
                                <em><a onclick=add_user('/register')>Регистрация/</a> <a href="/login">Вход</a></em>
                            </c:if>
                        </td></tr>
                        <%--<tr><td>Кондиционер</td><td>--%>
                            <%--$<c:out value="${car.conditioner}"/>--%>
                        <%--</td></tr>--%>
                        <%--<tr><td>Кожанный салон</td><td>--%>
                            <%--<c:if test="${car.skin}">--%>
                                <%--Да--%>
                            <%--</c:if>--%>
                            <%--<c:if test="!${car.skin}">--%>
                                <%--Нет--%>
                            <%--</c:if>--%>
                            <%--</td></tr>--%>
                        <%--<tr><td>Литые диски</td><td>--%>
                            <%--<c:if test="${car.castdisk}">--%>
                                <%--Да--%>
                            <%--</c:if>--%>
                            <%--<c:if test="!${car.castdisk}">--%>
                                <%--Нет--%>
                            <%--</c:if>--%>
                        <%--</td></tr>--%>

                </table>
            </div>
        </div>
        <div class="row">

            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 common_car photos_car">
                <img src="${pageContext.request.contextPath}/pages/img/${car.img1}">
                <img src="${pageContext.request.contextPath}/img/${car.img2}">
                <img src="${pageContext.request.contextPath}/img/${car.img3}">
            </div>

            <div class="col-lg-8 col-md-8 col-sm-6 col-xs-12 common_car price_car">
                <p>
                    <c:if test="${curUser != null}">
                        <a href="inbasket/${car.id}/add">В корзину</a>
                    </c:if>
                    <c:if test="${curUser == null}">
                        <em><a onclick=add_user('/register')>Регистрация/</a> <a href="/login">Вход</a></em>
                    </c:if>

                </p>
            </div>
        </div>
    </section>
</body>

<jsp:include page="elements/footer.jsp"/>

</html>
