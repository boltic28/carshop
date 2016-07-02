<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Users</title>
    <jsp:include page="elements/head.jsp"/>
</head>

<body>

<table class="table table-striped display" id="usersTable">
    <thead>
    <tr>
        <th>Name</th>
        <th>Email</th>
        <th>ID</th>
        <th></th>
    </tr>
    </thead>

    <c:forEach items="${userList}" var="user">
        <jsp:useBean id="user" scope="page" type="models.User"/>
        <tr>
            <td><c:out value="${user.name}"/></td>
            <td><a href="mailto:${user.email}">${user.email}</a></td>
            <td>${user.password}</td>
        </tr>
    </c:forEach>

</table>
</body>

<jsp:include page="elements/footer.jsp"/>

</html>
