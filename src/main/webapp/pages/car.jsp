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
    <%--<jsp:useBean class="models.Car"  id="car" scope="page" type="models.Car"/>--%>
    <c:set var="car" scope="page" value="${curcar}" />
    list of cars....<hr>
    ${isLogin}<br>
    price - ${car.price}


</body>

<jsp:include page="elements/footer.jsp"/>

</html>
