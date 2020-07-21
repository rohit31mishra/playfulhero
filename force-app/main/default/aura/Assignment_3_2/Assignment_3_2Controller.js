({
    doInit : function(component, event, helper) {
        var action = component.get("c.getContactList");
        action.setCallback(this, function(actionResult){
            console.log(' @@@ '+actionResult.getReturnValue());
            component.set("v.ContactList",actionResult.getReturnValue());
        });
        $A.enqueueAction(action);
    },
})