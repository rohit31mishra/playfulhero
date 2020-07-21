trigger CreateOppRecords on Demo_Object__c(after insert,after update){
    
    set<id> opportunityIds = new set<id>();
    for(Demo_Object__c demoObj : trigger.new){
        if(demoObj.Opportunity__c != null || demoObj.Opportunity__c != ''){
            opportunityIds.add(demoObj.Opportunity__c);
        }
    }
    
    map<id,Opportunity> DemoOppMap = new map<id,Opportunity>();
    DemoOppMap = new map<id,Opportunity>([select id,name,closedate,(select id,name,Category__c,Opportunity__c from Demo_Objects__r)
                                          ,stagename from opportunity where id in :opportunityIds]);

    for(Demo_Object__c demo : trigger.new){
        if(demo.Category__c == 'Opportunity'){
            Opportunity opp = DemoOppMap.get(demo.Opportunity__c);
            opp.name = demo.name;
            opp.closedate = date.today();
            opp.stagename = 'Prospecting';
        }
    }
    upsert DemoOppMap.values();
}