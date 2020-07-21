({	
    ctr : function(component, event, helper) {
        var dataFromEvent = event.getParam("holdMapEvt");
        var temp = [];
        var temp2 = [];
        //var action = component.get("c.getChartMap");
        helper.createGraph(component, dataFromEvent);
              
        /*var action1 = component.get("c.getLineChartMap");
         action1.setCallback(this, function(response){        	    	    
            if(response.getState() === 'SUCCESS' && response.getReturnValue()){
                temp2 = JSON.parse(response.getReturnValue());
                helper.createLineGraph(component, temp2);
            }            
        });  
       $A.enqueueAction(action1);*/
        
    }
})