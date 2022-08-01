trigger ContactTrigger on Contact (before insert, before update) {
    
    Set<id> accSet = new Set<id>();
    For(contact cont : trigger.new){
        accSet.add(cont.accountid);
    }
    
    if(accSet.size()>0){
        Map<id,account> accountMap = new Map<id,account>([select industry from account where id in :accSet]);        
        for(contact con : trigger.new){
            if(!String.isblank(con.accountid))
                con.account_industry__c = accountMap.get(con.accountid).industry;
        }
    }

}