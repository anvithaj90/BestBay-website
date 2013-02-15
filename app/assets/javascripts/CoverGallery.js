/**
 * Created with JetBrains RubyMine.
 * User: lenix
 * Date: 12-10-22
 * Time: PM1:15
 * To change this template use File | Settings | File Templates.
 *
$(function () {
    $('#myGallery').galleryView();
});

jQuery(function ($) {
    $('.circle').mosaic({
        opacity:0.8            //Opacity for overlay (0-1)
    });

    $('.bar').mosaic({
        animation:'slide'        //fade or slide
    });
});   */