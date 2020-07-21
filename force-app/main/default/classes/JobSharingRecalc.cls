global class JobSharingRecalc implements database.Batchable<sObject> {

    global database.QueryLocator start (database.BatchableContext BC){
        return Database.GetQueryLocator([Select id from job__c]);
        
    }
    global void execute (Database.BatchableContext BC, List<sObject> scope){
        
    }
    global void finish (Database.BatchableContext BC){
        
    }
}