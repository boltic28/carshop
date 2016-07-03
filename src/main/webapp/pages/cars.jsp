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
                        <c:if test="${isLogin == 'yes'}">
                        $<c:out value="${car.price}"/>
                        </c:if>
                        <c:if test="${isLogin == 'no'}">
                            <em><a href="/registration">зарегистрируйтесь</a></em>
                        </c:if>

                    </td>

                    <td>
                        <c:if test="${isLogin == 'yes'}">
                            <a href="inbasket/${car.id}/add">В корзину</a>
                        </c:if>
                        <c:if test="${isLogin == 'no'}">
                            <em><a href="/registration">войдите в аккаунт</a></em>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>

        </table>

    </div>
</section>


</body>

<jsp:include page="elements/footer.jsp"/>

</html>