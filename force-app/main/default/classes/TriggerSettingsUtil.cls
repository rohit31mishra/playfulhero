public class TriggerSettingsUtil
    {    
        public static boolean doBypassTrigger(String triggerName)
        {    
            List<Trigger_Settings__mdt> TriggerStg = new List<Trigger_Settings__mdt>([SELECT Id,label, DeveloperName,
                                                                                     ByPass_For_All__c, ByPass_Users__c, 
                                                                                     Is_Active__c, Object_Name__c 
                                                                                     FROM Trigger_Settings__mdt where label=: triggerName LIMIT 1]);
            // If the Setting is not avaliable then Trigger needs to run....
            if (TriggerStg.size() < 0 &&  !TriggerStg.isempty()){
                return false;
                }
            
            //If the setting is inactive then ignore further properties...
            if  (TriggerStg[0].Is_Active__c == false)
                return false;

            if  (TriggerStg[0].ByPass_For_All__c == true)
                return true;

            if  (TriggerStg[0].ByPass_Users__c != null &&
                 TriggerStg[0].ByPass_Users__c.contains(String.valueOf(UserInfo.getUserId()).substring(0,15)))
                return true;

            return false;


            /*
            // Do not run the trigger if it is bypassed from Trigger Settings   
            Map<String,Trigger_Settings__c> mapTriggerSettings = Trigger_Settings__c.getAll();
        
            if( mapTriggerSettings != null && 
                mapTriggerSettings.containsKey(triggerName)
           ){
               
               if(mapTriggerSettings.get(triggerName).ByPass_For_All__c ){
                   
                   return true; 
                   
               }else if(mapTriggerSettings.get(triggerName).ByPass_For_All__c == false && 
                        mapTriggerSettings.get(triggerName).ByPass_Users__c != null && 
                        mapTriggerSettings.get(triggerName).ByPass_Users__c.trim() != '' &&
                        mapTriggerSettings.get(triggerName).ByPass_Users__c.contains(UserInfo.getUserId())){
                   
                   return true;
                   
               }
         }
         
         return false;*/
            
    }
}