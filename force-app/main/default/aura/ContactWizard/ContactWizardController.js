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
    nextToOppty: function(component, event, helper) {
        component.set('v.openOPannel', true);
        console.log('@@ '+component.get('v.str'));
        component.set('v.conAttr', component.get("v.contactList"));
        component.set("v.currentStep", '3' );
        component.set("v.AccountName", component.get("v.AccountName") );
    },
    backToAcc: function(component,event,helper){
        component.set("v.currentStep", '1' );
    }
    
})