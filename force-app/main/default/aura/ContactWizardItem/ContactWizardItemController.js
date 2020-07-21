({
    AddNewRow : function(component, event, helper) {
        component.getEvent("AddRowEvt").fire(); 
    },
    removeRow : function(component, event, helper){
        component.getEvent("DeleteRowEvt").setParams({"indexVar" : component.get("v.rowIndex") }).fire();
    }, 
    populateAccName: function(component, event, helper) {
        var AccountName = event.getParam("AccName");
        component.set("v.accountNameFormEvt", AccountName);
    }
})