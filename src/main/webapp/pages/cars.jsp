<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cars</title>
    <jsp:include page="elements/head.jsp"/>
</head>
<body>
list of cars....<hr>

<table class="table table-striped display" id="carsTable">
    <thead>
    <tr>
        <th></th>
        <th>Brand</th>
        <th>Model</th>
        <th>Transmition</th>
        <th>Frame</th>
        <th>Engine</th>
        <th>Agregate</th>
        <th>curKM</th>
        <th>Year</th>
        <th>cond</th>
        <th>skin</th>
        <th>castdisk</th>
        <th>count of view</th>
    </tr>
    </thead>

    <c:forEach items="${carList}" var="car">
        <jsp:useBean id="car" scope="page" type="models.Car"/>
        <tr>
            <td><img src="img/${car.img1}.jpg"></td>
            <td><c:out value="${car.brand}"/></td>
            <td><c:out value="${car.model}"/></td>
            <td><c:out value="${car.transmition}"/></td>
            <td><c:out value="${car.frame}"/></td>
            <td><c:out value="${car.engine}"/></td>
            <td><c:out value="${car.agregate}"/></td>
            <td><c:out value="${car.odo}"/></td>
            <td><c:out value="${car.year}"/></td>
            <td><c:out value="${car.hasConditioner()}"/></td>
            <td><c:out value="${car.hasSkin()}"/></td>
            <td><c:out value="${car.hasCastDisk()}"/></td>
            <td><c:out value="${car.view}"/></td>
        </tr>
    </c:forEach>

</table>
</body>

<jsp:include page="elements/footer.jsp"/>

</html>