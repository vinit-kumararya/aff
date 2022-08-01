import { LightningElement,wire,track } from 'lwc';
import getAccounts from '@salesforce/apex/AccountData.getAccounts';

export default class Account extends LightningElement {
    accName = 'Test';
    @track acctList;
    @track accDetailId;
    @track openModal = false;

    @wire(getAccounts)
    listOfAccounts({data,error}){
        if(data){
            console.log(data);
            this.acctList = data;
        }
        else if(error){
            this.showToast('ERROR',error.body.message,'error')
        }
    }


    getAccountId(event){
        console.log("Button clicked");
        this.accDetailId = event.target.value
        console.log(this.accDetailId);
        this.openModal = true;
    }

    closeModal() {
        this.openModal = false;
    }
}