({
    showToast : function(component, event, helper) {
        var toastEvent = $A.get('e.force:createRecord');
        console.log(' get '+component.get('v.message'));
        console.log('Inside Handler  '+toastEvent);
        toastEvent.setParams({
            'entityApiName': 'Account',
        });
        toastEvent.fire();
        
        
    }
})