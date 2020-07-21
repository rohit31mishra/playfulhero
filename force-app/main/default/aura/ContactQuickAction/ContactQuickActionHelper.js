({
    getDataHelper : function(component, event) {
        var action = component.get("c.getAccRecords1");
        action.setParams({
                'accId' : component.get("v.recordId"),
            });
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === 'SUCCESS'){
                var pageSize = component.get("v.pageSize");
                component.set("v.startPage",0);
                component.set("v.endPage",pageSize-1);
                component.set("v.mycolumns", response.getReturnValue().lstTableColumns);
                component.set("v.mydata", response.getReturnValue().lstTableData);
                component.set("v.totalRecords", component.get("v.mydata").length);
                //component.set('v.maxPage', Math.floor((component.get("v.mydata").length+4)/5));
                //console.log(' vv ss '+Math.floor((component.get("v.mydata").length+4)/5) );
                var paginationList = [];
                for(var i=0; i< pageSize; i++){
                    if(component.get("v.mydata").length> i)
                        paginationList.push(response.getReturnValue().lstTableData[i]);  
                }
                component.set('v.paginationList', paginationList);
                component.set('v.isSending',false);
            }else if (state === 'ERROR'){
                var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        console.log("Error message: " +
                                    errors[0].message);
                    }
                } else {
                    console.log("Unknown error");
                }
            }else{
                console.log('Something went wrong, Please check with your admin');
            }
        });
        $A.enqueueAction(action);	
    },
    /*
     * Method will be called when use clicks on next button and performs the 
     * calculation to show the next set of records
     */
    next : function(component, event){
        var sObjectList = component.get("v.mydata");
        var end = component.get("v.endPage");
        var start = component.get("v.startPage");
        var pageSize = component.get("v.pageSize");
        var paginationList = [];
        var counter = 0;
        for(var i=end+1; i<end+pageSize+1; i++){
            if(sObjectList.length > i){
                paginationList.push(sObjectList[i]);
            }
            counter ++ ;
        }
        start = start + counter;
        end = end + counter;
        component.set("v.startPage",start);
        component.set("v.endPage",end);
        component.set('v.paginationList', paginationList);
    },
    /*
     * Method will be called when use clicks on previous button and performs the 
     * calculation to show the previous set of records
     */
    previous : function(component, event){
        var sObjectList = component.get("v.mydata");
        var end = component.get("v.endPage");
        var start = component.get("v.startPage");
        var pageSize = component.get("v.pageSize");
        var paginationList = [];
        var counter = 0;
        for(var i= start-pageSize; i < start ; i++){
            if(i > -1){
                paginationList.push(sObjectList[i]);
                counter ++;
            }else{
                start++;
            }
        }
        start = start - counter;
        end = end - counter;
        component.set("v.startPage",start);
        component.set("v.endPage",end);
        component.set('v.paginationList', paginationList);
    },
})