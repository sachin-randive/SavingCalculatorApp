//
//  SavingsCalculatorUITests.swift
//  SavingsCalculatorUITests
//
//  Created by Sachin Randive on 19/12/25.
//
import Foundation
import XCTest

final class SavingsCalculatorUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {

    }

    @MainActor
    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        XCTAssertTrue(app.navigationBars["Savings Calculator"].waitForExistence(timeout: 3))
        
        let initialDeposite = 10_000.0
        let MonthlyContribution = 200.00
        let annualRate = 0.037
        let months = 10*12
        
        let monthlyRate = annualRate / 12.0
        
        XCTAssertTrue(app.textFields[initialDeposite.formattedAsCurrency()].exists)
        XCTAssertTrue(app.textFields[MonthlyContribution.formattedAsCurrency()].exists)
        XCTAssertTrue(app.textFields[String(months / 12)].exists)
        
        app.buttons["Calculate"].tap()
        let resultsNav = app.navigationBars["Results"]
        XCTAssertTrue(resultsNav.waitForExistence(timeout: 3))
        
        XCTAssertTrue(app.staticTexts["Initial Deposit"].exists)
        XCTAssertTrue(app.staticTexts["Contributions"].exists)
        XCTAssertTrue(app.staticTexts["Interest Earned"].exists)
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
}

extension Double {
    func formattedAsCurrency() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = .current
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 0
        return formatter.string(from: NSNumber(value: self)) ?? "\(self)"
    }
}
