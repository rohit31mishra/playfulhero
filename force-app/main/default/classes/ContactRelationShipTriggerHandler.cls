public class ContactRelationShipTriggerHandler {
    public void updateName(list <Contact_Relationship__c> conRelList){
        set<Id> idSet = new set<Id>();
        List<Contact_Relationship__c>  tempLst = new List<Contact_Relationship__c>();
        for(Contact_Relationship__c conRelObj : conRelList){
            idSet.add(conRelObj.ownerId);            
        }
        map<id,user> userMap = new map<id,user>([select id, name from user where Id in : idSet ]);
        for(Contact_Relationship__c conRelObj : conRelList){
            if(conRelObj.name != userMap.get(conRelObj.OwnerId).name){
                conRelObj.name = userMap.get(conRelObj.OwnerId).name;
            }
            System.debug(' '+ userMap.get(conRelObj.OwnerId).name +' '+conRelObj.name);
            System.debug(' '+ userMap.get(conRelObj.OwnerId));
        }
    }
}