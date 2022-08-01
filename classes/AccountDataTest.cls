@isTest
public class AccountDataTest {
    
    @testsetup
    public static void setup(){
        List<Account> accts = new List<Account>();
        for(Integer i=0; i<7;i++){
        Account testAcct = new Account();
        testAcct.Name='Test Account'+i ;
        accts.add(testAcct);
        }
        insert accts;
    }
    
    @isTest
    static void testReturnOfFiveAccounts(){
        Test.startTest();
        List<Account> ac = AccountData.getAccounts();
        Test.stopTest();
        System.assertEquals(5, ac.size());         
    }
    
    @isTest
    static void testReturnOfAcctDetails(){
        Account ac = [Select id from Account where name =: 'Test Account1'];
        Test.startTest();
        AccountData.AccountDetailsWrapper acctDetail = AccountData.getAcctDetail(ac.Id);
        Test.stopTest(); 
        System.assertEquals('Test Account1', acctDetail.accName);
    }
}