trigger AccountCreation on Account (after insert,after Update) {
            List<Account> AccList = new List<Account>();
    if(Trigger.isInsert)
    {    
            for(Account a:trigger.new)
            {    	
                if( a.Type == 'Customer' && a.Active__c == True){
                    AccList.add(a);
                }
               
            }
     }
    if(Trigger.isUpdate)
    {
        for(Account a:trigger.new)
            {    	
                if( a.Type == 'Customer' && a.Active__c == True){
                    AccList.add(a);
                }
               
            }
    }
    List<Account> UpdateAccList = new List<Account>();
    for(Account a :[Select Id,Name,Phone,Company_Email__c,(Select Id from Contacts) from Account where Id =: AccList]){
            List<Contact> con = a.Contacts;
            if(con.size() == 0){
               UpdateAccList.add(a);
            }
    }
    CreateContactfromAccount.createContact(UpdateAccList);
}