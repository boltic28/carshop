<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin-panel Cars</title>
    <jsp:include page="../elements/head.jsp"/>
</head>

<body>

<section class="head_block">
    <h2>Вход в панель администратора</h2>
    <hr>
</section>

    <section class="admin-log-field">
    <form class="form-horizontal form-admin" method="post" id="aadmin-log" >

        <div class="form-group">
            <label for="login" class="control-label col-xs-6">Введите e-mail</label>

            <div class="col-xs-6">
                <input type="email" class="form-control" id="login" name="login" autocomplete="off"
                       placeholder="Введите e-mail">
            </div>
        </div>

        <div class="form-group">
            <label for="password" class="control-label col-xs-6">Введите пароль</label>

            <div class="col-xs-6">
                <input type="password" class="form-control" id="password" name="password" autocomplete="off"
                       placeholder="Введите пароль">
            </div>
        </div>

        <div class="form-group">
            <div class="col-xs-offset-3 col-xs-12">
                <button type="submit" class="btn btn-success" >Попытать удачу :)</button>
            </div>
        </div>
    </form>
    </section>

</body>

<jsp:include page="../elements/footer.jsp"/>

</html>
