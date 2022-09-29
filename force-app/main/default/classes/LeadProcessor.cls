public with sharing class LeadProcessor implements Database.Batchable<SObject>{

    /*This method is called once at the beginning of a Batch Apex job and returns either a Database.QueryLocator object or an Iterable that contains the records or objects passed to the job.*/
    public Database.QueryLocator start(Database.BatchableContext bc){
       return Database.getQueryLocator('SELECT Id, Name FROM Lead');
    }


    /*
    “Batch” of data passed to the method. 
    The default batch size is 200 records. 
    Batches of records are not guaranteed to execute in the order they are received from the start method.
    *@params - 1. A reference to the Database.BatchableContext object. 
    
            2.A list of sObjects, such as List<sObject>, or a list of parameterized types. 
            If you are using a Database.QueryLocator, use the returned list.
    */
    public void execute(Database.BatchableContext bc, List<Lead> records){
        for(Lead lead: records){
            lead.LeadSource = 'Dreamforce';
        }

        update records;
    }


    /*Used to execute post-processing operations 
    (for example, sending an email) 
    and is called once after all batches are processed.*/ 
    public void finish(Database.BatchableContext bc){
        system.debug('done');
    }
}
