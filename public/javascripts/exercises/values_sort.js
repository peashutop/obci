$(document).ready(function() {


$(".value-card, .faux-value-card").corner();

var currentCardStackPosition = 0;

var cycle_options = {
  fx: 'shuffle',
  speed: 'fast',
  timeout: 0,
  next: '#next-card, #card-stack',
  prev: '#prev-card',
  after: function(currSlideElement, nextSlideElement, options, forwardFlag) {
    console.debug(this);
    console.log(options.currSlide);
    currentCardStackPosition = options.currSlide;
    console.log(currentCardStackPosition);
  } 
}

  $("#card-stack").cycle(cycle_options);

  $(".value-card .value").draggable({
    connectToSortable: "#least-important, #somewhat-important, #most-important",
    helper: function() {
	  myClone = $(this).clone();
	  $(myClone).addClass('dragging-clone');
	  //$(myClone).text( $(myClone).text() + '--clone' );
	  return myClone;
    } 
//  helper: 'original' // API says "helper must be set to 'clone' in order to work flawlessly"
  });

//  $("#card-stack").sortable({
//    connectWith: '.connectedSortable',
//    over: function(event, ui) {
//      console.debug($(this));
//        $(this).addClass('woo');
//    },
//    out: function(event, ui) {
//      console.debug($(this));
//        $(this).removeClass('woo');
//    },    
//  });
  
  $("#least-important, #somewhat-important, #most-important").sortable({
    connectWith: '.connectedSortable',
    over: function(event, ui) {
      console.log('OVER!');
      console.log("this.attr(id): " + $(this).attr('id'));
      console.log("sender.attr(id): " + ui.sender.attr('id'));

	  var fromStack = ui.item.hasClass('from-stack');
	  console.log('from stack?' + fromStack );

      if ( fromStack || $(this).attr('id') != ui.sender.attr('id') ) {
        // if we're moving a card from the card stack to a column, highlight
        // if we're moving a card from one column to another, highlight
        // if we're just moving things around within a column, don't highlight

		// this.attr('id') gives us the id of the receiving column
		// if the card is coming from the stack, ui.sender.attr('id') appear to be, oddly, the same
		
        $(this).addClass('hover-while-dragging');
      } else {
	    console.log('sorry, ids appear to match.');
	    console.log(ui.sender.attr('id'));
		console.log(ui.item.attr('id'));
      }
    },
    out: function(event, ui) {
      $(this).removeClass('hover-while-dragging');
    },

    receive: function(event, ui) {
		console.log('we have received.');
		if (ui.item.hasClass('from-stack')) {
			console.log('from the stack, weve got work to do to eliminate duplication!');
			//you'd think ui.item would get the item we've just dropped into the sortable
			//but when dragging a draggable into a sortable, it appears that a copy gets made
			// and ui.item refers to the original, which stays where it came from, and not the new element
			//so, we'll grab it by id /and/ class, since, at the moment, it shares an ID with its original
			//this applies to the original item, not our new copy, which i seem to no totally direct way of selecting
				original_value = ui.item;
				original_card  = original_value.parent();
				console.log("original card:");
				console.debug(original_card);
				original_card.addClass('ive-been-cloned-and-am-about-to-disappear');
				original_card.removeAttr('style');
				original_card.removeAttr('style');


				card_classes = original_value.attr('class').split(' ');
				faux_value_id = card_classes[0]; 

				console.log("OUR CLASSES: " + card_classes);
				console.log("FAUX ID: " + faux_value_id);

				our_new_guy = $('#choice-columns .' + faux_value_id);

				$("#card-stack").cycle('stop');
				
                original_card.appendTo($('#trash-bin'));

				$("#card-stack").cycle({
				fx: 'shuffle',
				speed: 'fast',
				timeout: 0,
				next: '#next-card, #card-stack',
				prev: '#prev-card',
				after: function(currSlideElement, nextSlideElement, options, forwardFlag) {
				  console.debug(this);
				  console.log(options.currSlide);
				  currentCardStackPosition = options.currSlide;
				  console.log(currentCardStackPosition);
				},
				//
				startingSlide: currentCardStackPosition // next slide in order. but the size of the slide array has been reduced by one since the assigned slide has been removed 
				});

				our_new_guy.removeAttr('style');
				our_new_guy.removeClass('from-stack')
				console.debug(our_new_guy);

		} else { 
			console.log('not from the stack... no extra work to do :)');
		}
    }

  })
		    
});

