({
	doInit : function(component, event, helper) {      
    
	var changeType = event.getParams().changeType;
	var latitude = '';
	var longitude = '';
	if (changeType === "LOADED") { 
	  latitude = component.get("v.simpleRecord").Latitude;
	  longitude = component.get("v.simpleRecord").Longitude;
	}
	if(latitude === 'undefined' || latitude === null || longitude === 'undefined' || longitude === null ){
		component.set("v.localTime",'Update ZIPCode');
	}else{
      helper.getLocalTime(component);  
	}
		

	}
});