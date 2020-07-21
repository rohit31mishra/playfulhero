public class  CustomerTriggerHandler{
    public static  void updateAccTeam(List<customer__c> newList){
        List<AccountTeamMember> atm_List = new List<AccountTeamMember>();
        List <AccountShare> aShareList = new List <AccountShare>();
        AccountShare aShare;
        AccountTeamMember atm;
        for(customer__c custObj: newList){
            atm = new AccountTeamMember();
            atm.accountId = custObj.Account__c;
            atm.TeamMemberRole = 'Account Manager';
            atm.UserId = custObj.Account_Manager__c;
            atm_List.add(atm);
            //aShare = new AccountShare();
            //aShare.AccountId = custObj.Account__c;
            //aShare.AccountAccessLevel = 'Read/Write';
            //aShare.CaseAccessLevel = 'Read';
            //aShare.ContactAccessLevel = 'Read';
            //aShare.UserOrGroupId = custObj.Account_Manager__c;
            //aShareList.add(aShare);
        }
        if(atm_List.size() >0 && !atm_List.isEmpty()){
         	insert atm_List;
        }
        if(aShareList.size() >0 && !aShareList.isEmpty()){
         //   database.saveresult[] sr = Database.insert(aShareList,false);
        }
    
    
    
    
    }
    /*public static void OnBeforeInsert(List<Customer__c> newList, Map<Id, Customer__c> newMap,
                                      List<Customer__c> oldList, Map<Id, Customer__c> oldMap,
                                      Boolean isInsert, Boolean isUpdate){
                                          
                                      }
    public static void OnBeforeUpdate(List<Customer__c> newList, Map<Id, Customer__c> newMap,
                                      List<Customer__c> oldList, Map<Id, Customer__c> oldMap,
                                      Boolean isInsert, Boolean isUpdate){
                                          
                                      }
    public static void OnBeforeDelete(List<Customer__c> oldList,Map<Id, Customer__c> oldMap)  {
    }      
    public static void OnAfterInsert(List<Customer__c> newList, Map<Id, Customer__c> newMap,
                                     List<Customer__c> oldList, Map<Id, Customer__c> oldMap,
                                     Boolean isInsert, Boolean isUpdate){
                                         
                                     }   
    public static void OnAfterUpdate(List<Customer__c> newList, Map<Id, Customer__c> newMap,
                                     List<Customer__c> oldList, Map<Id, Customer__c> oldMap,
                                     Boolean isInsert, Boolean isUpdate){
                                     }
    public static void OnAfterDelete(List<Customer__c> oldList,Map<Id, Customer__c> oldMap){
    }    
    public static void OnAfterUndelete(List<Customer__c> newList){
        
    }                  */
}