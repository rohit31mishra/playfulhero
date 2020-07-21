({
	createContactPannel : function(component, event, helper) {
        console.log('isContactPannelOpen  33');
        //component.getEvent("contactPnlEvt").setParams({"isContactPannelOpen" : true }).fire();
        component.getEvent("contactPnlEvt").fire();
	},
    createOpportunityPannel : function(component, event, helper) {
		
	},
    doInit : function(component, event, helper) {
		var appEvent = $A.get("e.c:HoldAccountNameEvt");
		appEvent.setParams({
			"AccName" : component.get("v.AccountInstance.FirstName")});
        appEvent.fire();

	}
    
    
    
    


})