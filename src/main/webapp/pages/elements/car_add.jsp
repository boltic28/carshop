<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="modal fade" id="editRowCar">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h2 class="modal-title">Создание авто</h2>
            </div>
            <div class="modal-body">

                <form:form modelAttribute="car" class="form-horizontal" method="post" id="carForm" action="/admin/car/add">
                    <input type="hidden" id="id" name="id">
                    <input type="hidden" id="view" name="view">

                    <%--<input type="hidden" id="registered" name="registered">--%>

                    <div class="form-group">
                        <label for="brand" class="control-label col-xs-3">Марка</label>

                        <div class="col-xs-9">
                            <input type="text" class="form-control" id="brand" name="brand" required autofocus
                                   placeholder="Марка">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="model" class="control-label col-xs-3">Модель</label>

                        <div class="col-xs-9">
                            <input type="text" class="form-control" id="model" name="model" required
                                   placeholder="Модель">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="transmition" class="control-label col-xs-3">Трансмиссия</label>

                        <div class="col-xs-9">
                            <select id="transmition" class="form-control" name="transmition">
                                <option value="automatic">автоматическая</option>
                                <option value="manual">механическая</option>
                                <option value="dsg">робот</option>
                                <option value="cvt">вариатор</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="color" class="control-label col-xs-3">Цвет</label>
                        <div class="col-xs-9">
                        <select id="color" class="form-control" name="color">
                            <option value="all">Не важно</option>
                            <option value="white">Белый</option>
                            <option value="coffe">Бежевый</option>
                            <option value="gray">Серый</option>
                            <option value="blue">Синий</option>
                            <option value="green">Зеленый</option>
                            <option value="brown">Коричневый</option>
                            <option value="red">Красный</option>
                            <option value="black">Черный</option>
                        </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="engine" class="control-label col-xs-3">Двигатель</label>

                        <div class="col-xs-9">
                            <select id="engine" class="form-control" name="engine">
                                <option value="all">Не важно</option>
                                <option value="diesel">Дизель</option>
                                <option value="gasoline">Бензин</option>
                                <option value="electro">Электро</option>
                                <option value="gas">Газ</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="year" class="control-label col-xs-3">Год выпуска</label>

                        <div class="col-xs-9">
                            <select id="year" class="form-control" name="year">
                                <option value="0">Не важно</option>
                                <c:forEach var="i" begin="1950" end="2016">
                                Item <c:out value="${i}"/>
                                <option value="<c:out value="${i}"/>"><c:out value="${i}"/> год</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="odo" class="control-label col-xs-3">Пробег</label>

                        <div class="col-xs-9">
                            <input type="number" min="0" max="1000000" class="form-control" id="odo" name="odo"
                                   placeholder="0 - 1 000 000 км">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="frame" class="control-label col-xs-3">Кузов</label>

                        <div class="col-xs-9">
                            <select id="frame" class="form-control" name="frame">
                                <option value="all">Не важно</option>
                                <option value="sedan">Седан</option>
                                <option value="hatchback">Хетчбек</option>
                                <option value="coupe">Купе</option>
                                <option value="van">Универсал</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="agregate" class="control-label col-xs-3">Состояние</label>

                        <div class="col-xs-9">
                            <select id="agregate" class="form-control" name="agregate">
                                <option value="all">Не важно</option>
                                <option value="new">Новый</option>
                                <option value="used">б.у.</option>
                                <option value="critical">аварийный</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="price" class="control-label col-xs-3">Цена</label>

                        <div class="col-xs-9">
                            <input type="number" class="form-control" id="price" name="price"
                                   placeholder="Цена в $">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="skin" class="control-label col-xs-3">Кожа</label>

                        <div class="col-xs-1">
                            <input type="checkbox" class="form-control" id="skin" name="skin">
                        </div>

                        <label for="conditioner" class="control-label col-xs-3">Кондиционер</label>

                        <div class="col-xs-1">
                            <input type="checkbox" class="form-control" id="conditioner" name="conditioner">
                        </div>

                        <label for="castDisk" class="control-label col-xs-3">Литые диски</label>

                        <div class="col-xs-1">
                            <input type="checkbox" class="form-control" id="castDisk" name="castDisk">
                        </div>
                    </div>

                    <div class="form-group">
                        <hr>
                        <label for="img1" class="control-label col-xs-3">Фото 1</label>

                        <div class="col-xs-9">
                            <input type="text" class="form-control" id="img1" name="img1"
                                   placeholder="Повторите пароль">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="img2" class="control-label col-xs-3">фото 2</label>

                        <div class="col-xs-9">
                            <input type="text" class="form-control" id="img2" name="img2"
                                   placeholder="Повторите пароль">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="img3" class="control-label col-xs-3">фото 3</label>

                        <div class="col-xs-9">
                            <input type="text" class="form-control" id="img3" name="img3"
                                   placeholder="Повторите пароль">
                        </div>
                    </div>

                    <div class="form-group">
                        <hr>
                        <div class="col-xs-offset-3 col-xs-9">
                            <button type="submit" class="btn btn-success">Сохранить</button> <!--onclick="user_create()"-->
                        </div>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</div>