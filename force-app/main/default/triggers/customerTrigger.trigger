trigger customerTrigger on Customer__c (before insert,before delete,after insert) {
    if (Trigger.isAfter && trigger.isInsert ) {
        //Create the object called “Customer” and create the Master-Detail Relationship on Customer object so that Customer will be 
        //the related list to Account record. Create the field called “Account Manager” on Customer object which is lookup to the user 
        //object.Now Logic is when we create Customer record for account record, then the user in Account Manager field will be 
        //automatically added to Account Team of that associated account.
        CustomerTriggerHandler.updateAccTeam(Trigger.new);
    }
    
    
    
    
    /*if (Trigger.isBefore) {
            if(Trigger.isInsert){
                CustomerTriggerHandler.OnBeforeInsert(Trigger.new, Trigger.newMap,
                                                         Trigger.old, Trigger.oldMap,
                                                         Trigger.isInsert, Trigger.isUpdate);
                                                         
            }
            else if(Trigger.isUpdate){
                CustomerTriggerHandler.OnBeforeUpdate(Trigger.new, Trigger.newMap,
                                                         Trigger.old, Trigger.oldMap,
                                                         Trigger.isInsert, Trigger.isUpdate);
            }
            else if(Trigger.isDelete){
               CustomerTriggerHandler.OnBeforeDelete(Trigger.old, Trigger.oldMap);
            }
        }     
        // Checks if this is after event
        if (Trigger.isAfter) {  
            if(Trigger.isInsert){
                CustomerTriggerHandler.OnAfterInsert(Trigger.new, Trigger.newMap,
                                                        Trigger.old, Trigger.oldMap,
                                                        Trigger.isInsert, Trigger.isUpdate);
            }  
            else if(Trigger.isUpdate){
                CustomerTriggerHandler.OnAfterUpdate(Trigger.new, Trigger.newMap,
                                                        Trigger.old, Trigger.oldMap,
                                                        Trigger.isInsert, Trigger.isUpdate);     
            }       
            else if(Trigger.isDelete){
                 CustomerTriggerHandler.OnAfterDelete(Trigger.old, Trigger.oldMap);
            }
            else if(Trigger.isUnDelete){
                 CustomerTriggerHandler.OnAfterUndelete(Trigger.new);
            }       
        } */
}