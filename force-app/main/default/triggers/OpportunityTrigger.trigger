trigger OpportunityTrigger on Opportunity (before insert,after update,after insert,after delete,before delete) {
	OpportunityTriggerHandler handlerObj =  new OpportunityTriggerHandler();
    
    if(trigger.isBefore  && trigger.isInsert){
         handlerObj.updateAccountActive(trigger.new);
    }
   
}