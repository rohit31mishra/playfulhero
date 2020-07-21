({
	helperMethod : function() {
		
	}
})
/*
//You can use these utility methods by extending from the ApexHelper component created earlier:
//<aura:component extends="c:ApexHelper">

//Example of executing an Apex Method through our new utility:
helper.apex(component, "search", { searchstr : searchTerm })
.then(function (result) {
  //do something with the result
})
.catch(function (error) {
  //do something about the error
})

//Example of executing SOQL with our new utility
helper.soql(component, "SELECT Id, Name, AnnualRevenue, Industry FROM Account WHERE Name LIKE '%" + searchTerm + "%'")
.then(function (accounts) {
  //do something about the accounts
})
.catch(function (error) {
  //do something about the error
})
*/
//Remember to use `this` instead of `helper` if you're using the utility methods inside a helpe