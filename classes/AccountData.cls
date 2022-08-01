public class AccountData {
    
    @auraEnabled(cacheable=true)
    public static List<Account> getAccounts()
    {
        return [SELECT Name FROM Account LIMIT 5];
    }
    
    @auraEnabled(cacheable=true)
    public static AccountDetailsWrapper getAcctDetail(String accId)
    {	AccountDetailsWrapper ad = new AccountDetailsWrapper();
        Account acc=[SELECT id,name,Industry,Type,ownerId FROM Account where id=:accId];
     	User usr = [Select id,Name,FullPhotoUrl from user where id=:acc.ownerId];
     	
     	ad.accId = acc.id;
     	ad.accName = acc.Name;
     	ad.accIndustry = acc.Industry;
     	ad.accOwnerName = usr.Name;
     	ad.accType = acc.Type;
     	ad.accFullPhotoUrl = usr.FullPhotoUrl;
        return ad;
    }

        public class AccountDetailsWrapper{
        @auraenabled
        public String accId;
        @auraenabled
        public String accName;
        @auraenabled
        public String accIndustry;
        @auraenabled
        public String accType;            
        @auraenabled
        public String accOwnerName; 
        @auraenabled
        public String accFullPhotoUrl;
    }
}