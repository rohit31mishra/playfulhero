trigger ContactTrigger on Contact (before insert,before update, before delete, after insert, after update, after delete,after undelete) {
 ContactTriggerHandler clsObj = new ContactTriggerHandler();
    if((trigger.isInsert || trigger.isUpdate) && trigger.isAfter){
        //Create the field called "Contact Relationship" checkbox on the Contact Object and Create the related object called 
        //"Contact Relationship" which is related list to the Contacts.(Look Up Relationship).
        //Now logic is when we create contact by checking Contact Relationship checkbox, 
        //then Contact Relationship will be created automatically for that contact.
        clsObj.createConRelData(trigger.new);
        
    }
    //Create the field called "Contact Relationship "checkbox on the Contact Object and Create the object 
    //called "Contact Relationship" which is related list to the Contacts.(Look Up Relationship).
	//Trigger Scenario 12 logic will says that when we create contact by checking Contact Relationship checkbox, 
	//then Contact Relationship will be created automatically for that contact.
	//No this logic will for when we delete the Contact, Then Contact Relationship will be deleted automatically
    if(trigger.isdelete && trigger.isBefore){
        clsObj.deleteConRelData(trigger.old);
    }
    //Create the field called "Contact Relationship" checkbox on the Contact Object and Create the object called "Contact Relationship" 
    //which is related list to the Contacts.(Look Up Relationship).Trigger Scenario 14 will says that when we delete the Contact,
    // Then Contact Relationship will be deleted automatically Now the Logic is when we undelete the Contact,
    //  then Contact Relationship will be undeleted automatically
    if(trigger.isAfter && trigger.isUndelete){
        clsObj.unDeleteConRelData(trigger.new);
    }
}