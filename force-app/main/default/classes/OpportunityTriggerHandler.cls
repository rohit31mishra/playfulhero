public class OpportunityTriggerHandler {
    public void updateAccountActive (List <Opportunity> oppLst){ 
        Set<id> setIds = new Set<id>();
        for(opportunity oppObj : oppLst ){
            if(oppObj.AccountId != '' || oppObj.AccountId != null ){
                if(oppObj.IsActive__c == 'Active'){
                    
                    setIds.add(oppObj.AccountId);
                } 
            }
        }
		List<Account> accLst = new List<Account>([select id, Active_Opportunity__c from Account where id IN : setIds]);        
        for(Account accObj: accLst){
            accObj.Active_Opportunity__c = true;
        }
        //update accLst;
    }
}