$(document).ready(function () {
    $('.phone').inputmask('0999999999');

    $('#show-hide-aids-form').click(function(){
        $('#aids-form').slideToggle();
    });

    $('.post-item-pseudolink').click(function(){
        $(this).next('.post-item-body').slideToggle();
    });
});