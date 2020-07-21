/**
 * @author Sidharth Varma
 * @date May 2017
 * @group gf_Integration
 * @group-content ../ApexDocContent/Classes.html
 * @description This class depicts a GF SFDC Org.
 *              On instantiation it determins if this current org that it is running in is E1/E2/E3.
 **/
public without sharing class  GFOrg_G {
    
  /*  private final Organization org;
    @TestVisible private final boolean isSandbox;
    @TestVisible private final String runningUserName;
    @TestVisible private final String hostURL;

    // These are candidates for a Gold Copy Constants Files
    @TestVisible private static final String ENV_NAME_E1 = 'E1';
    @TestVisible private static final String ENV_NAME_E2 = 'E2';
    @TestVisible private static final String ENV_NAME_E3 = 'E3';


    private static final String UNKNOWN_SANDBOX = 'xUNKNOWNx';

    //Constructor
    public GFOrg_G(){
        org = [SELECT InstanceName,Name,IsSandbox FROM Organization LIMIT 1];
        isSandbox = org.IsSandbox;
        runningUserName = UserInfo.getUserName();
        hostURL = URL.getSalesforceBaseUrl().getHost();
    }


    // Construcor to be used for Test Classes
    @TestVisible private GFOrg_G(Boolean isSandbox, String hostURL, String runningUserName){
        this.isSandbox = isSandbox;
        this.hostURL = hostURL;
        this.runningUserName = runningUserName;
    }


    //Is this a sandbox org
    public Boolean isSandbox(){
         return isSandbox;
    }

    public String getHost(){
        return hostURL;
    }

    public String getRunningUserName(){
        return runningUserName.substringAfterLast('.').toUpperCase();
    }

    //Is this E1, E2 or E3
    public String getOrgType(){

        String env = '';
        String orgName = this.getSandboxName();
        //If
        if (!isSandbox()) {
            env = ENV_NAME_E3;
        }
        else {
            //retrieve the environment from custom metadate type setting based on the sandbox/org name
            OrgEnvironment_G__mdt[] threatMappings = [
                    SELECT Id, DeveloperName, MasterLabel, Environment__c
                    FROM OrgEnvironment_G__mdt
                    where DeveloperName = :orgName
            ];
            System.debug('$$ threatMappings: '+threatMappings);
            for (OrgEnvironment_G__mdt threatMapping : threatMappings) {
               env = threatMapping.Environment__c;
               
            }
            env = String.isEmpty(env) ? ENV_NAME_E2 : env;
        }



        return env;
    }

    //Try to get the name of the sandbox based on username - returns empty string for PRD Org
    public String getSandboxName(){
        String sandboxName = '';

        if (isSandbox()){

            String sandboxNameByUser = getRunningUserName();
            String sandboxNameByHostName = '';
            // Try to figure out the Sandboxname based on user & hostname
  
             if (getHost().contains('--') && getHost().contains('visual') ){
                  sandboxNameByHostName = getHost().substring(getHost().indexOf('--')+2,getHost().indexOf('--c')).toUpperCase();

            }else if (getHost().contains('--')){
                  sandboxNameByHostName = getHost().substring(getHost().indexOf('--')+2,getHost().indexOf('.')).toUpperCase();
            }
            if (sandboxNameByUser.equalsIgnoreCase(sandboxNameByHostName)){
                sandboxName  = sandboxNameByUser;
            }
            else if (String.isEmpty(sandboxNameByHostName) && (String.isNotEmpty(sandboxNameByUser))){
                sandboxName  = sandboxNameByUser;
            }
            else if (String.isEmpty(sandboxNameByUser) && (String.isNotEmpty(sandboxNameByHostName))){
                sandboxName  = sandboxNameByHostName;
            }
            else {
                sandboxName = UNKNOWN_SANDBOX;
            }
        }

        return sandboxName;
    }
*/
}