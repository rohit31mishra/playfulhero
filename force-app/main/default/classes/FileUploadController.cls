public with sharing class FileUploadController {
    
    @AuraEnabled
    public static Map<string, integer> saveChunk1(string file) {
        Map<string, integer> barMap = new Map<string, integer>(); 
        List<string> dataRow =new List<string> {};
        List<String> lstFieldNames = new List<String>();
        Map <String, Integer> fieldNumberMap = new Map < String, Integer > ();
        string myFile = EncodingUtil.base64Decode(file).toString();
        dataRow = myFile.split('\r');
        system.debug('dataRow ' +dataRow);
        string[] csvFieldNames = dataRow[0].split(',');
        system.debug('csvFieldNames ' +csvFieldNames);
        for (Integer i = 0; i < csvFieldNames.size(); i++) {
            fieldNumberMap.put(csvFieldNames[i], i);
            lstFieldNames.add(csvFieldNames[i].trim());
        }
        system.debug('fieldNumberMap ' +fieldNumberMap);
        system.debug('lstFieldNames ' +lstFieldNames);
        Integer fieldNumber;
        String contactDataAsString;
        string fieldValue;
        list<string> teet = new List<string>();
        for(Integer i = 1; i < dataRow.size()-1 ; i++ ){
            //System.debug('dataObj '+dataObj);
            teet = dataRow[i].split(',');
            barMap.put(teet[0],integer.valueof(teet[1]));
            System.debug(' '+teet[0]+ ' ' +integer.valueof(teet[1]));
        }
       /* for (Integer i = 1; i < dataRow.size(); i++) {
            string[] csvRecordData = dataRow[i].split(',');
            system.debug('csvRecordData '+csvRecordData);
            System.debug('dataRow[i] '+dataRow[i]);
            for (String fieldName: csvFieldNames) {
                fieldNumber = fieldNumberMap.get(fieldName);
                fieldValue = csvRecordData[fieldNumber];
                barMap.put( fieldValue.trim(), fieldNumber);
            }            
        }  */
        //system.debug('myFile '+myFile);
        system.debug('barMap '+barMap);
        return barMap;
    }
    
    @auraEnabled
    public static Map<string, integer> getChartMap(){
        Map<string, integer> mp = new Map<string, integer>();        
        mp.put('Jan', 45);
        mp.put('Feb', 50);
        mp.put('Mar', 30);
        mp.put('Apr', 36);
        mp.put('May', 42);
        mp.put('Jun', 39);
        mp.put('Jul', 41);
        mp.put('Aug', 36);
        mp.put('Sep', 43);
        mp.put('Oct', 45);
        mp.put('Nov', 33);
        mp.put('Dec', 53);
        
        return mp;
    }
    
    @auraEnabled
    public static Map<string, integer> getBarMap(string month,Integer Value){
        Map<string, integer> barMap = new Map<string, integer>();  
        
        barMap.put('Jan', 45);
        return barMap;
    }
    @AuraEnabled
    public static Id saveChunk(Id parentId, String fileName, String base64Data, String contentType, String fileId) {
        // check if fileId id ''(Always blank in first chunk), then call the saveTheFile method,
        //  which is save the check data and return the attachemnt Id after insert, 
        //  next time (in else) we are call the appentTOFile() method
        //   for update the attachment with reamins chunks   
        if (fileId == '') {
            fileId = saveTheFile(parentId, fileName, base64Data, contentType);
        } else {
            appendToFile(fileId, base64Data);
        }
        return Id.valueOf(fileId);
    }
    @AuraEnabled
    public static string saveChunk1(Id parentId, String fileName, String base64Data, String contentType, String fileId) {
        // check if fileId id ''(Always blank in first chunk), then call the saveTheFile method,
        //  which is save the check data and return the attachemnt Id after insert, 
        //  next time (in else) we are call the appentTOFile() method
        //   for update the attachment with reamins chunks   
        try{
            if (fileId == '') {
                String stringFile = EncodingUtil.urlDecode(base64Data, 'UTF-8');
                system.debug('stringFile'+stringFile);
            }
        }catch(exception e){
            system.debug('ex'+e.getLineNumber());
        } 
        return 'Success';
    }
    
    public static Id saveTheFile(Id parentId, String fileName, String base64Data, String contentType) {
        base64Data = EncodingUtil.urlDecode(base64Data, 'UTF-8');
        Attachment oAttachment = new Attachment();
        oAttachment.parentId = parentId;
        oAttachment.Body = EncodingUtil.base64Decode(base64Data);
        oAttachment.Name = fileName;
        oAttachment.ContentType = contentType;
        insert oAttachment;
        return oAttachment.Id;
    }
    
    private static void appendToFile(Id fileId, String base64Data) {
        base64Data = EncodingUtil.urlDecode(base64Data, 'UTF-8');
        
        Attachment a = [
            SELECT Id, Body
            FROM Attachment
            WHERE Id =: fileId
        ];
        
        String existingBody = EncodingUtil.base64Encode(a.Body);
        a.Body = EncodingUtil.base64Decode(existingBody + base64Data);
        update a;
    }
    @auraEnabled
    public List<LineChartVar> myLineChartVarList;
    
    public class LineChartVar {
        string label;
        integer firstValue;
        integer secondValue;       
        
        public LineChartVar(string a, integer b, integer c){
            label = a;
            firstValue = b;
            secondValue = c;
        } 
    }
    
    
    
    @auraEnabled
    public static string getLineChartMap(){
        List<LineChartVar> myLineChartVarList = new List<LineChartVar>();
        
        myLineChartVarList.add(new LineChartVar('2010', 10, 12));
        myLineChartVarList.add(new LineChartVar('2011', 12, 15));
        myLineChartVarList.add(new LineChartVar('2012', 17, 19));
        myLineChartVarList.add(new LineChartVar('2013', 19, 17));
        myLineChartVarList.add(new LineChartVar('2014', 21, 15));
        myLineChartVarList.add(new LineChartVar('2015', 17, 20));
        myLineChartVarList.add(new LineChartVar('2016', 18, 16));
        
        System.debug('asdf:    '+myLineChartVarList);
        
        return JSON.Serialize(myLineChartVarList);
    }
    @AuraEnabled
    public static void onProcessBatch(String fileContents)
    {
        String stringFile = EncodingUtil.urlDecode(fileContents, 'UTF-8');
        system.debug('stringFile'+stringFile);
    }
}