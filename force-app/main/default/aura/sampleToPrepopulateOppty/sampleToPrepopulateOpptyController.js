({
    createOppty: function (component) {
        var createRecordEvent = $A.get('e.force:createRecord');
        if ( createRecordEvent ) {
            createRecordEvent.setParams({
                'entityApiName': 'Opportunity',
                'defaultFieldValues': {
                    'CurrentGenerators__c' : 'Prospect',
                    'DeliveryInstallationStatus__c' : 'In progress',
                    'LeadSource':'Self Generated',
                    'Lead_Subsource__c':'Cold'
                }
            });
            createRecordEvent.fire();
        } else {
            /* Create Record Event is not supported */
            alert("Opportunity creation not supported");
        }
    },
    onLoad: function(component, event, helper){
        var record = event.getParam('fields');
        //var fields = event.getParam("fields");
        // I've noticed this will fire multiple times. If you don't set some criteria 
        // to protect against it, this workaround will result in an infinite loop
        if(record !== undefined && !record.fields.Description.value){
            // I did not test if setting both value and displayValue attributes are required
            
            record["Description"] ='Self Generated'
          //  record.fields.Description.displayValue = 'Self Generated'; 
            event.setParam('record', record);
            //component.find('form').submit(record);
        }
    }
})