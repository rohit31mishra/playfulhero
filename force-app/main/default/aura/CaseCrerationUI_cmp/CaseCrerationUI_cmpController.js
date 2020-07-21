({
    init : function(component, event, helper) {
        //const typeOptions = ["Mechanical","Electrical","Electronic","Structural","Other"];
        //component.set("v.typeOptions",typeOptions);
        const statusOptions = ["New", "Working", "Escalated"];
        component.set("v.statusOptions",statusOptions);
        const caseOriginOptions = ["— None —","Phone", "Email", "Web"];
        component.set("v.caseOriginOptions",caseOriginOptions);
        helper.getTypeOptions(component, event);
    },
    Save : function(component, event, helper) {
        var caseVar = component.get("v.caseItem");
        var action = component.get("c.createCase");//md
        action.setParams({
            caseObj : caseVar
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var result = response.getReturnValue();
                component.set("v.isOpen", true);
                component.set("v.fieldTitle",'Successfully created record '+result);
            }
            else if (state === "ERROR") {
                let errors = response.getError();
                let message = 'Unknown error'; // Default error message
                // Retrieve the error message sent by the server
                if (errors && Array.isArray(errors) && errors.length > 0) {
                    message = errors[0].message;
                }
                // Display the message
                let errorData = JSON.parse(errors[0].message);
                console.error(errorData.name +" (code "+ errorData.code +"): "+ errorData.message);
                component.set("v.errorfrm",message);
                console.error(message);
            }
        });
        $A.enqueueAction(action);
    }, 
    Cancel : function(component, event, helper) {
        component.set("v.caseItem",{'ContactPhone':'',
                                    'Subject':'',
                                    'Origin':'--None--',
                                    'Type':'',
                                    'Status':'New',
                                    'sobjectType':'Case'})
    },
    openPopup: function(component, event, helper) {
      component.set("v.isOpen", true);
      let titleVar = event.getSource().get("v.title");
        component.set("v.fieldTitle",titleVar);
   },
   closeModel: function(component, event, helper) {
      component.set("v.isOpen", false);
   },
})