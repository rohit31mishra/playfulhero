public class LightningTab_LightningDatatable_cls {
    @AuraEnabled
    public static List<accountDetailWrapper> getAccRecords(){
        list<accountDetailWrapper> lstALW = new list<accountDetailWrapper>();
        
        for(account acc : [select Name,description, BillingCountry, BillingCity, BillingPostalCode, BillingStreet, BillingState
                           From Account
                           Where BillingCountry != null
                           And BillingCity != null
                           limit 10 ]){
                               accountLocationWrapper locationWrpr = new accountLocationWrapper();
                               locationWrpr.street =  acc.BillingStreet;
                               locationWrpr.city =  acc.BillingCity;
                               locationWrpr.postalcode =  acc.BillingPostalCode;
                               locationWrpr.state =  acc.BillingState;
                               locationWrpr.Country =  acc.BillingCountry;
                               
                               accountDetailWrapper detailsWrpr = new accountDetailWrapper();
                               detailsWrpr.title =  acc.Name;
                               detailsWrpr.description =  acc.description;
                               detailsWrpr.location =  locationWrpr;
                               lstALW.add(detailsWrpr);
                           }
        return lstALW;
    }
    
    public class accountLocationWrapper{
        @AuraEnabled public string street{get; set;}
        @AuraEnabled public string postalcode{get; set;}
        @AuraEnabled public string city{get; set;}
        @AuraEnabled public string state{get; set;}
        @AuraEnabled public string Country{get;set;}
    }
    public class accountDetailWrapper{
        @AuraEnabled public string title{get;set;}
        @AuraEnabled public string description {get;set;}
        @AuraEnabled public accountLocationWrapper location{get;set;}
    }
    @AuraEnabled
    public static AccountPagerWrapper fetchAccount(Decimal pageNumber ,Integer recordToDisply) {
        Integer pageSize = recordToDisply;
        Integer offset = ((Integer)pageNumber - 1) * pageSize;
        
        // create a instance of wrapper class.
        AccountPagerWrapper obj =  new AccountPagerWrapper();
        // set the pageSize,Page(Number), total records and accounts List(using OFFSET)   
        obj.pageSize = pageSize;
        obj.page = (Integer) pageNumber;
        obj.total = [SELECT count() FROM account];
        obj.accounts = [SELECT Id, Name,Phone FROM Account ORDER BY Name LIMIT :recordToDisply OFFSET :offset];
        // return the wrapper class instance .
        return obj;
    }
    
    // create a wrapper class with @AuraEnabled Properties    
    public class AccountPagerWrapper {
        @AuraEnabled public Integer pageSize {get;set;}
        @AuraEnabled public Integer page {get;set;}
        @AuraEnabled public Integer total {get;set;}
        @AuraEnabled public List<Account> accounts {get;set;}
    }
}