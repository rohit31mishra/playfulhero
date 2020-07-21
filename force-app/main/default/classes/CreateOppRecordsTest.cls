@IsTest
public class CreateOppRecordsTest{
    public static testmethod void TestMethod1(){
        Opportunity opp = new Opportunity();
        opp.name = 'test Opp';
        opp.closedate = date.today();
        opp.stagename = 'Prospecting';
        insert opp;
        
        Demo_Object__c demoObj = new Demo_Object__c();
        demoObj.name = 'test';
        demoObj.Category__c = 'Opportunity';
        demoObj.opportunity__c = opp.id;
        insert demoObj;
    } 
}