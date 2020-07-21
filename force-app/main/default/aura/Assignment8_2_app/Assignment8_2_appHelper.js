({
	setProcessedEmail : function(component, event, helper) {
		var selectedEVals = [];
        var textValue;
        var checkvalue = component.find("incomeLineId");
        for (var i = 0; i < checkvalue.length; i++) {
            if (checkvalue[i].get("v.value") == true) {
                textValue = checkvalue[i].get("v.text");
                if(selectedEVals.includes(textValue) == false){
                    selectedEVals.push(textValue);
                    console.log('@@@@'+component.get("v.emailToProcess"));
                }       
            }
        }
        component.set("v.emailToProcess",selectedEVals);
        console.log(component.get("v.emailToProcess"));
	}
})