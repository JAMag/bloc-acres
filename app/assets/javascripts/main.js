$(document).ready(function () {

    $(document).on("scroll", function () {
        if (window.scrollY > 100) {
            $('.navbar-brand').fadeOut();
        }
        else {
            $('.navbar-brand').fadeIn();
        }
    }, false);


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