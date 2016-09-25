<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="modal fade" id="addPhotoToCar">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h2 class="modal-title">Загрузка фото</h2>
            </div>
            <div class="modal-body">

                <form:form modelAttribute="car" enctype="multipart/form-data" accept="image/jpg" class="form-horizontal" method="post" id="carForm" action="">

                    <div class="form-group">
                        <label for="img1f" class="control-label col-xs-3">Фото 1 (Главное)</label>

                        <div class="col-xs-9">
                            <input type="file" class="form-control" id="img1f" name="img1f">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="img2f" class="control-label col-xs-3">фото 2</label>

                        <div class="col-xs-9">
                            <input type="file" class="form-control" id="img2f" name="img2f">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="img3f" class="control-label col-xs-3">фото 3</label>

                        <div class="col-xs-9">
                            <input type="file" class="form-control" id="img3f" name="img3f">
                        </div>
                    </div>

                    <div class="form-group">
                        <hr>
                        <div class="col-xs-offset-3 col-xs-9">
                            <button type="submit" class="btn btn-success">Загрузить</button>
                        </div>
                    </div>

                </form:form>
            </div>
        </div>
    </div>
</div>