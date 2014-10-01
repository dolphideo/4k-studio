( function( $ ) {
    // Init Skrollr
if(!(/Android|iPhone|iPad|iPod|BlackBerry|Windows Phone/i).test(navigator.userAgent || navigator.vendor || window.opera)){
    var s = skrollr.init({
        // render: function(data) {
        //     //Debugging - Log the current scroll position.
        //     console.log(data.curTop);
        // };
        forceHeight: false
    });
    s.refresh($('#clients'));
} else {
  $('#clients .bcg').css('background-attachment', 'scroll');
  $('#contact .bcg').css('background-attachment', 'scroll');
}


} )( jQuery );