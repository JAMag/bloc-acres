$(document).ready(function () {




    $("#structure").click(function() {
        $("#structure1").toggle();
        $("#address1").hide();
        $("#description1").hide();
        $("#price1").hide();
        $("#bedrooms1").hide();
        $("#baths1").hide();
        $("#acres1").hide();
        $("#review1").hide();
        var val = 14+ '%';
        $('.progress-bar').width(val).text(val)
    });
    $("#address").click(function() {
        $("#structure1").hide();
        $("#address1").toggle();
        $("#description1").hide();
        $("#price1").hide();
        $("#bedrooms1").hide();
        $("#baths1").hide();
        $("#acres1").hide();
        $("#review1").hide();
        var val = 28 + '%';
        $('.progress-bar').width(val).text(val)
    });
    $("#description").click(function() {
        $("#structure1").hide();
        $("#address1").hide();
        $("#description1").toggle();
        $("#price1").hide();
        $("#bedrooms1").hide();
        $("#baths1").hide();
        $("#acres1").hide();
        $("#review1").hide();
        var val = 42 + '%';
        $('.progress-bar').width(val).text(val)
    });
    $("#price").click(function() {
        $("#structure1").hide();
        $("#address1").hide();
        $("#description1").hide();
        $("#price1").toggle();
        $("#bedrooms1").hide();
        $("#baths1").hide();
        $("#acres1").hide();
        $("#review1").hide();
        var val = 56 + '%';
        $('.progress-bar').width(val).text(val)
    });
    $("#bedrooms").click(function() {
        $("#structure1").hide();
        $("#address1").hide();
        $("#description1").hide();
        $("#price1").hide();
        $("#bedrooms1").toggle();
        $("#baths1").hide();
        $("#acres1").hide();
        $("#review1").hide();
        var val = 70 + '%';
        $('.progress-bar').width(val).text(val)
    });
    $("#baths").click(function() {
        $("#structure1").hide();
        $("#address1").hide();
        $("#description1").hide();
        $("#price1").hide();
        $("#bedrooms1").hide();
        $("#baths1").toggle();
        $("#acres1").hide();
        $("#review1").hide();
        var val = 84 + '%';
        $('.progress-bar').width(val).text(val)
    });
    $("#acres").click(function() {
        $("#structure1").hide();
        $("#address1").hide();
        $("#description1").hide();
        $("#price1").hide();
        $("#bedrooms1").hide();
        $("#baths1").hide();
        $("#acres1").toggle();
        $("#review1").hide();
        var val = 98 + '%';
        $('.progress-bar').width(val).text(val)
    });
    $("#review").click(function() {
        $("#acres1").toggle();
        $("#baths1").toggle();
        $("#bedrooms1").toggle();
        $("#price1").toggle();
        $("#description1").toggle();
        $("#address1").toggle();
        $("#structure1").toggle();
        $("#review1").toggle();
        var val = 100 + '%';
        $('.progress-bar').width(val).text(val)
    });



    $("#buyers").click(function() {
        $("#buyers1").toggle();
        $("#buyeroffers1").hide();
        $("#purchprice1").hide();
        $("#duration1").hide();
        $("#pnsagreement1").hide();
        $("#closing1").hide();
        $("#escrow1").hide();
        $("#contingencies1").hide();
        $("#mortgage1").hide();
        $("#inspections1").hide();
        $("#representations1").hide();
        $("#buyerdefault1").hide();
        $("#addterms1").hide();
        var val = 14 + '%';
        $('.progress-bar').width(val).text(val)
    });
    $("#buyeroffers").click(function() {
        $("#buyers1").hide();
        $("#buyeroffers1").toggle();
        $("#purchprice1").hide();
        $("#duration1").hide();
        $("#pnsagreement1").hide();
        $("#closing1").hide();
        $("#escrow1").hide();
        $("#contingencies1").hide();
        $("#mortgage1").hide();
        $("#inspections1").hide();
        $("#representations1").hide();
        $("#buyerdefault1").hide();
        $("#addterms1").hide();
        var val = 28 + '%';
        $('.progress-bar').width(val).text(val)
    });
    $("#purchprice").click(function() {
        $("#buyers1").hide();
        $("#buyeroffers1").hide();
        $("#purchprice1").toggle();
        $("#duration1").hide();
        $("#pnsagreement1").hide();
        $("#closing1").hide();
        $("#escrow1").hide();
        $("#contingencies1").hide();
        $("#mortgage1").hide();
        $("#inspections1").hide();
        $("#representations1").hide();
        $("#buyerdefault1").hide();
        $("#addterms1").hide();
        var val = 42 + '%';
        $('.progress-bar').width(val).text(val)
    });
    $("#duration").click(function() {
        $("#buyers1").hide();
        $("#buyeroffers1").hide();
        $("#purchprice1").hide();
        $("#duration1").toggle();
        $("#pnsagreement1").hide();
        $("#closing1").hide();
        $("#escrow1").hide();
        $("#contingencies1").hide();
        $("#mortgage1").hide();
        $("#inspections1").hide();
        $("#representations1").hide();
        $("#buyerdefault1").hide();
        $("#addterms1").hide();
        var val = 56 + '%';
        $('.progress-bar').width(val).text(val)
    });
    $("#pnsagreement").click(function() {
        $("#buyers1").hide();
        $("#buyeroffers1").hide();
        $("#purchprice1").hide();
        $("#duration1").hide();
        $("#pnsagreement1").toggle();
        $("#closing1").hide();
        $("#escrow1").hide();
        $("#contingencies1").hide();
        $("#mortgage1").hide();
        $("#inspections1").hide();
        $("#representations1").hide();
        $("#buyerdefault1").hide();
        $("#addterms1").hide();
        var val = 70 + '%';
        $('.progress-bar').width(val).text(val)
    });
    $("#closing").click(function() {
        $("#buyers1").hide();
        $("#buyeroffers1").hide();
        $("#purchprice1").hide();
        $("#duration1").hide();
        $("#pnsagreement1").hide();
        $("#closing1").toggle();
        $("#escrow1").hide();
        $("#contingencies1").hide();
        $("#mortgage1").hide();
        $("#inspections1").hide();
        $("#representations1").hide();
        $("#buyerdefault1").hide();
        $("#addterms1").hide();
        var val = 84 + '%';
        $('.progress-bar').width(val).text(val)
    });
    $("#escrow").click(function() {
        $("#buyers1").hide();
        $("#buyeroffers1").hide();
        $("#purchprice1").hide();
        $("#duration1").hide();
        $("#pnsagreement1").hide();
        $("#closing1").hide();
        $("#escrow1").toggle();
        $("#contingencies1").hide();
        $("#mortgage1").hide();
        $("#inspections1").hide();
        $("#representations1").hide();
        $("#buyerdefault1").hide();
        $("#addterms1").hide();
        var val = 98 + '%';
        $('.progress-bar').width(val).text(val)
    });
    $("#contingencies").click(function() {
        $("#buyers1").hide();
        $("#buyeroffers1").hide();
        $("#purchprice1").hide();
        $("#duration1").hide();
        $("#pnsagreement1").hide();
        $("#closing1").hide();
        $("#escrow1").hide();
        $("#contingencies1").toggle();
        $("#mortgage1").hide();
        $("#inspections1").hide();
        $("#representations1").hide();
        $("#buyerdefault1").hide();
        $("#addterms1").hide();
        var val = 100 + '%';
        $('.progress-bar').width(val).text(val)
    });
    $("#mortgage").click(function() {
        $("#buyers1").hide();
        $("#buyeroffers1").hide();
        $("#purchprice1").hide();
        $("#duration1").hide();
        $("#pnsagreement1").hide();
        $("#closing1").hide();
        $("#escrow1").hide();
        $("#contingencies1").hide();
        $("#mortgage1").toggle();
        $("#inspections1").hide();
        $("#representations1").hide();
        $("#buyerdefault1").hide();
        $("#addterms1").hide();
        var val = 100 + '%';
        $('.progress-bar').width(val).text(val)
    });
    $("#inspections").click(function() {
        $("#buyers1").hide();
        $("#buyeroffers1").hide();
        $("#purchprice1").hide();
        $("#duration1").hide();
        $("#pnsagreement1").hide();
        $("#closing1").hide();
        $("#escrow1").hide();
        $("#contingencies1").hide();
        $("#mortgage1").hide();
        $("#inspections1").toggle();
        $("#representations1").hide();
        $("#buyerdefault1").hide();
        $("#addterms1").hide();
        var val = 100 + '%';
        $('.progress-bar').width(val).text(val)
    });
    $("#representations").click(function() {
        $("#buyers1").hide();
        $("#buyeroffers1").hide();
        $("#purchprice1").hide();
        $("#duration1").hide();
        $("#pnsagreement1").hide();
        $("#closing1").hide();
        $("#escrow1").hide();
        $("#contingencies1").hide();
        $("#mortgage1").hide();
        $("#inspections1").hide();
        $("#representations1").toggle();
        $("#buyerdefault1").hide();
        $("#addterms1").hide();
        var val = 100 + '%';
        $('.progress-bar').width(val).text(val)
    });
    $("#buyerdefault").click(function() {
        $("#buyers1").hide();
        $("#buyeroffers1").hide();
        $("#purchprice1").hide();
        $("#duration1").hide();
        $("#pnsagreement1").hide();
        $("#closing1").hide();
        $("#escrow1").hide();
        $("#contingencies1").hide();
        $("#mortgage1").hide();
        $("#inspections1").hide();
        $("#representations1").hide();
        $("#buyerdefault1").toggle();
        $("#addterms1").hide();
        var val = 100 + '%';
        $('.progress-bar').width(val).text(val)
    });
    $("#addterms").click(function() {
        $("#buyers1").hide();
        $("#buyeroffers1").hide();
        $("#purchprice1").hide();
        $("#duration1").hide();
        $("#pnsagreement1").hide();
        $("#closing1").hide();
        $("#escrow1").hide();
        $("#contingencies1").hide();
        $("#mortgage1").hide();
        $("#inspections1").hide();
        $("#representations1").hide();
        $("#buyerdefault1").hide();
        $("#addterms1").toggle();
        var val = 100 + '%';
        $('.progress-bar').width(val).text(val)
    });






    $(function () {
            $('.navbar-brand').fadeOut(2000);
    });

    if ($('#start_show')) {
        addLocationToLinks();
    };


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








var $star_rating = $('.star-rating .fa');

var SetRatingStar = function() {
    return $star_rating.each(function() {
        if (parseInt($star_rating.siblings('input.rating-value').val()) >= parseInt($(this).data('rating'))) {
            return $(this).removeClass('fa-star-o').addClass('fa-star');
        } else {
            return $(this).removeClass('fa-star').addClass('fa-star-o');
        }
    });
};

$star_rating.on('click', function() {
    $star_rating.siblings('input.rating-value').val($(this).data('rating'));
    return SetRatingStar();
});

SetRatingStar();


function addLocationToLinks() {
    if (navigator.geolocation) {
        position = navigator.geolocation.getCurrentPosition();
        link = $('#start_show');
        link.href = link.href + '?lat=' + position.coords.latitude + '&long=' + position.coords.longitude;
    } else {
        alert("Call us.");
    }
}

//multiple image preview
function readURL(input) {

    for (var i = 0; i < input.files.length; i++) {
        if (input.files [i]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#img_prev')
                    .attr('src', e.target.result)
                    .width("50%")
                    .height("50%");
            };

            reader.readAsDataURL(input.files[0]);

        }
    }
}


function readURL1(input) {

    for (var i = 0; i < input.files.length; i++) {
        if (input.files [i]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#img_prev1')
                    .attr('src', e.target.result)
                    .width("50%")
                    .height("50%");
            };

            reader.readAsDataURL(input.files[0]);
        }
    }
}

