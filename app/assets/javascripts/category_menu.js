$(function() {
    $( '#menu' ).menu({
        select: function( event, ui ) {
            var link = ui.item.children( "a:first" );
            if ( link.attr( "target" ) || event.metaKey || event.shiftKey || event.ctrlKey ) {
                return;
            }
            location.href = link.attr( "href" );
        }
    });
});