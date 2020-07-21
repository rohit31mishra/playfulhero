trigger Acc_trig on Account (before delete) { 
    if(trigger.isDelete){ 
        for(Account acc:trigger.old){ 
            
            acc.addError('im an html error with a <a href="http://google.com">link</a>', FALSE); 
            
        } 
    } 
}