function readURL2(input) {

    for (var i = 0; i < input.files.length; i++) {
        if (input.files [i]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#img_prev2')
                    .attr('src', e.target.result)
                    .width("50%")
                    .height("50%");
            };

            reader.readAsDataURL(input.files[0]);
        }
    }
}


function readURL3(input) {

    for (var i = 0; i < input.files.length; i++) {
        if (input.files [i]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#img_prev3')
                    .attr('src', e.target.result)
                    .width("50%")
                    .height("50%");
            };

            reader.readAsDataURL(input.files[0]);
        }
    }
}

function readURL4(input) {

    for (var i = 0; i < input.files.length; i++) {
        if (input.files [i]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#img_prev4')
                    .attr('src', e.target.result)
                    .width("50%")
                    .height("50%");
            };

            reader.readAsDataURL(input.files[0]);
        }
    }
}

function readURL5(input) {

    for (var i = 0; i < input.files.length; i++) {
        if (input.files [i]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#img_prev5')
                    .attr('src', e.target.result)
                    .width("50%")
                    .height("50%");
            };

            reader.readAsDataURL(input.files[0]);
        }
    }
}

function readURL6(input) {

    for (var i = 0; i < input.files.length; i++) {
        if (input.files [i]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#img_prev6')
                    .attr('src', e.target.result)
                    .width("50%")
                    .height("50%");
            };

            reader.readAsDataURL(input.files[0]);
        }
    }
}

