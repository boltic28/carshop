<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="modal fade" id="addCarFromExcel">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h2 class="modal-title">Создание авто</h2>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" enctype="multipart/form-data" accept="doc/xls" method="post" id="carForm" action="/admin/car/add-excel">
                    <p><input type="file" name="file"><hr>
                        <input type="submit" value="Загрузить"></p>
                </form>
            </div>
        </div>
    </div>
</div>