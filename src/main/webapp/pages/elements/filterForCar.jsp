<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean class="java.util.HashMap" id="brands_list" scope="page" type="java.util.HashMap"/>
<jsp:useBean class="java.util.ArrayList" id="models_list" scope="page" type="java.util.ArrayList"/>

<section>
    <h3>Настройка фильтра</h3>
    <hr>
        <form class="form-horizontal" method="post" id="filter-form" action="/cars" >

            <div class="form-group">
                <label for="cbrand" class="control-label col-xs-4">Марка:</label>
                    <div class="col-xs-8">
                        <select id="cbrand" class="form-control" name="cbrand">
                            <option value="all">Не важно</option>
                            <c:forEach items="${brands}" var="brand">
                                <jsp:useBean id="brand" scope="page" type="java.lang.String"/>
                                <option value="${brand}">${brand.toUpperCase()}</option>
                            </c:forEach>
                        </select>
                    </div>
            </div>

            <%--<div class="form-group">--%>
                <%--<label for="model" class="control-label col-xs-4">Модель:</label>--%>
                <%--<div class="col-xs-8">--%>
                    <%--<select id="model" class="form-control" name="model">--%>
                        <%--<option value="all">Не важно</option>--%>
                        <%--<c:set var="brands_list" scope="page" value="${models}" />--%>
                        <%----%>
                        <%--<c:forEach items="${brands_list.get(brand)}" var="model">--%>
                        <%--<option value="${model}">${model.toUpperCase()}</option>--%>
                        <%--</c:forEach>--%>
                        <%----%>
                    <%--</select>--%>
                <%--</div>--%>
            <%--</div>--%>

            <div class="form-group">
                <label for="price" class="control-label col-xs-4">Цена до:</label>
                <div class="col-xs-8">
                    <select id="price" class="form-control" name="price">
                        <option value="0">Не важно</option>
                        <option value="2000">$2 000</option>
                        <option value="5000">$5 000</option>
                        <option value="10000">$10 000</option>
                        <option value="15000">$15 000</option>
                        <option value="20000">$20 000</option>
                    </select>
                </div>
            </div>

            <div class="form-group">
                <label for="year" class="control-label col-xs-4">Год от:</label>
                <div class="col-xs-8">
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
                <label for="odo" class="control-label col-xs-4">Пробег до:</label>
                <div class="col-xs-8">
                    <select id="odo" class="form-control" name="odo">
                        <option value="0">Не важно</option>
                        <option value="2000">2 000 км</option>
                        <option value="10000">10 000 км</option>
                        <option value="50000">50 000 км</option>
                        <option value="100000">100 000 км</option>
                        <option value="200000">200 000 км</option>
                    </select>
                </div>
            </div>

            <div class="form-group">
                <label for="frame" class="control-label col-xs-4">Кузов:</label>
                <div class="col-xs-8">
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
                <label for="engine" class="control-label col-xs-4">Двигатель:</label>
                <div class="col-xs-8">
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
                <label for="agregate" class="control-label col-xs-4">Состояние:</label>
                <div class="col-xs-8">
                    <select id="agregate" class="form-control" name="agregate">
                        <option value="all">Не важно</option>
                        <option value="new">Новый</option>
                        <option value="used">б.у.</option>
                        <option value="critical">аварийный</option>
                    </select>
                </div>
            </div>

            <div class="form-group">
                <label for="color" class="control-label col-xs-4">Цвет:</label>
                <div class="col-xs-8">
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
                <div class="col-xs-offset-4 col-xs-9">
                    <button type="submit" class="btn btn-default" >Фильтровать</button>
                    <a class="btn btn-danger btn_in_text" role="button" href="/cars">Сбросить</a> <!---->
                </div>
            </div>
        </form>
</section>

