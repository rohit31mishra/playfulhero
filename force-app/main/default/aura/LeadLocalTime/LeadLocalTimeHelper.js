({
	getLocalTime : function(component) {
        const action = component.get('c.getConnection'); 
        const latitude = component.get("v.simpleRecord").Latitude;
	    const longitude = component.get("v.simpleRecord").Longitude;
        var loc = latitude+','+longitude;
		action.setCallback(this, function(actionResult) {
		const state = actionResult.getState();
		if (state === "SUCCESS") {
			component.set('v.objectRecord',actionResult.getReturnValue());
			var apikey = component.get("v.objectRecord.Prod_SecretKey__c");
			var endPoint = component.get("v.objectRecord.Prod_EndpointUrl__c");
			var daysofweek = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
		    var targetDate = new Date(); // Current date/time of user computer
			// Current UTC date/time expressed as seconds since 		midnight, January 1, 1970 UTC
		    var timestamp = targetDate.getTime()/1000 + targetDate.getTimezoneOffset() * 60; 
		    var apicall = endPoint + loc + '&timestamp=' + timestamp + '&key=' + apikey;
		    var xhr = new XMLHttpRequest(); // create new XMLHttpRequest2 object
		    xhr.open('GET', apicall); // open GET request
		    xhr.onload = function(){
			        if (xhr.status === 200){ // if Ajax request successful
			            var output = JSON.parse(xhr.responseText); // convert returned JSON string to JSON object
                         // if API reports everything was returned successfully
			            if (output.status === 'OK'){
							// get DST and time zone offsets in milliseconds
			                var offsets = output.dstOffset * 1000 + output.rawOffset * 1000; 
							// Date object containing current time of target location
			                var localdate = new Date(timestamp * 1000 + offsets);
							// get current date again to calculate time elapsed between targetDate and now
			                var refreshDate = new Date(); 
							// get amount of time elapsed between targetDate and now
			                var millisecondselapsed = refreshDate - targetDate; 
							 // update localdate to account for any time elapsed
			                localdate.setMilliseconds(localdate.getMilliseconds()+ millisecondselapsed);
			                setInterval(function(){
			                    localdate.setSeconds(localdate.getSeconds()+1);
								component.set("v.localTime",localdate.toLocaleTimeString() + ' (' + daysofweek[ localdate.getDay() ] + ')');
			                }, 1000);
						}else{
							component.set("v.localTime",output.status);
						}
			        }
			        else{
			            component.set("v.localTime",'Request Failed');
			        }
			    };
			    xhr.send(); // send request
			};
		});
		$A.enqueueAction(action);

	}
});