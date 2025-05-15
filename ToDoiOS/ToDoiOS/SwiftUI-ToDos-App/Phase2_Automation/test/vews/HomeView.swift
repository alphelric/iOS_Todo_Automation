//
//  HomeView.swift
//  ToDos
//
//  Created by Miguel Velasquez on 1/05/25.
//
import XCTest

class HomeView: BaseView {
    
    private let PLUS_ICON = "Add Section"
    private let TITLE_REMINDERS = "Reminders"
    private let MY_LISTS_TILTE = "MY LISTS"
    private let NO_REMINDERS_TEXT = "No Reminders"
    private let INVITATONAL_TEXT = "Start addig reminders to see your list."
    private let ADD_REMINDER_BUTTON = "Add Reminder"

    func tapPlusIcon() {
        let plusIconButton: XCUIElement = app.buttons.matching(nsPredicateForLabel(PLUS_ICON)).firstMatch
        if(waitForElementToAppear(plusIconButton)) {
            plusIconButton.tap()
        } else {
            XCTFail("Element: \(PLUS_ICON) not found or is not hittable")
        }
    }

    func validateTitleReminders() {
        let titleReminders: XCUIElement = app.otherElements.matching(nsPredicateForLabel(TITLE_REMINDERS)).firstMatch
        if(waitForElementToAppear(titleReminders)) {
            XCTAssertEqual(titleReminders.label, TITLE_REMINDERS, "\(titleReminders.label) didn't match with \(TITLE_REMINDERS)")
        } else {
            XCTFail("Element: \(TITLE_REMINDERS) not found")
        }
    }

    func validateTitleMyLists() {
        let titleMyLists: XCUIElement = app.staticTexts.matching(nsPredicateForLabel(MY_LISTS_TILTE)).firstMatch
        if(waitForElementToAppear(titleMyLists)) {
            XCTAssertEqual(titleMyLists.label, MY_LISTS_TILTE, "\(titleMyLists.label) didn't match with \(MY_LISTS_TILTE)")
        } else {
            XCTFail("Element: \(MY_LISTS_TILTE) not found")
        }
    }

    func validateNoReminders() {
        let noReminders: XCUIElement = app.staticTexts.matching(nsPredicateForLabel(NO_REMINDERS_TEXT)).firstMatch
        if(waitForElementToAppear(noReminders)) {
            XCTAssertEqual(noReminders.label, NO_REMINDERS_TEXT, "\(noReminders.label) didn't match with \(NO_REMINDERS_TEXT)")
        } else {
            XCTFail("Element: \(NO_REMINDERS_TEXT) not found")
        }
    }

    func validateInvitationalText() {
        let invitationalText: XCUIElement = app.staticTexts.matching(nsPredicateForLabel(INVITATONAL_TEXT)).firstMatch
        if(waitForElementToAppear(invitationalText)) {
            XCTAssertEqual(invitationalText.label, INVITATONAL_TEXT, "\(invitationalText.label) didn't match with \(INVITATONAL_TEXT)")
        } else {
            XCTFail("Element: \(INVITATONAL_TEXT) not found")
        }
    }

    func tapAddRemindersButton() {
        let addReminders: XCUIElement = app.buttons.matching(nsPredicateForLabel(ADD_REMINDER_BUTTON)).firstMatch
        if(waitForElementToAppear(addReminders)) {
            addReminders.tap()
        } else {
            XCTFail("Element: \(ADD_REMINDER_BUTTON) not found or is not hittable")
        }
    }

    func validateRemainderList(_ remainderName: String) {
        let remainderList: XCUIElement = app.buttons.matching(nsPredicateForLabel(remainderName)).firstMatch
        XCTAssert(waitForElementToAppear(remainderList), "The \(remainderName) list is not on the Remainder list")
    }

    func validateMyList(_ remainderName: String) {
        let myList: XCUIElement = app.buttons.matching(nsPredicateForLabel(remainderName)).element(boundBy: 1)
        XCTAssert(waitForElementToAppear(myList), "The \(remainderName) list is not on the Remainder list")
    }

    func tapRemainderListName(_ remainderName: String) {
        let remainderList: XCUIElement = app.buttons.matching(nsPredicateForLabel(remainderName)).firstMatch
        if(waitForElementToAppear(remainderList)) {
            remainderList.tap()
        } else {
            XCTFail("Element: \(ADD_REMINDER_BUTTON) not found or is not hittable")
        }
    }

    func tapMyListsName(_ remainderName: String) {
        let myList: XCUIElement = app.buttons.matching(nsPredicateForLabel(remainderName)).element(boundBy: 1)
        if(waitForElementToAppear(myList)) {
            myList.tap()
        } else {
            XCTFail("Element: \(remainderName) not found or is not hittable")
        }
    }

}
