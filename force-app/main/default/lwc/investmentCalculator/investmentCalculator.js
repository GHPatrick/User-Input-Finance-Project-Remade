import { LightningElement } from 'lwc';
import calculateInvestment from '@salesforce/apex/InvestmentCalculatorController.calculateInvestment';

// property declarations
export default class InvestmentCalculator extends LightningElement {
    initInv = 0;
    monDep = 0;
    anuInt = 0;
    years = 0;

// arrays to store results and a boolean set to false as default
    resultsWithoutDeposits = [];
    resultsWithDeposits = [];
    showResults = false;


// method handling for changes to input fields &
// data retrieval in context to which field is being updated &
// conversion of input values
    handleInputChange(event) {
        const field = event.target.dataset.id;
        if (field === 'initInv') {
            this.initInv = parseFloat(event.target.value);
        } else if (field === 'monDep') {
            this.monDep = parseFloat(event.target.value);
        } else if (field === 'anuInt') {
            this.anuInt = parseFloat(event.target.value);
        } else if (field === 'years') {
            this.years = parseInt(event.target.value);
        }
    }


// method trigger for when user clicks the Calculate button &
// calling of the apex class
    handleCalculate() {
        calculateInvestment({ initInv: this.initInv, monDep: this.monDep, anuInt: this.anuInt, years: this.years })
            .then(result => {
                this.resultsWithoutDeposits = result.withoutDeposits;
                this.resultsWithDeposits = result.withDeposits;
                this.showResults = true;
            })
            .catch(error => {
                console.error('Error in calculation:', error);
            });
    }
}
