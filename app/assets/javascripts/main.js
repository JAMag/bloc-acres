$(document).ready(function () {

    $(function () {
            $('.navbar-brand').fadeOut(4000);
    });


    $('#search-field select').change(function () {
        $('#search-field').submit();
    });

    $(".nav-tabs a").click(function () {
        $(this).tab('show');
    });

    $(function () {
        $('div.title').fadeIn(4000).removeClass('title');
    });

});




