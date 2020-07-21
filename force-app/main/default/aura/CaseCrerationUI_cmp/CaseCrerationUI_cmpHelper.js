({
    getTypeOptions : function(component, event) {
        var action = component.get("c.getTypeOptions");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var result = response.getReturnValue();
                var typeOptionsMap = [];
                for(var key in result){
                    typeOptionsMap.push({label: result[key], value: key});
                }
                component.set("v.typeOptions", typeOptionsMap);
            }
        });
        $A.enqueueAction(action);
        
    }
})