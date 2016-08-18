<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Авто в наличии</title>
    <jsp:include page="elements/head.jsp"/>
</head>

<body>

<jsp:include page="elements/navHead.jsp"/>
<jsp:include page="elements/news.jsp"/>

<section class="main_section">
    <h2>Авто в наличии</h2>
    <hr>
</section>

<section class="list_of_car">
    <div class="row">
        <div class="col-lg-3 col-md-3 col-sm-5 col-xs-12 filter">
            <jsp:include page="elements/filterForCar.jsp"/>
        </div>
        <div class="col-lg-9 col-md-9 col-sm-7 col-xs-12">
        <table class="table display cars_table" id="carsTable">
            <thead>
            <tr>
                <th></th>
                <th>Описание</th>
                <th>Просмотров</th>
                <th>Стоимость</th>
                <th></th>
            </tr>
            </thead>

            <c:forEach items="${carList}" var="car">
                <jsp:useBean id="car" scope="page" type="models.Car"/>
                <tr>
                    <td class="cars_img"><a href="cars/${car.id}"><img src="${pageContext.request.contextPath}/pages/img/${car.img1}"></a></td>
                    <td><h3>${car.brand}  ${car.model}, ${car.year}г.</h3>
                        <p> ${car.odo}км, ${car.frame}, состояние ${car.agregate}, </p>
                    </td>
                    <td><c:out value="${car.view}"/></td>

                    <td class="cars_price">
                        <c:if test="${curUser != null}">
                        $<c:out value="${car.price}"/>
                        </c:if>
                        <c:if test="${curUser == null}">
                            <em><a onclick=add_user('/register')>Регистрация/</a> <a href="/login">Вход</a></em>
                        </c:if>

                    </td>

                    <td>
                        <c:if test="${curUser != null}">
                            <a href="inbasket/${car.id}/addFromCars">В корзину</a>
                        </c:if>
                        <c:if test="${curUser == null}">
                            <em><a onclick=add_user('/register')>Регистрация/</a> <a href="/login">Вход</a></em>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>

        </table>
        </div>
    </div>
</section>

<jsp:include page="elements/user_add.jsp"/>
</body>


<jsp:include page="elements/footer.jsp"/>


</html>