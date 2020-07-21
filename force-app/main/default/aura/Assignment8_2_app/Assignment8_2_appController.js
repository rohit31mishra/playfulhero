({
    clear : function(component, event, helper) {
        var selectedPillId = event.getSource().get("v.name");
        var AllPillsList = component.get("v.lstSelectedRecords"); 
        var dePillsList = component.get("v.lstDeSelectedRecords"); 
        for(var i = 0; i < AllPillsList.length; i++){
            if(AllPillsList[i].Id == selectedPillId){
                AllPillsList.splice(i, 1);
                //dePillsList.push(AllPillsList[i].Id);
                console.log(selectedPillId);
                component.set("v.lstDeSelectedRecords", dePillsList);
                component.set("v.lstSelectedRecords", AllPillsList);
            }  
        }
        //component.set("v.SearchKeyWord",null);
        //component.set("v.listOfSearchRecords", null );
    },
    "processEmail" : function(component, event, helper){
        helper.setProcessedEmail(component, event, helper);
        
    },    
    addToValidList : function(component, event, helper){
        //component.set('v.recId',event.currentTarget.dataset.record);
        var selectedStr = component.get("v.selectedStr");
        var clickedStr = event.currentTarget.dataset.record;
        if(event.currentTarget.text == "Remove"){
            var updatedStr = selectedStr.replace(clickedStr, "");
            $A.util.toggleClass(event.currentTarget, "RemoveBtnCls");
            console.log('updatedStr '+updatedStr);
            //event.currentTarget.text 
        }
        else if(event.currentTarget.text == "Add"){
            var updatedStr = selectedStr+ ';' + clickedStr;
            $A.util.toggleClass(event.currentTarget, "AddBtnCls");
            event.currentTarget.text 
            console.log('updatedStr '+updatedStr);
        }
        component.set("v.selectedStr",updatedStr);
        
    },
    /*removeToValidList : function(component, event, helper){
        //component.set('v.recId',event.currentTarget.dataset.record);
        console.log('HEllo '+event.currentTarget.dataset.record);
        var selectedStr = component.get("v.selectedStr");
        var updatedStr = selectedStr.replace(event.currentTarget.dataset.record, "");
        component.set("v.selectedStr",updatedStr);
        console.log('updatedStr '+updatedStr);
         console.log('updatedStr '+event.currentTarget.text);
        $A.util.toggleClass(event.currentTarget, "none");
    },*/
    init: function(component, event, helper) {
        debugger
        $A.util.addClass(component.find("hello"), "validEmail");
        var action = component.get("c.fetchAccountRecord");
        //action.setParams({ firstName : component.get("v.firstName") });
        
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.lstSelectedRecords",response.getReturnValue()) ;
                var data = response.getReturnValue();
                var str = '';
                for(var i = 0 ; i< data.length ; i++){
                    console.log(data[i].Name);
                    if(str == ''){
                        str = data[i].Name;
                    }else{
                        str = str +';' +data[i].Name;
                    }
                }
                console.log(str);
                component.set("v.selectedStr",str);
                
                
                helper.setProcessedEmail(component, event, helper);
            }
            else if (state === "INCOMPLETE") {
                // do something
            }
                else if (state === "ERROR") {
                    var errors = response.getError();
                    if (errors) {
                        if (errors[0] && errors[0].message) {
                            console.log("Error message: " + 
                                        errors[0].message);
                        }
                    } else {
                        console.log("Unknown error");
                    }
                }
        });
        $A.enqueueAction(action);
        
        
        
        
    },
})