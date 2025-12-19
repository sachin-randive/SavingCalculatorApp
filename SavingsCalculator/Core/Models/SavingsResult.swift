//
//  SavingsResult.swift
//  SavingsCalculator
//
//  Created by Sachin Randive on 19/12/25.
//

import Foundation

struct SavingsResult: Hashable {
    let initialDeposit: Double
    let totalContributions: Double
    let interestEarned: Double
    let totalSaved: Double
    let numberOfYears: Int
}
