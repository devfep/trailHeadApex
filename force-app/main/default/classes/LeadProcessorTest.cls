@isTest
public class LeadProcessorTest {
   
    @isTest
    public static void testBatchClass(){
        List<Lead> leads  = new List<Lead>();

        for (Integer i = 0; i < 200; i++) {
            leads.add(new Lead(LastName='donald',Company='Salesforce'));
        }
        insert leads;


        //perform test
        Test.startTest();
        LeadProcessor lp = new LeadProcessor();
        Id batchId = Database.executeBatch(lp, 200);
        Test.stopTest();

        //check results
        List<Lead> updatedLeads = [SELECT Id FROM Lead WHERE LeadSource = 'Dreamforce'];
        System.assertEquals(200, updatedLeads.size(), 'ERROR: Update wasn\'t done correctly');
    }


}