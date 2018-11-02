//= require jquery.inputmask.bundle.min
//= require form-validator/jquery.form-validator.min.js
//= require form-validator/brazil.js
//= require form-validator/date.js
//= require form-validator/pt.js
//= require bootstrap_sb_admin_base_v2
//= require bootstrap.growl
//= require bootbox*/



$.rails.allowAction = function(element) {
    var message = element.attr('data-confirm');
    if (!message) { return true; }

    console.log(message);

    var opts = {
        title: "Confirmação",
        message: message,
        buttons: {
            confirm: {
                label: 'Sim',
                className: 'btn-success'
            },
            cancel: {
                label: 'Não',
                className: 'btn-danger'
            }
        },
        callback: function(result) {
            if (result) {
                element.removeAttr('data-confirm');
                element.trigger('click.rails')
            }
        }
    };

    bootbox.confirm(opts);

    return false;
}

$(document).ready(function(){
    $('input[type="text"]').inputmask();
});
