public class LocalTimeController {
    
    @AuraEnabled
    public static Integration_Parameters__mdt getConnection(){
        
        Integration_Parameters__mdt intParameter = [select DeveloperName,Prod_EndpointUrl__c,Prod_SecretKey__c from Integration_Parameters__mdt where DeveloperName='Google_TImeZone' Limit 1];
        return intParameter;
    }

}