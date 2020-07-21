({
    passMsg : function(component, event, helper) {
        const eventData = component.getEvent("displayMsgEvt");
        //var compEvents = cmp.getEvent("componentEventFired");
        console.log('Rohit1 ');
        eventData.setParams({"context" : "hello you have clicked button"});
        //compEvents.setParams({ "context" : parentName });
        console.log('Rohit 2');
        
        eventData.fire();
        console.log('Rohit 3');
        
    }
})