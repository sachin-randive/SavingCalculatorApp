//
//  SavingsCalculatorTests.swift
//  SavingsCalculatorTests
//
//  Created by Sachin Randive on 19/12/25.
//

import Testing
@testable import SavingsCalculator

struct SavingsCalculatorTests {
    
 @Test("Zero interest, zero contribution: total equals initial")
    
    func example() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
        let initialDeposite =  SavingsCalxModel.defaultConfiguration.initialDeposit
        
        let model =  SavingsCalxModel(
            initialDeposit: initialDeposite,
            monthlyContribution: 0,
            annualInterestRate: 0,
            timePeriodInMonths: 24
        )
        
        let result = model.calculateSavings()
        #expect(result.initialDeposit == initialDeposite)
        #expect(result.totalContributions == 0)
        #expect(result.interestEarned == 0)
        #expect(result.totalSaved == initialDeposite)
        #expect(result.numberOfYears == 2)
    }

    @Test("Zero interest, with contribution: total equals initial")
       func zeroInterestwithContribution() async throws {
           // Write your test here and use APIs like `#expect(...)` to check expected conditions.
           let initialDeposite =  SavingsCalxModel.defaultConfiguration.initialDeposit
           let MonthlyContributions =  SavingsCalxModel.defaultConfiguration.monthlyContribution
           let numMonths =  SavingsCalxModel.defaultConfiguration.timePeriodInMonths
           let expectedTotalContributions =  MonthlyContributions * Double(numMonths)
           
           let model =  SavingsCalxModel(
               initialDeposit: initialDeposite,
               monthlyContribution: MonthlyContributions,
               annualInterestRate: 0,
               timePeriodInMonths: numMonths
           )
           
           let result = model.calculateSavings()
           #expect(result.initialDeposit == initialDeposite)
           #expect(result.totalContributions == expectedTotalContributions)
           #expect(result.interestEarned == 0)
           #expect(result.totalSaved == initialDeposite + expectedTotalContributions)
           #expect(result.numberOfYears == numMonths/12)
       }
}
