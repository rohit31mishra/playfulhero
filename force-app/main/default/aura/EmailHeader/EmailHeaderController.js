({
	serverCall : function(component, event, helper) {
		//helper.serverCall(component, event, helper);
		helper.serverCall1(component, event, helper);
	},
    handleComponentEvent : function(component,event,helper){
        console.log('inside event');
        var selectedAccountGetFromEvent = event.getParam("recordByEvent");
        component.set("v.selectedRecord" , selectedAccountGetFromEvent); 
        console.log('inside event out');
    },
})