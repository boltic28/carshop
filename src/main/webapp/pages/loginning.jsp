<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Log in</title>
    <jsp:include page="elements/head.jsp"/>
</head>

<body>

<section class="main_section">
    <h2>Авторизация</h2>
    <p class="message_info">${mess}</p>
    <hr>
</section>

<section class="admin-log-field">
    <c:url value="/j_spring_security_check" var="loginUrl" />
    <form class="form-horizontal form-admin" action="${loginUrl}" method="post" id="aadmin-log">

        <div class="form-group">
            <label for="j_username" class="control-label col-xs-6">Введите e-mail</label>

            <div class="col-xs-6">
                <input type="email" class="form-control" name="j_username" id="j_username" placeholder="Email address">
            </div>
        </div>

        <div class="form-group">
            <label for="j_password" class="control-label col-xs-6">Введите пароль</label>

            <div class="col-xs-6">
                <input type="password" class="form-control" name="j_password" id="j_password" placeholder="Password">
            </div>
        </div>

        <button class="btn btn-lg btn-success btn-block" type="submit">Войти</button>
    </form>
</section>

</body>

<jsp:include page="elements/footer.jsp"/>

</html>

