public class AccountStdCntrl {

    private final Account acct;
    
    // The extension constructor initializes the private member
    // variable acct by using the getRecord method from the standard
    // controller.
    public AccountStdCntrl(ApexPages.StandardController stdController) {
        this.acct = (Account)stdController.getRecord();
    }

    public string Save() {
        List<Account> accObj = new List<Account>([Select id ,name,Sic from Account WHERE id =:acct.id Limit 1]);
        List<Account> accObj1 = new List<Account>();
        for(Account acc :accObj){
            acc.Sic = '233';
            accObj1.add(acc);
        }
        Update accObj1;
        return null;
    }
}