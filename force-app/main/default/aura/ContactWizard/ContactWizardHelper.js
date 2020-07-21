({
    createObjectData: function(component, event) {
        // get the contactList from component and add(push) New Object to List  
        var RowItemList = component.get("v.contactList");
        RowItemList.push({
            'sobjectType': 'Contact',
            'FirstName': '',
            'LastName': '',
            'Phone': ''
        });
        // set the updated list to attribute (contactList) again  
        console.log('createObjectData'+RowItemList);  
        component.set("v.contactList", RowItemList);
        
        
        //var acc = component.get('v.str');
        
        
    }
})