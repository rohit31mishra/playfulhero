({
 doInit : function(component, event) {
        var action = component.get("c.getAccRecords");
       /* action.setParams({
                'accId' : component.get("v.recordId"),
            }); */
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === 'SUCCESS'){
				component.set('v.accRecords',action.getReturnValue());
                const returnedResponse = action.getReturnValue();
                const locationvar = returnedResponse.location;
				console.log('locationvar '+component.get("v.accRecords.location"));
                console.log('locationvar '+component.get("v.accRecords"));
                //component.set('v.locRecords',locationvar);
                //const responseOffer = component.get("v.bfeRecords.offerDetails");
                

            }
        });
        $A.enqueueAction(action);	
    },
})