public class OpportunityListController{
    
    public list<opportunity> OpportunityList{get;set;}
    public list<opportunity> opplist{get;set;}
    public string searchstring {get;set;}  
    
    public OpportunityListController() {
        opplist = new list < opportunity > ();
        OpportunityList = new list < opportunity > ();
        OpportunityList = [select id, name, closedate, StageName, CreatedDate from opportunity order by CreatedDate desc];
    }

    public void search() {
        string searchquery = 'select name,id from opportunity where name like \'%' + searchstring + '%\' Limit 20';
        opplist = Database.query(searchquery);
    }
    
}