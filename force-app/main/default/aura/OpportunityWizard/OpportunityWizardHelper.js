({
    createObjectData: function(component, event) {
        // get the contactList from component and add(push) New Object to List  
        var RowItemList = component.get("v.OpportunityList");
        RowItemList.push({
            'sobjectType': 'Opportunity',
            'FirstName': '',
            'LastName': '',
            'Phone': ''
        });
        // set the updated list to attribute (contactList) again  
        console.log('createObjectData'+RowItemList);  
        component.set("v.OpportunityList", RowItemList);
    }
})