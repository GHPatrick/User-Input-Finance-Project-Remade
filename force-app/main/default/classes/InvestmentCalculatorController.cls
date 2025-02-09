public with sharing class InvestmentCalculatorController {

    // setting of Map to return lists of records from the method
    // method parameters of initInv, monDep, anuInt, years
    @AuraEnabled
    public static Map<String, Object> calculateInvestment(Decimal initInv, Decimal monDep, Decimal anuInt, Integer years) {

        // initialize the result map
        Map<String, Object> result = new Map<String, Object>();

        // initialize total amount to total investment
        Decimal totalAm = initInv;

        List<Map<String, Object>> yearlyResultsWithoutDeposits = new List<Map<String, Object>>();
        List<Map<String, Object>> yearlyResultsWithDeposits = new List<Map<String, Object>>();

        // calculate balance and interest without monthly deposits
        for (Integer i = 0; i < years; i++) {
            Decimal intAmt = totalAm * (anuInt / 100);
            totalAm += intAmt;

        // map to store the results for the current year without deposits
        // formatted values as strings with a rounding of two decimal places
            Map<String, Object> yearResult = new Map<String, Object>();
            yearResult.put('year', i + 1);
            yearResult.put('balance', '$' + totalAm.setScale(2, RoundingMode.HALF_UP));
            yearResult.put('interest', '$' + intAmt.setScale(2, RoundingMode.HALF_UP));
            yearlyResultsWithoutDeposits.add(yearResult);
        }

        // reset total amount to initial investment
        totalAm = initInv;


        // calculate balance and interest with monthly deposits
        for (Integer i = 0; i < years; i++) {
            Decimal yearTotInt = 0;


        // identical to before, except adding for monthly deposits
            for (Integer j = 0; j < 12; j++) {
                Decimal intAmt = (totalAm + monDep) * (anuInt / 100 / 12);
                yearTotInt += intAmt;
                totalAm += monDep + intAmt;
            }


        // similar Map as before except WITH deposits
        // formatted values as strings with a rounding of two decimal places
            Map<String, Object> yearResult = new Map<String, Object>();
            yearResult.put('year', i + 1);
            yearResult.put('balance', '$' + totalAm.setScale(2, RoundingMode.HALF_UP));
            yearResult.put('interest', '$' + yearTotInt.setScale(2, RoundingMode.HALF_UP));
            yearlyResultsWithDeposits.add(yearResult);
        }


        // adds the lists of yearly results with and without deposits to the result
        result.put('withoutDeposits', yearlyResultsWithoutDeposits);
        result.put('withDeposits', yearlyResultsWithDeposits);

        return result;


    }
}