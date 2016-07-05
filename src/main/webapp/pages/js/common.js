/**
 * Created by Сергей on 04.07.2016.
 */


function add_user(){
    $('#login_window').hide();
    $('#editRowUser').modal();
    $('#editRowUser').find('#id').val(0);
    $('#editRowUser').find('#email').val('');
    $('#editRowUser').find('#password').val('');

}

function login(mail){
    if(mail != null){
        $('#login_window').find('#login').val(mail);
    }
    $('#login_window').modal();

}

