//= require jquery
//= require jquery_ujs
//= require jquery3
//= require bootstrap-sprockets
//= require jquery.form-validator
//= require form-validator/brazil.js
//= require form-validator/date.js
//= require form-validator/pt.js
//= require jquery.inputmask.bundle.min
//= require_tree .

$(document).ready(function(){
    $('input[type="text"]').inputmask();
});
