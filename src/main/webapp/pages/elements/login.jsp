<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div class="modal fade" id="login_window">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h2 class="modal-title">Вход в аккаунт</h2>
            </div>

            <div class="modal-body">
                <form:form class="form-horizontal" method="post" id="detailsForm" >  <!--action="/user"-->

                    <div class="form-group">
                        <label for="login" class="control-label col-xs-3">Введите e-mail</label>

                        <div class="col-xs-9">
                            <input type="email" class="form-control" id="login" name="login" autocomplete="off"
                                   placeholder="Введите ваш e-mail">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="password" class="control-label col-xs-3">Введите пароль</label>

                        <div class="col-xs-9">
                            <input type="password" class="form-control" id="password" name="password" autocomplete="off"
                                   placeholder="Введите пароль">
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-xs-offset-3 col-xs-9">
                            <button type="submit" class="btn btn-success" >Войти</button>
                            <a class="btn btn-primary btn_in_text" role="button" onclick="add_user()">Регистрация</a> <!---->
                        </div>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</div>