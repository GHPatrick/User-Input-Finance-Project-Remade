# Investment Calculator

This is an **Investment Calculator** built using **Salesforce Lightning Web Components (LWC)** and **Apex**. The app allows users to input an initial investment amount, monthly deposits, annual interest rate, and the number of years. It calculates the growth of the investment under two scenarios:

1. Without Monthly Deposits
2. With Monthly Deposits

The results are displayed in a table showing the balance and interest earned at the end of each year.

This is a remake of an academic project from college made originally in C++, you can find the original project [here.](https://github.com/GHPatrick/User-Input-Finance-Project)

## Features

- **Initial Investment Amount**: The starting amount for the investment.
- **Monthly Deposit**: Optional monthly contribution to the investment.
- **Annual Interest Rate**: The interest rate applied to the investment annually.
- **Number of Years**: The number of years the investment will grow.

The app computes the balance and interest earned on a yearly basis, both with and without monthly deposits.

## Components

### 1. **Apex Controller - `InvestmentCalculatorController.cls`**
This Apex class contains the logic to perform the calculations. It has a method `calculateInvestment` that accepts:
- Initial investment (`initInv`)
- Monthly deposit (`monDep`)
- Annual interest rate (`anuInt`)
- Number of years (`years`)

The method returns a map containing the calculated results for each year, both with and without monthly deposits.

### 2. **Lightning Web Component - `investmentCalculator.html`**
The HTML file creates a user-friendly interface with input fields for:
- Initial investment
- Monthly deposit
- Annual interest rate
- Number of years

It also includes a button to trigger the calculation and display the results in a table format.

### 3. **Lightning Web Component - `investmentCalculator.js`**
This JavaScript file handles the user inputs, triggers the Apex method when the "Calculate" button is pressed, and processes the results to display them in the UI.

## Installation

1. **Deploy the Apex Class**:
   - Deploy `InvestmentCalculatorController.cls` to your Salesforce org.

2. **Create the Lightning Web Component**:
   - Deploy the `investmentCalculator.html` and `investmentCalculator.js` files.

3. **Add the Component to a Page**:
   - Drag and drop the component onto a Lightning page.

## How to Use

1. Enter the required values (Initial Investment, Monthly Deposit, Annual Interest Rate, Number of Years) into the input fields.
2. Click the **Calculate** button to see the results.
3. View the investment growth with and without monthly deposits in the result tables.

## Video Demonstration
https://github.com/user-attachments/assets/1731d9d6-754a-4b8c-a5f4-e2ba8598e474
