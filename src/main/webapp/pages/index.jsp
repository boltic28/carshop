<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Авто мир</title>
    <jsp:include page="elements/head.jsp"/>
</head>

<body>

    <jsp:include page="elements/head.jsp"/>
    <jsp:include page="elements/navHead.jsp"/>
    <jsp:include page="elements/news.jsp"/>


    <section class="main_section">
        <h2>Популярные товары.</h2>
        <hr>
        <div class="row">
            <c:forEach items="${topGoods}" var="car">
                <jsp:useBean id="car" scope="page" type="models.Car"/>
                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 top_car">
                    <p>
                        <span>$${car.price}</span>

                    </p>
                    <a href="cars/${car.id}"><img src="${pageContext.request.contextPath}/pages/img/${car.img1}"></a>
                    <p>
                    <h4>${car.brand} ${car.model}</h4> ${car.year} г.в., ${car.odo}км
                    </p>
                </div>
            </c:forEach>

        </div>
    </section>


</body>

<jsp:include page="elements/footer.jsp"/>

</html>
