public class JSremotingfunction{
 
    @RemoteAction
    public static void createContact(Contact con) {
        try {
            Database.SaveResult sr = Database.insert(con);
        } catch(DmlException e) {
 
                system.debug('**********'+e.getmessage());
        }
 
    }
}