public class CreateContactfromAccount {
    
    public static void createContact(List<Account>AccountList){
        List<Contact> ContactList = new List<Contact>();
        for(Account a: AccountList)
        {
            Contact c = new Contact();
            c.FirstName = a.Name;
            c.LastName  = 'Customer Representative';
            c.AccountId = a.Id;
            c.Email  = a.Company_Email__c;
            c.Phone = a.Phone;
            ContactList.add(c);
        }
        insert ContactList;
    }
}