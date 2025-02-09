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

        // map to store the results for the current year without deposits
            Map<String, Object> yearResult = new Map<String, Object>();
            yearResult.put('year', i + 1);
            yearResult.put('balance', totalAm);
            yearResult.put('interest', intAmt);
            yearlyResultsWithoutDeposits.add(yearResult);
        }

        // reset total amount to initial investment
        totalAm = initInv;


        // calculate balance and interest with monthly deposits
        for (Integer i = 0; i < years; i++) {
            Float yearTotInt = 0;


        // identical to before, except adding for monthly deposits
            for (Integer j = 0; j < 12; j++) {
                Float intAmt = (totalAm + monDep) * (anuInt / 100 / 12);
                yearTotInt += intAmt;
                totalAm += monDep + intAmt;
            }


        // similar Map as before except WITH deposits
            Map<String, Object> yearResult = new Map<String, Object>();
            yearResult.put('year', i + 1);
            yearResult.put('balance', totalAm);
            yearResult.put('interest', yearTotInt);
            yearlyResultsWithDeposits.add(yearResult);
        }


        // adds the lists of yearly results with and without deposits to the result
        result.put('withoutDeposits', yearlyResultsWithoutDeposits);
        result.put('withDeposits', yearlyResultsWithDeposits);

        return result;


    }
}