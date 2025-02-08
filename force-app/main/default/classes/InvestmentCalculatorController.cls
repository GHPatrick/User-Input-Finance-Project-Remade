public with sharing class InvestmentCalculatorController {

    // setting of Map to return lists of records from the method
    // method parameters of monDep, anuInt, year 
    @AuraEnabled
    public static Map<String, Object> caculateInvestment(Float monDep, Float anuInt, Integer year) {

        // initialize the result map
        Map<String, Object> result = new Map<String, Object>();

        // initialize total amount to total investment
        Float totalAm = initInv;

        List<Map<String, Object>> yearlyResultsWithoutDeposits = new List<Map<String, Object>>();
        List<Map<String, Object>> yearlyResultsWithDeposits = new List<Map<String, Object>>();

        // calculate balance and interest without monthly deposits
        for (Integer i = 0; i < years; i++) {
            Float intAmt = totalAm * (anuInt / 100);
            totalAm += intAmt;





        }

        try {
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}