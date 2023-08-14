@isTest
public class CreateContactFromAccountTest {
  @isTest static void  createContactTest(){
        List<Account> acc = new List<Account>();
        Account a= new Account();
        a.Name='Test Account';
       
        acc.add(a);
        insert acc;
        Test.startTest();
        CreateContactfromAccount.createContact(acc);
        Test.stopTest();
    }
    
}