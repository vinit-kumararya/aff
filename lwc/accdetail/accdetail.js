import { LightningElement,api,track,wire } from 'lwc';
import getAcctDetail from '@salesforce/apex/AccountData.getAcctDetail';

export default class Accdetail extends LightningElement {
    @api idFromParent;
    @track acctDetail =[];
    @track loading = false;

    @wire(getAcctDetail,{accId: '$idFromParent'})
    accountDetailById({data,error}){
        this.loading = true;
        if(data){
            console.log('Data from Account Details'+data.accId);
            const tak = {
                accId  : data.accId,
                accName :data.accName,
                accIndustry : data.accIndustry ,
                accType: data.accType,
                accOwnerName : data.accOwnerName,
                accFullPhotoUrl : data.accFullPhotoUrl
            };
            this.acctDetail = tak;
        this.loading = false;
        }
        else if(error){
            this.showToast('ERROR',error.body.message,'error')
        }
    }

}