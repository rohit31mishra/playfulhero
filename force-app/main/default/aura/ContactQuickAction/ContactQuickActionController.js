({
    doInit : function(component, event, helper) {	
        console.log('Inside doInit');
        helper.getDataHelper(component, event);
    },
    renderPage: function(component, event, helper) {
        helper.renderPage(component);
    },
    next: function (component, event, helper) {
        helper.next(component, event);
    },
    previous: function (component, event, helper) {
        helper.previous(component, event);
    },
})