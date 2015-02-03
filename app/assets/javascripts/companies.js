$(document).ready(function(){
	
	$("div.help_tooltip").qtip({ // Grab some elements to apply the tooltip to
	
	    show: 'click',
	    hide: 'unfocus',
	    content: {
	        text: function(event, api) {
	                
	            $.ajax({
	                url: 'http://localhost:3000/helps/'+$(this).attr('id'), // 'http://www.myhq.org.uk/helps/'+$(this).attr('id')
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
	});
	
	
	$("div.help_tooltip").dblclick(function (){
	
	// redirect to edit tip content
	        window.location = 'http://localhost:3000/helps/'+$(this).attr('id')+'/edit';
	        return false;
	});
});	