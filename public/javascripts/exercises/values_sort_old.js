  $(document).ready(function() {

    $("#values-universe1, #values-universe2").sortable({
      connectWith: '.connectedSortable',
      over: function(event, ui) {
        console.debug($(this));
          $(this).addClass('woo');
      },
      out: function(event, ui) {
        console.debug($(this));
          $(this).removeClass('woo');
      },
      
    });
    
    $("#selected-values").sortable({
      connectWith: '.connectedSortable',
      over: function(event, ui) {
        if ( $(this).attr('id') != ui.sender.attr('id') ) {
          // only if we're moving from the universe into here do we want this
          // if we're just moving things around within selected-values, we
          // don't want any hover highlight class
          $(this).addClass('hover-while-dragging');
        }
      },
      out: function(event, ui) {
        $("#selected-values").removeClass('hover-while-dragging');
      }
    })
		    
  });