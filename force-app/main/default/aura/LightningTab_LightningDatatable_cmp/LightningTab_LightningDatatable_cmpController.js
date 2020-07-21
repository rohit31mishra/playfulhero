({
	init : function(component, event, helper) {
		console.log('Rohit');
	},
    handleClick : function(component, event, helper) {
		//const variable1 = event.getSource().get("v.label");
        var ctarget = event.currentTarget;
        console.log('cc '+ctarget);
  //  var id_str = event.currenttarget.dataset.value;
  //  console.log(id_str);
        
        var selectedItem = event.currentTarget;
                        var Name = selectedItem.dataset.record;
                        console.log('data Name = '+ Name);
        
        var Name1 = selectedItem.dataset.record1;
                        console.log('data Name = '+ Name1);
        
        
	},
})