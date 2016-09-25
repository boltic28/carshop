<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="modal fade" id="setRowUser">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h2 class="modal-title">Изменение данных пользователя</h2>
                <p>зарегистрирован <span id="registered_since"> </span></p>
            </div>
            <div class="modal-body">

                <form:form modelAttribute="userTo" class="form-horizontal" method="post" id="detailsForm">
                    <input type="hidden" id="id" name="id">


                    <div class="form-group">
                        <label for="name" class="control-label col-xs-3">Логин</label>

                        <div class="col-xs-9">
                            <input type="text" class="form-control" id="name" name="name" required autofocus
                                   placeholder="Ваш логин">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="email" class="control-label col-xs-3">E-mail</label>

                        <div class="col-xs-9">
                            <input type="email" class="form-control" id="email" name="email" required
                                   placeholder="your@mail.com">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="password" class="control-label col-xs-3">Пароль</label>

                        <div class="col-xs-9">
                            <input type="text" class="form-control" id="password" name="password" required autocomplete="off"
                                   placeholder="Введите пароль">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="reg_password2" class="control-label col-xs-3">Пароль</label>

                        <div class="col-xs-9">
                            <input type="text" class="form-control" id="reg_password2" name="reg_password2"
                                   placeholder="Повторите пароль">
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="role" class="control-label col-xs-3">Права доступа</label>

                        <div class="col-xs-9">
                            <select id="role" class="form-control" name="role">
                                <option selected="selected" value="ROLE_USER">Пользователь</option>
                                <option value="ROLE_ADMIN">Администратор</option>

                            </select>
                        </div>
                    </div>


                    <div class="form-group">
                        <div class="col-xs-offset-3 col-xs-9">
                            <button type="submit" class="btn btn-success">Сохранить</button>
                        </div>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</div>