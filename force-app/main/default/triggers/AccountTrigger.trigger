trigger AccountTrigger on Account (before insert,before update,before delete, after insert, after update,after delete) {
    
    //The following Trigger will fires when we try to create the account with same name 
    //i.e. Preventing the users to create Duplicate Accounts
    AccountTriggerHandler clsObj = new AccountTriggerHandler();
    if((trigger.isUpdate || trigger.isInsert ) && trigger.isBefore){
        clsObj.duplicateCheck(trigger.new);
        clsObj.updateDescription(trigger.new);
        clsObj.updateAccName(trigger.new);
        clsObj.updateSalesTeam(trigger.new);
       
    }
    if((trigger.isInsert && trigger.isAfter)){
        clsObj.autoCreateContact(trigger.new);
    }
    //The following trigger updates the field called “Description” by the 
    //value "Description automatically Updated " whenever we are creating an account or updating an account record. 
    
    //Create “Sales Rep” field with data type (Text) on the Account Object. When we create the Account record, the Account Owner will be automatically added to Sales Rep field. When we update the Account owner of the record, then also the Sales Rep will be automatically updated.
    if((trigger.isInsert || trigger.isUpdate) && trigger.isBefore){
        clsObj.updateAccountOwner(trigger.new);
    }
}