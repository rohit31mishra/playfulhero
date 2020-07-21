public class ContactTriggerHandler {
    public void createConRelData(List<Contact> conList){
        List<Contact_Relationship__c> newList = new List<Contact_Relationship__c>();
        for(contact conObj : conList){
            if(conObj.Contact_Relationship__c){
                Contact_Relationship__c conRelObj = new Contact_Relationship__c();
                conRelObj.Contact_Relationship__c = conObj.id; 
                conRelObj.Name = conObj.LastName; 
                newList.add(conRelObj);
            }
            
        }
        insert newList;
    }
    
    public void deleteConRelData(List<Contact> conList){
        
        for(Contact con : conList){
            Contact_Relationship__c cObj = new Contact_Relationship__c ();
            cObj = [SELECT Id FROM Contact_Relationship__c WHERE Contact_Relationship__c =: con.id];
            delete cObj;
        }
    }
    public void unDeleteConRelData(List<Contact> conList){
        for(Contact conObj : conList){
            Contact_Relationship__c crObj = new Contact_Relationship__c();
            crObj = [SELECT Id FROM Contact_Relationship__c WHERE Contact_Relationship__c =: conObj.id AND isDeleted=TRUE];
            undelete crObj;
        }
    }
}