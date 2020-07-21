trigger Contact_RelationShip_Trigger on Contact_Relationship__c (before insert,before update, before delete, after insert, after delete, after update) {
    ContactRelationShipTriggerHandler handlerObj = new ContactRelationShipTriggerHandler();
    if((trigger.isInsert || trigger.isUpdate) && trigger.isBefore){
        //When we change the Owner of the Contact Relationship, then the Owner name will be automatically 
        //populated in the Contact Relationship Name field.
        handlerObj.updateName(trigger.new);
    }
}