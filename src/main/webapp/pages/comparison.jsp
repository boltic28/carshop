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

<section class="main_section item">
    <h2>Сравнение товаров</h2> <!--на сумму $${total}-->
    <hr>
</section>

<table class="table display" id="comparisonTable">

    <thead>
    <tr>
        <th></th>
            <c:forEach items="${compareList}" var="car">
                <jsp:useBean id="car" scope="page" type="models.Car"/>
        <th><img class="comparison_img" src="${pageContext.request.contextPath}/pages/img/${car.img1}"</th>
            </c:forEach>
        <th></th>
    </tr>
    </thead>

    <tr class="success"><td colspan="30">Общие данные</td></tr>
    <tr>
        <td>Марка</td>
        <c:forEach items="${compareList}" var="car">
            <td class="bold_td">${car.brand} </td>
        </c:forEach>
            <td></td>
    </tr>
    <tr>
        <td>Модель</td>
        <c:forEach items="${compareList}" var="car">
            <td class="bold_td">${car.model} </td>
        </c:forEach>
            <td></td>
    </tr>
    <tr>
        <td>Год</td>
        <c:forEach items="${compareList}" var="car">
            <td class="bold_td">${car.year} </td>
        </c:forEach>
        <td></td>
    </tr>
    <tr>
        <td>Цвет</td>
        <c:forEach items="${compareList}" var="car">
            <td class="bold_td">${car.color} </td>
        </c:forEach>
        <td></td>
    </tr>
    <tr>
        <td>Пробег, км</td>
        <c:forEach items="${compareList}" var="car">
            <td class="bold_td">${car.odo} </td>
        </c:forEach>
        <td></td>
    </tr>
    <tr>
        <td>Состояние</td>
        <c:forEach items="${compareList}" var="car">
            <td class="bold_td">${car.agregate} </td>
        </c:forEach>
        <td></td>
    </tr>
    <tr>
        <td>Кузов</td>
        <c:forEach items="${compareList}" var="car">
            <td class="bold_td">${car.frame} </td>
        </c:forEach>
        <td></td>
    </tr>
    <tr class="success"><td colspan="30"> Двигатель и трансмиссия </td></tr>
    <tr>
        <td>Тип</td>
        <c:forEach items="${compareList}" var="car">
            <td class="bold_td">${car.engine} </td>
        </c:forEach>
        <td></td>
    </tr>
    <tr>
        <td>Трансмиссия</td>
        <c:forEach items="${compareList}" var="car">
            <td class="bold_td">${car.transmition} </td>
        </c:forEach>
        <td></td>
    </tr>

    <tr class="success"><td colspan="30"> Дополнительные опции </td></tr>
    <tr>
        <td>Кожа</td>
        <c:forEach items="${compareList}" var="car">
            <td
                <c:if test="${car.hasSkin()}">
                    class="green_td"  > <span class="glyphicon glyphicon-ok"  aria-hidden="true"></span>
                </c:if>
                <c:if test="${car.hasSkin() == false}">
                    class="red_td" > <span class="glyphicon glyphicon-remove"  aria-hidden="true"></span>
                </c:if>
            </td>
        </c:forEach>
        <td></td>
    </tr>
    <tr>
        <td>Кондиционер</td>
        <c:forEach items="${compareList}" var="car">
            <td
                    <c:if test="${car.hasConditioner()}">
                        class="green_td"  > <span class="glyphicon glyphicon-ok"  aria-hidden="true"></span>
                    </c:if>
                    <c:if test="${car.hasConditioner() == false}">
                        class="red_td" > <span class="glyphicon glyphicon-remove"  aria-hidden="true"></span>
                    </c:if>
            </td>
        </c:forEach>
        <td></td>
    </tr>
    <tr>
        <td>Литые диски</td>
        <c:forEach items="${compareList}" var="car">
            <td
                    <c:if test="${car.hasCastDisk()}">
                        class="green_td"  > <span class="glyphicon glyphicon-ok"  aria-hidden="true"></span>
                    </c:if>
                    <c:if test="${car.hasCastDisk() == false}">
                        class="red_td" > <span class="glyphicon glyphicon-remove"  aria-hidden="true"></span>
                    </c:if>
            </td>
        </c:forEach>
        <td></td>
    </tr>
    <tr class="success"><td colspan="30">Стоимость</td></tr>
    <tr>
        <td></td>
        <c:forEach items="${compareList}" var="car">
            <td class="red_td">$${car.price} </td>
        </c:forEach>
        <td></td>
    </tr>


</table>
</body>

<jsp:include page="elements/footer.jsp"/>

</html>
