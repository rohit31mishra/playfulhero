public class contactQuickActionCtlr {
    
    @AuraEnabled
    public static DataTableRes getAccRecords1(string accId){                
        list<ContactFields__mdt> metaDataList = new List<ContactFields__mdt>([SELECT Id, Fields__c, DeveloperName FROM ContactFields__mdt]);
        List<String> fieldSet = new List<String>();
        fieldSet = metaDataList[0].Fields__c.split(',');
        system.debug('fieldSet '+fieldSet);
        DataTableRes resData = new DataTableRes();
        resData.lstTableColumns = fieldSet;
        if(fieldSet != null && !fieldSet.isEmpty()){
            String query = 'SELECT Id,AccountId ' + metaDataList[0].Fields__c + ' FROM Contact where AccountId = 0016F00002qUGkYQAW' ;
            System.debug(query);
            resData.lstTableData = Database.query(query);
        }
        return resData;
    }
    
    public class DataTableRes{
        @AuraEnabled
        public List<string> lstTableColumns {get;set;}
        @AuraEnabled
        public List<sObject> lstTableData {get;set;}                
        
        public DataTableRes(){
            lstTableColumns = new List<string>();
            lstTableData = new List<sObject>();
        }
    }
    /*
Method Name	: getAccRecords
Purpose		: To get the wrapper of Columns and Headers
*/
    @AuraEnabled
    public static DataTableResponse getAccRecords(String strObjectName, String strFieldSetName){                
        
        //Get the fields from FieldSet
        Schema.SObjectType SObjectTypeObj = Schema.getGlobalDescribe().get(strObjectName);
        Schema.DescribeSObjectResult DescribeSObjectResultObj = SObjectTypeObj.getDescribe();            
        Schema.FieldSet fieldSetObj = DescribeSObjectResultObj.FieldSets.getMap().get(strFieldSetName);
        
        //To hold the table hearders 
        List<DataTableColumns> lstDataColumns = new List<DataTableColumns>();
        
        //Field to be queried - fetched from fieldset
        List<String> lstFieldsToQuery = new List<String>();
        
        //The final wrapper response to return to component
        DataTableResponse response = new DataTableResponse();
        System.debug('fieldSetObj '+fieldSetObj);
        System.debug('fieldSetObj.getFields() '+fieldSetObj.getFields());
        for( Schema.FieldSetMember eachFieldSetMember : fieldSetObj.getFields() ){
            String dataType = String.valueOf(eachFieldSetMember.getType()).toLowerCase();
            //This way we can set the type of a column
            //We do not get the exact type from schema object which matches to lightning:datatable component structure
            if(dataType == 'datetime'){
                dataType = 'date';
            }
            //Create a wrapper instance and store label, fieldname and type.
            DataTableColumns datacolumns = new DataTableColumns( String.valueOf(eachFieldSetMember.getLabel()) , 
                                                                String.valueOf(eachFieldSetMember.getFieldPath()), 
                                                                String.valueOf(eachFieldSetMember.getType()).toLowerCase() );
            lstDataColumns.add(datacolumns);
            lstFieldsToQuery.add(String.valueOf(eachFieldSetMember.getFieldPath()));
        }
        
        //Form an SOQL to fetch the data - Set the wrapper instance and return as response
        if(! lstDataColumns.isEmpty()){            
            response.lstDataTableColumns = lstDataColumns;
            String query = 'SELECT Id, ' + String.join(lstFieldsToQuery, ',') + ' FROM Contact';
            System.debug(query);
            response.lstDataTableData = Database.query(query);
        }
        System.debug('response '+response);
        return response;
    }
    
    //Wrapper class to hold Columns with headers
    public class DataTableColumns {
        @AuraEnabled
        public String label {get;set;}
        @AuraEnabled       
        public String fieldName {get;set;}
        @AuraEnabled
        public String type {get;set;}
        
        //Create and set three variables label, fieldname and type as required by the lightning:datatable
        public DataTableColumns(String label, String fieldName, String type){
            this.label = label;
            this.fieldName = fieldName;
            this.type = type;            
        }
    }
    
    //Wrapper calss to hold response - This response is used in the lightning:datatable component
    public class DataTableResponse {
        @AuraEnabled
        public List<DataTableColumns> lstDataTableColumns {get;set;}
        @AuraEnabled
        public List<sObject> lstDataTableData {get;set;}                
        
        public DataTableResponse(){
            lstDataTableColumns = new List<DataTableColumns>();
            lstDataTableData = new List<sObject>();
        }
    }
}