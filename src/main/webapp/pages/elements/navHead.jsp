<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
                <li class="active"><a href="#">Главная <span class="sr-only">(current)</span></a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Витрины <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="/cars">Авто</a></li>
                        <li><a href="#">Мото</a></li>
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
                <li><a href="#">Войти</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Покупки<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="/basket">Корзина</a></li>
                        <li><a href="#">Популярные товары</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="/basket/delall">Очистить корзину</a></li>
                    </ul>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>