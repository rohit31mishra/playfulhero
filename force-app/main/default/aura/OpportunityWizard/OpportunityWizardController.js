({
    doInit: function(component, event, helper) {
        // create a Default RowItem [Contact Instance] on first time Component Load
        // by call this helper function   
        helper.createObjectData(component, event);
    },
    addNewRow: function(component, event, helper) {
        // call the comman "createObjectData" helper method for add new Object Row to List  
        helper.createObjectData(component, event);
    },
    removeDeletedRow: function(component, event, helper) {
        // get the selected row Index for delete, from Lightning Event Attribute  
        var index = event.getParam("indexVar");
        // get the all List (contactList attribute) and remove the Object Element Using splice method    
        var AllRowsList = component.get("v.contactList");
        AllRowsList.splice(index, 1);
        // set the contactList after remove selected row element  
        component.set("v.contactList", AllRowsList);
    },
    backToCon: function(component,event,helper){
        component.set('v.currentStep','2');
    },
    Save: function(component, event, helper) {
        console.log('hhhhhhhhhhhh jj');
        var action = component.get('c.saveDB');
        action.setParams({
            "OpportunityList" : component.get("v.OpportunityList"),
            "contactList" : component.get("v.contactList"),
            "accName" : component.get("v.AccountName")
        });
        action.setCallback(this,function(res){
            console.log('rrrrrrr');
            if (res.getState() === 'SUCCESS') {
                console.log('hhhhhhhh '+res.getReturnValue());
            }
        });
        // enqueue the server side action  
        $A.enqueueAction(action);
    }
})