//
//  String.swift
//  SavingsCalculator
//
//  Created by Sachin Randive on 19/12/25.
//

import Foundation

extension String {
    func asDouble() -> Double {
        let digitsOnly = self.replacingOccurrences(
            of: "[^0-9.]",
            with: "",
            options: .regularExpression
        )
        
        return Double(digitsOnly) ?? 0
    }
}
