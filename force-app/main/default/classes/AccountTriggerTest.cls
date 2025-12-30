@isTest
private class AccountTriggerTest {
    @isTest
    static void testAccountInsert() {
        // Prepare data
        Account acc = new Account(Name = 'Test DevOps Account');
        
        // Execute the trigger logic
        Test.startTest();
        insert acc;
        Test.stopTest();
        
        // Verify the results (Asserts)
        Account result = [SELECT Description, Rating FROM Account WHERE Id = :acc.Id];
        System.assertEquals('Description set by Developer B', result.Description);
        System.assertEquals('Hot', result.Rating);
    }
}