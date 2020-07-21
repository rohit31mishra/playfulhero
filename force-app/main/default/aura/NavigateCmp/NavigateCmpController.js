({
    doInit : function(cmp) {
        var action = cmp.get("c.downloadAttachments1");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                console.log('@@@@ success');
                //alert("From server: " + response.getReturnValue());
                var data = response.getReturnValue();
                cmp.set('v.zipFileId',data);
                
            }
            else if (state === "INCOMPLETE") {
            }
                else if (state === "ERROR") {
                    var errors = response.getError();
                    if (errors) {
                        if (errors[0] && errors[0].message) {
                            console.log("Error message: " + 
                                        errors[0].message);
                        }
                    } else {
                        console.log("Unknown error");
                    }
                }
        });
        $A.enqueueAction(action);
        
    },
    gotoURL : function(component, event, helper) {
        var urlEvent = $A.get("e.force:navigateToURL");
        urlEvent.setParams({
            "url":"https://playfulhero-dev-ed--c.ap4.visual.force.com/apex/ApexZipSample"
        });
        urlEvent.fire();
    }
})