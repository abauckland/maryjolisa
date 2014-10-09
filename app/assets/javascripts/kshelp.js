//
//   File: kshelp.js
//   Created on: 2014-09-21
//   Last modified: 2014-09-21
//

//    Purpose:
//    -------------------------------------------------------------------------
//
//    Replaces all textareas (class="widgEditor") in a HTML document with
//    enhanced editing windows to allow basic HTML formatting in a WYSIWYG
//    manner.
//


$(document).ready(function(){

	$("div.help_tooltip").qtip({ // Grab some elements to apply the tooltip to
	
   		show: 'mouseover',
   		hide: 'mouseout'
	    content: {
	        text: function(event, api) {
                
	            $.ajax({
	                url: 'http://www.myhq.org.uk/helps/'+$(this).attr('id'),
	                type: 'GET', // POST or GET
	                dataType: 'html',
	            })
	            .then(function(content) {
	                // Now we set the content manually (required!)
	                api.set('content.text', content);
	            }, function(xhr, status, error) {
	                // Upon failure... set the tooltip content to the status and error value
	                api.set('content.text', status + ': ' + error);
	            });
	            return 'Loading...';
	       }
	    },
	        position: {
	        my: 'top center',  // Position my top left...
	        at: 'bottom center', // at the bottom right of...
	    }
	})


	$("div.help_tooltip").dblclick(function (){
	// redirect to edit tip content
	        window.location = 'http://www.myhq.org.uk/helps/'+$(this).attr('id')+'/edit';
	        return false;
	});

});
