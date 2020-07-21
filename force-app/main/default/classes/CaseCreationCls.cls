public class CaseCreationCls {
    @AuraEnabled
    public static Map<String, String> getTypeOptions(){
        Map<String, String> options = new Map<String, String>();
     options.put('Mechanical','Mechanical');
        options.put('Electrical','Electrical');
        options.put('Electronic','Electronic');
        options.put('Structural','Structural');
        options.put('Other','Other');
        
        return options;
    }
     @AuraEnabled
    public static id createCase(Case caseObj){
    list<case> caseList;
       try{
            //Insert Account Record
            if(caseObj.Subject!= ''){
                 caseList = new List<Case>([select id,ContactPhone,Subject from case where Subject =: caseObj.Subject LIMIT 1]);
            }
            
            if(caseList.size() > 0 && !caseList.isEmpty()){
                MyException data = new MyException('MyCustomServerError', 'Some message about the error', 123);
                throw new MyException(JSON.serialize(data));
            }
            else{
            //throw new AuraHandledException('NSFW name detected.');
                insert caseObj; 
            }
            
             
        }catch(Exception e){
            //throw exception message
            throw new AuraHandledException(e.getMessage());
        }
        finally {
            
        }
        return caseObj.id;
        
    }
    
    @AuraEnabled
    public static List<Lead> fetchLeadRecord(){
        return [select id, LastName, Company, Phone, Status ,LeadSource FROM Lead LIMIT 15];
    }
    @AuraEnabled
    public static List<Account> fetchAccountRecord(){
        return [select id, name FROM Account LIMIT 15];
    }
    
    
    
}