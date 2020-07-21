public class AccountWizard {
    @AuraEnabled
    public static string saveDB(List<Opportunity> OpportunityList, List<Contact> contactList,string accName){
        Account newAcc = new Account();
        newAcc.name = accName;
        insert newAcc;
        List<Opportunity> OpportunityLst = new List<Opportunity>();
        for(Opportunity opptyObj: OpportunityList){
            opptyObj.AccountId = newAcc.id;
            OpportunityLst.add(opptyObj);
        }
        insert OpportunityLst;
        List<Contact> ContactLst = new List<Contact>();
        for(Contact conObj: ContactList){
            conObj.AccountId = newAcc.id;
            ContactLst.add(conObj);
        }
        insert ContactLst;
        System.debug('OpportunityList'+OpportunityList+'contactList'+contactList+'accName'+accname);
        return 'rohit';
    }
    @AuraEnabled
    public static List<Contact> getContactList(){
    
    return [select id,firstname,lastname,phone from contact LIMIT 10];
    }
}