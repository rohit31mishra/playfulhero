({
    navHome : function (component, event, helper) {
        console.log('Rohit');
        var homeEvent = $A.get("e.force:navigateToObjectHome");
        console.log('Rohit'+homeEvent);
        homeEvent.setParams({
            "scope": "myNamespace__myObject__c"
        });
        homeEvent.fire();
    }
    
})