function readURL7(input) {

    for (var i = 0; i < input.files.length; i++) {
        if (input.files [i]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#img_prev7')
                    .attr('src', e.target.result)
                    .width("50%")
                    .height("50%");
            };

            reader.readAsDataURL(input.files[0]);
        }
    }
}

function readURL8(input) {

    for (var i = 0; i < input.files.length; i++) {
        if (input.files [i]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#img_prev8')
                    .attr('src', e.target.result)
                    .width("50%")
                    .height("50%");
            };

            reader.readAsDataURL(input.files[0]);
        }
    }
}

function readURL9(input) {

    for (var i = 0; i < input.files.length; i++) {
        if (input.files [i]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#img_prev9')
                    .attr('src', e.target.result)
                    .width("50%")
                    .height("50%");
            };

            reader.readAsDataURL(input.files[0]);
        }
    }
}

function readURL10(input) {

    for (var i = 0; i < input.files.length; i++) {
        if (input.files [i]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#img_prev10')
                    .attr('src', e.target.result)
                    .width("50%")
                    .height("50%");
            };

            reader.readAsDataURL(input.files[0]);
        }
    }
}

function readURL11(input) {

    for (var i = 0; i < input.files.length; i++) {
        if (input.files [i]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#img_prev11')
                    .attr('src', e.target.result)
                    .width("50%")
                    .height("50%");
            };

            reader.readAsDataURL(input.files[0]);
        }
    }
}

function readURL12(input) {

    for (var i = 0; i < input.files.length; i++) {
        if (input.files [i]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#img_prev12')
                    .attr('src', e.target.result)
                    .width("50%")
                    .height("50%");
            };

            reader.readAsDataURL(input.files[0]);
        }
    }
}


