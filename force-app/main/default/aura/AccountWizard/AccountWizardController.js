({
	showContactPannel : function(component, event, helper) {
		console.log('Account Name '+component.get("v.AccountName"));
        component.set("v.openCPannel",true);
        //var appEvent = $A.get("e.c:HoldAccountNameEvt");
        component.set('v.currentStep','2');
		//appEvent.setParams({
		//	"AccName" : component.get("v.AccountName")});
        //appEvent.fire();
        //component.getEvent("accNameEvt").setParams({"AccName" : "Hello" }).fire();
        //var forclose = component.find("accTable");
        //$A.util.addClass(forclose, 'slds-hide');
		
        component.set('v.currentStep','2');
    },
    showOpportunityPannel : function(component, event, helper) {
		console.log('Rohit'+component.get("v.AccountName"));
        component.set("v.openOPannel",true);
        var appEvent = $A.get("e.c:HoldAccountNameEvt");
		appEvent.setParams({
			"AccName" : component.get("v.AccountName")});
        appEvent.fire();
        //component.getEvent("accNameEvt").setParams({"AccName" : "Hello" }).fire();
    	console.log('Rohit evt  sdf');
	},
    Save : function(component, event, helper){
        if(helper.validateCheck(component, event, helper)){
            
            
        }
        
    },
    strChanged : function (component, event, helper){
        console.log('Parent '+component.get('v.str'));
    },
    
    conAttrChanged : function (component, event, helper){
        console.log('Parent '+component.get('v.conAttr'));
    },
    progressValUpdate : function (component, event, helper){
        component.set('v.progressVal',component.get('v.progressVal'));
        console.log('Progress val '+component.get('v.progressVal'));
    },
    selectFromHeaderStep1: function (component, event, helper){
        component.set('v.currentStep','1');
        
    },
    selectFromHeaderStep2: function (component, event, helper){
        component.set('v.currentStep','2');
        
    },
    selectFromHeaderStep3: function (component, event, helper){
        component.set('v.currentStep','3');
        
    }
})