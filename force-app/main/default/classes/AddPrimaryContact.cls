public without sharing class AddPrimaryContact implements Queueable{
    private Contact contact;
    private String state;

    public AddPrimaryContact(Contact contact, String state) {
        this.contact = contact;
        this.state = state;
    }

    public void execute(QueueableContext qc){
        
        //Retrieve 200 Account records
        List<Account> accounts = [SELECT id FROM Account WHERE BillingState = :state lIMIT 200];

        //Create empty list of Contact records
        List<Contact> contacts = new List<Contact>();

        //Iterate through the Account record
        for (Account acc : accounts){

            //clone the Contact record,
            //make the clone a child of the specific Account record
            //and add to the list of contacts
            Contact contactClone = contact.clone();
            contactClone.AccountId = acc.Id;
            contacts.add(contactClone);
        }

       insert contacts; 
    }

}
