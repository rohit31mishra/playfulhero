({
	showMsg : function(component, event, helper) {
        console.log('context');
        var context = event.getParam("context");
        console.log('context'+context);
		component.set("v.msgToDisplay",context);
	}
})