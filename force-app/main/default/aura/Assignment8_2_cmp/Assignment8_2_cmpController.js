({
	doInit : function(component, event, helper) {
		var action = component.get("c.fetchLeadRecord");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var result = response.getReturnValue();
                console.log(result);
                component.set("v.LeadRec",result);
                //https://developer.salesforce.com/forums/?id=9060G000000XZi9QAG
            }
        });
        $A.enqueueAction(action);
	},
    createLeadRecord : function(component, event, helper) {
        component.set("v.disableAndHideTable","false");
	},
    displayRowDetail : function(component, event, helper) {
        console.log('Console');
        var selCont = event.getSource().get("v.title");
        console.log('selCont '+selCont);
        var Leads = component.get("v.LeadRec")
        console.log('Leads '+Leads[selCont].Phone);
        var index = Leads.indexOf(selCont);
        console.log('index '+index);
        
        if (index > -1) {
            contacts.splice(index, 1);
        }
        component.set("v.LeadRec",Leads);
        console.log(component.get("v.LeadRec"));

	}
})