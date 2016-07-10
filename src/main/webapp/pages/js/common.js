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
