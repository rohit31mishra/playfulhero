({
	serverCall : function(component, event, helper) {
        
		var target = event.target;  
        var searchText = target.value; 
        console.log('searchText'+searchText);
        var action = component.get('c.searchDB');
        action.setParams({
                objectName : 'objectName',
                searchText : searchText
            });
        action.setCallback(this,function(res){
                this.handleResponse(res,component,helper);
            });
        $A.enqueueAction(action); 
	},
    handleResponse : function (res,component,helper){
        if (res.getState() === 'SUCCESS') {
            console.log(res.getReturnValue());
            var retObj = JSON.parse(res.getReturnValue());
            if(retObj.length <= 0){
                var noResult = JSON.parse('[{"text":"No Results Found"}]');
                component.set("v.server_result",noResult); 
            	component.set("v.last_ServerResult",noResult);
            }else{
                //console.log(retObj);
                component.set("v.server_result",retObj); 
            	component.set("v.last_ServerResult",retObj);
                component.set("v.listOfSearchRecords",res.getReturnValue());
                
            }  
        }else if (res.getState() === 'ERROR'){
            var errors = res.getError();
            if (errors) {
                if (errors[0] && errors[0].message) {
                    alert(errors[0].message);
                }
            } 
        }
    },
    serverCall1 : function (component,event,helper){
       
        var action = component.get('c.fetchLookUpValues1');
        action.setParams({
                'searchKeyWord' : component.get("v.SearchKeyWord"),
                'ObjectName' : 'User',
            });
        action.setCallback(this,function(res){
            var storeResponse = res.getReturnValue();
            console.log('Inside if '+storeResponse);
                component.set("v.listOfSearchRecords", storeResponse);
            });
        $A.enqueueAction(action); 
        
    }
})