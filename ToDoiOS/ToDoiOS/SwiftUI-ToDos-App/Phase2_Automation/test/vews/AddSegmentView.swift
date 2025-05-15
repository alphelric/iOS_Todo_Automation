//
//  AddSegmentView.swift
//  ToDos
//
//  Created by Miguel Velasquez on 1/05/25.
//
import XCTest

class AddSegmentView: BaseView {

    private let BACK_REMINDER = "Reminders"
    private let ADD_SEGMENT_TITLE = "Add Segment"
    private let LIST_NAME_TEXT_FIELD = "Name"
    private let ICON_TITLE = "ICON"

    enum IconList: String {
        case HOME_ICON = "house"
        case HEART_ICON = "heart"
        case CALENDAR_ICON = "calendar"
        case FLAG_ICON = "flag.fill"
        case SUN_ICON = "sun.max.fill"
        case GRADUATION_ICON = "graduationcap"
        case EXCLAMATION_ICON = "exclamationmark.3"
    }
    
    func tapBackToReminders() {
        let backReminders: XCUIElement = app.buttons.matching(nsPredicateForLabel(BACK_REMINDER)).firstMatch
        if(waitForElementToAppear(backReminders)) {
            plusIconButton.tap()
        } else {
            XCTFail("Element: \(BACK_REMINDER) not found or is not hittable")
        }
    }

    func validateSegmentTitle() {
        let segmentTitle: XCUIElement = app.otherElements.matching(nsPredicateForLabel(ADD_SEGMENT_TITLE)).firstMatch
        if(waitForElementToAppear(segmentTitle)) {
            XCTAssertTrue(segmentTitle.label, ADD_SEGMENT_TITLE, "\(segmentTitle.label) didn't match with \(ADD_SEGMENT_TITLE)")
        } else {
            XCTFail("Element: \(ADD_SEGMENT_TITLE) not found")
        }
    }

    func typeTextIntoNameField(_ name: String? = nil) {
        let nameField: XCUIElement = app.otherElements.matching(nsPRedicateForValue(LIST_NAME_TEXT_FIELD)).firstMatch
        if(waitForElementToAppear(nameField) && name != nil) {
            if(name != nil) {
                nameField.tap()
                nameField.typeText(name)
                XCTAssertEqual(nameField.label, LIST_NAME_TEXT_FIELD, "\(nameField.label) didn't match with \(LIST_NAME_TEXT_FIELD)")
            } else {
                XCTFail("Please provide a name for the task!")
            }  
        } else {
            XCTFail("Element: \(LIST_NAME_TEXT_FIELD) not found")
        }
    }

    func validateIconTitle() {
        let iconTitle: XCUIElement = app.staticTexts.matching(nsPredicateForLabel(ICON_TITLE)).firstMatch
        if(waitForElementToAppear(iconTitle)) {
            XCTAssertEqual(iconTitle.label, ICON_TITLE, "\(iconTitle.label) didn't match with \(ICON_TITLE)")
        } else {
            XCTFail("Element: \(ICON_TITLE) not found")
        }
    }

    func tapIconForList(_ icon: [IconList]) {
        let iconButton: XCUIElement = app.buttons.matching(nsPredicateForIdentifier(icon)).firstMatch
        if(waitForElementToAppear(iconButton)) {
            iconButton.tap()
            XCTAssertTrue(iconButton.isSelected, "Element: \(icon) couldn't be selected")
        } else {
            XCTFail("Element: \(icon) not found or is not hittable")
        }
    }

}