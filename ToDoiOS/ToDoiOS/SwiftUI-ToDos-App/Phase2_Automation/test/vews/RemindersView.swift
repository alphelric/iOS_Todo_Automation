//
//  HomeView.swift
//  ToDos
//
//  Created by Miguel Velasquez on 1/05/25.
//
import XCTest

class RemindersView: BaseView {

    private let BACK_REMINDER = "Reminders"
    private let NEW_REMINDER = "New Reminder"

    func tapBackToReminders() {
        let backReminders: XCUIElement = app.buttons.matching(nsPredicateForLabel(BACK_REMINDER)).firstMatch
        if(waitForElementToAppear(backReminders)) {
            plusIconButton.tap()
        } else {
            XCTFail("Element: \(BACK_REMINDER) not found or is not hittable")
        }
    }

    func tapAddNewReminder() {
        let newReminder: XCUIElement = app.buttons.matching(nsPredicateForLabel(NEW_REMINDER)).firstMatch
        if(waitForElementToAppear(newReminder)) {
            newReminder.tap()
        } else {
            XCTFail("Element: \(NEW_REMINDER) not found or is not hittable")
        }
    }

    func createNewReminder(_ reminderName: String, _ remainderIndex: Int) {
        let remainderNameField: XCUIElement = app.textFields.element(boundBy: remainderIndex - 1)
        if(waitForElementToAppear(remainderNameField)) {
            remainderNameField.tap()
            remainderNameField.typeText(remainderName)
            XCTAssertEqual(remainderNameField.label, remainderName, "\(remainderNameField.label) didn't match with \(remainderName)")
        } else {
            XCTFail("Element: Name Field for index \(remainderIndex) not found or is not hittable")
        }
    }

    func tapCompleteButton(_ remainderIndex: Int) {
        let completeTaskButton: XCUIElement = app.buttons.element(boundBy: remainderIndex + 1)
        if(waitForElementToAppear(completeTaskButton)) {
            completeTaskButton.tap()
            XCTAssertTrue(completeTaskButton.isSelected, "Element: Complete task for index \(remainderIndex) couldn't be selected")
        } else {
            XCTFail("Element: Name Field for index \(remainderIndex) not found or is not hittable")
        }
    }

}
