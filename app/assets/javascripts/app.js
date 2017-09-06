$(document).ready(function () {
    
    var $bannerSlider = $(".banner__slider");
    $bannerSlider.slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        dots: true,
        arrows: false,
        appendDots: $(".banner__controls")
    });
    
    var $menuTrigger = $(".menu__trigger");
    var $menu = $(".menu");
    
    $menuTrigger.click(function () {
        $menuTrigger.toggleClass("menu__trigger--active");
        $menu.toggleClass("menu--active");
    });
    
});