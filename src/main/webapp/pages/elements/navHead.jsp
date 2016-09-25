<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean class="models.User"  id="user" scope="page" type="models.User"/>

<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">EfTech</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li ><a href="#">Главная <span class="sr-only">(current)</span></a></li> <!--class="active"-->
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Витрины <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="/cars">Авто</a></li>
                        <li><a href="/moto">Мото</a></li>
                        <li><a href="#">Прицепы</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">Другое</a></li>
                    </ul>
                </li>
            </ul>
            <form class="navbar-form navbar-left" role="search">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Что вас интересует">
                </div>
                <button type="submit" class="btn btn-default">Поискать</button>
            </form>
            <ul class="nav navbar-nav navbar-right">
                <c:set var="user" scope="page" value="${curUser}" />

                <c:if test="${curUser.role == 'ROLE_ADMIN'}">
                    <li class="entered_user">Администратор ${curUser.name}</li>
                    <li><a href="admin">Управление</a></li>
                    <li><a href="/logout">Выйти</a></li>
                </c:if>

                <c:if test="${curUser.role == 'ROLE_USER'}">
                        <li class="entered_user">Пользователь ${curUser.name}</li>
                        <li><a href="/logout">Выйти</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Покупки<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="/basket">Корзина <b>${totGoods}</b></a></li>
                                <li><a href="#">Популярные товары</a></li>
                                <li><a href="/comparsion">Сравнить мои товары</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="/basket/delall">Очистить корзину</a></li>
                            </ul>
                        </li>
                </c:if>

                <c:if test="${curUser == null}">
                    <li><a href="/login">Войти</a></li>
                        <li><a href="#" onclick=add_user('/register')>Зарегистрироваться</a></li>
                </c:if>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>