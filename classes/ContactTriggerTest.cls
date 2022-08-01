@isTest
public class ContactTriggerTest {
    
    @testsetup static void testSetupMethod(){
    
        Account testAcct = new Account();
        testAcct.Name='Test Account' ;
        testAcct.Industry = 'Banking';
        insert testAcct;
        
        Contact con = new Contact();
        con.AccountId = testAcct.Id;
        con.LastName = 'Last Name';
        insert con;
       
    }
    
    @isTest static void testUpdateContact(){
        List<Account> accList = [select industry from account limit 1];
        accList[0].industry = 'Agriculture';
        update accList[0];
        
        List<Contact> conList = [SELECT LastName from Contact where accountid = :accList[0].id];
        conList[0].LastName = 'Last Name Updated';
        update conList;
        
        List<Contact> updatedConList = [SELECT Account_Industry__c from Contact where accountid = :accList[0].id];
        System.assertEquals('Agriculture', updatedConList[0].Account_Industry__c); 
    }
    
    @isTest static void testInsertContact(){
        List<Account> accList = [select industry from account limit 1];
        Contact con = new Contact();
        con.AccountId = accList[0].Id;
        con.FirstName = 'First Name';
        con.LastName = 'Last Name 2';
        insert con;
        
        List<Contact> updatedConList = [SELECT Account_Industry__c from Contact where LastName = 'Last Name 2'];
        System.assertEquals('Banking', updatedConList[0].Account_Industry__c); 
    }
}