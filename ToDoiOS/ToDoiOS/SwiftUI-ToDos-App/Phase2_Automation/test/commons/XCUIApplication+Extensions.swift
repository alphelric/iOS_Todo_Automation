//
//  XCUIApplication+Extensions.swift
//  ToDos
//
//  Created by Miguel Velasquez on 1/05/25.
//
import XCTest

extension XCUIApplication {

    func waitForElementToAppear(_ element: XCUIElement, timeout: TimeInterval = 5) -> Bool {
        let existsPredicate = NSPredicate(format: "exists == true")
        let expectation = XCTNSPredicateExpectation(predicate: existsPredicate, object: element)
        let result = XCTWaiter().wait(for: [expectation], timeout: timeout)
        return result == .completed
    }

    func nsPredicateForLabel (_ label: String) -> NSPredicate {
        return NSPredicate(format: "label CONTAINS %@", label)
    }

    func nsPredicateForValue (_ value: String) -> NSPredicate {
        return NSPredicate(format: "value CONTAINS %@", value)
    }

    func nsPredicateForIdentifier (_ identifier: String) -> NSPredicate {
        return NSPredicate(format: "identifier CONTAINS %@", identifier)
    }

}
