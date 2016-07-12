/**
 * Created by Сергей on 04.07.2016.
 */


function add_user(act){
    $('#login_window').hide();
    $('#editRowUser').modal();
    $('#editRowUser').find('#id').val(0);
    $('#editRowUser').find('#email').val('');
    $('#editRowUser').find('#password').val('');
    $('#editRowUser').find('#detailsForm').attr("action",act);

}

function login(mail){
    if(mail != null){
        $('#login_window').find('#login').val(mail);
    }
    $('#login_window').modal();

}

function add_car(){
    $('#editRowCar').modal();
}

function set_car(id, brand, model, transmition, color, engine, year, price, odo, view, frame, agregate, skin, conditioner, castDisk, img1, img2, img3){
    $('.modal-header').find('h2').text("Настройка "+ brand.toUpperCase() + " " + model.toUpperCase() + ". Просмотров - " + view);

    $('#editRowCar').modal();
    $('#carForm').find('#view').val(view);

    $('#carForm').find('#id').val(id);
    $('#editRowCar').find('#brand').val(brand);
    $('#editRowCar').find('#model').val(model);
    $('#editRowCar').find('#transmition').val(transmition);
    $('#editRowCar').find('#color').val(color);
    $('#editRowCar').find('#engine').val(engine);
    $('#editRowCar').find('#year').val(year);
    $('#editRowCar').find('#price').val(price);
    $('#editRowCar').find('#odo').val(odo);
    $('#editRowCar').find('#frame').val(frame);
    $('#editRowCar').find('#agregate').val(agregate);

    if(skin == 'true') $('#editRowCar').find('#skin').prop('checked', true);
    if(conditioner == 'true') $('#editRowCar').find('#conditioner').prop('checked', true);
    if(castDisk == 'true') $('#editRowCar').find('#castDisk').prop('checked', true);

    $('#editRowCar').find('#img1').val(img1);
    $('#editRowCar').find('#img2').val(img2);
    $('#editRowCar').find('#img3').val(img3);
}

//for filter
function fillModels(brand, mapOfModels){
    $('#models_list').set(mapOfModels.get(brand))
}

function add() {
    var element = document.createElement('div');
    element.innerHTML = '' +
        '<c:forEach items="${brands_list.get(brand)}" var="model">'+
        '<option value="${model}">${model.toUpperCase()}</option>'+
        '</c:forEach>' +
        '', element.id = 'div123';
    document.body.appendChild(element);
}
