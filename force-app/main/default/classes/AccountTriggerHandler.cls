public class AccountTriggerHandler {
    //Trigger Scenario
    //The following Trigger will fires when we try to create the Fax with same value
    //i.e. Preventing the users to create Duplicate Fax num
    public void duplicateCheck(List<Account> newAccList){
        List<Account> dupAccLst = new List<Account>();
        List<Account> tempAccLst = new List<Account>();
        for(Account accObj: newAccList){
            tempAccLst = [Select id ,name, fax From Account where Fax =: accObj.Fax];
            if(tempAccLst.size() > 0 ){
                dupAccLst.add(accObj);
            }
        }
        if(dupAccLst.size() > 0 ){
            for(account acc: dupAccLst){
                acc.fax.adderror('Cannot have duplicate Fax no.');
            }
        }
    }
    //Trigger Scenario
    //The following trigger updates the field called “Description” by the 
    //value "Description automatically Updated " whenever we are creating an account or updating an account record. 
    public void updateDescription(List<Account> newAccList){
        for(account accObj : newAccList){
            if(accObj.Description == '' || accObj.Description == null ){
                accObj.Description = 'Description Updated Automatically';
            }
        }
    }
    //Trigger Scenario
    //The following trigger describes when the Account are inserted into the data base it would add Doctor prefixed for all Account names. 
    //This is applicable for both inserting and updating the Account records.
    public void updateAccName(List<Account> newAccList){
        for(account accObj : newAccList){
            if(accObj.Name != '' || accObj.Name != null){
                accObj.Name += ' - account';
            }
        }
    }
    //Trigger Scenario
    //The following trigger adds the Account Owner into the sales team automatically whenever the Account is created.
    public void updateSalesTeam(List<Account> newAccList){
        for(Account accObj : newAccList){
            
        }
    }
    //Create Custom field called “Number of Locations” on the Account Object (Data Type=Number)
    //The following trigger creates the number of contacts which are equal to the number which 
    //we will enter in the Number of Locations field on the Account Object
    public void autoCreateContact(List<Account> newAccList){
        
        List<Contact> conList = new List<Contact>();
        for(Account accObj : newAccList){
            if(accObj.No_of_Contact__c > 0 ){
                for(integer i=0;i < accObj.No_of_Contact__c;i++){
                    Contact conObj = new Contact();
                    conObj.lastname = accObj.Name + i;
                    conObj.AccountId = accObj.id;
                    conList.add(conObj);
                }
            }
            
        }
        if(conList.size()>0 || !conList.isEmpty()){
			insert conList;
        }
    }
    //Create “Sales Rep” field with data type (Text) on the Account Object. When we create the Account record, 
    //the Account Owner will be automatically added to Sales Rep field. When we update the Account owner of the record, 
    //then also the Sales Rep will be automatically updated.
    
    public void updateAccountOwner(List<Account> accList){
        set<Id> idSet = new set<Id>();
        for(Account acc: accList){
            idSet.add(acc.ownerId);
        }
        map<Id,User> userMap = new map<id,User>([select id,name from user where id IN : idSet ]);
        for(Account acc: accList){
            acc.Sales_Rep__c = userMap.get(acc.OwnerId).name;
        }
    }
}