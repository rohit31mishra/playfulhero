({
    doInit : function(component) {
        console.log('Inside reciever hh');
        var vfOrigin = "https://" + component.get("v.vfHost");
        window.addEventListener("message", function(event) {
            if ( (event.data.type) && (event.data.type=='EventFromVF') )
            if (event.origin !== vfOrigin) {
                // Not the expected origin: Reject the message!
                return;
            }
			console.log('Inside reciever 1');            
            // Handle the message
            var toastEvent = $A.get('e.force:showToast');
            console.log('Inside reciever');
	        toastEvent.setParams({
    	        type: 'info',
        	    message: event.data.message
	        });
    	    toastEvent.fire();

            console.log(event.data);
        }, false);
    }

})