//
//  SavingsCalxModel.swift
//  SavingsCalculator
//
//  Created by Sachin Randive on 19/12/25.
//

import Foundation

struct SavingsCalxModel: Hashable {
    var initialDeposit: Double
    var monthlyContribution: Double
    var annualInterestRate: Double
    var timePeriodInMonths: Int
    
    func calculateSavings() -> SavingsResult {
        let monthlyRate = annualInterestRate / 12
        var totalSavings = initialDeposit
        let totalContributions = monthlyContribution * Double(timePeriodInMonths)
        
        for _ in 1 ... timePeriodInMonths {
            totalSavings += monthlyContribution
            totalSavings += totalSavings * monthlyRate
        }
        
        let interestEarned = totalSavings - totalContributions - initialDeposit
        
        return SavingsResult(
            initialDeposit: initialDeposit,
            totalContributions: totalContributions,
            interestEarned: interestEarned,
            totalSaved: totalSavings,
            numberOfYears: timePeriodInMonths / 12
        )
    }
    
    static var defaultConfiguration: SavingsCalxModel {
        .init(
            initialDeposit: 10_000,
            monthlyContribution: 200,
            annualInterestRate: 3.7,
            timePeriodInMonths: 120
        )
    }
}
