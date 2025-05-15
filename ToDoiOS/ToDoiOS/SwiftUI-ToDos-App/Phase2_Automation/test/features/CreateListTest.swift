//
//  Create.swift
//  ToDos
//
//  Created by Miguel Velasquez on 1/05/25.
//
import XCTest

class CreateListTest: XCTestCase {

    var app: XCUIApplication!
    var homeView: HomeView!
    var addSegmentView: AddSegmentView!
    var remindersView: RemindersView!

    private let listName = "New Todo List"
    private let remindersList: [String] = [
        "First Reminder",
        "Second Reminder",
        "Third Reminder"
    ]

    override func setUpWithError() throws {
        app = XCUIApplication()
        app.launch()
        homeView = ToDoListPage(app: app)
        addSegmentView = AddTaskPage(app: app)
        remindersView = RemindersView(app: app)
    }
    
    func testCreateNewToDoList() {
        homeView.validateTitleReminders()
        homeView.validateNoReminders()
        homeView.tapAddRemindersButton()
        addSegmentView.validateSegmentTitle()
        addSegmentView.typeTextIntoNameField(listName)
        addSegmentView.tapBackToReminders()
        homeView.validateRemainderList(listName)
        homeView.validateMyList(listName)
    }

    func testAddNewReminderToList() {
        homeView.validateRemainderList(listName)
        homeView.tapRemainderListName(listName)
        remidersView.tapAddNewReminder()
        remindersView.createNewReminder()
        for reminder in remindersList {
            remindersView.createNewReminder(reminder)
        }
    }

    func testCompleteReminders() {
        homeView.validateRemainderList(listName)
        homeView.tapRemainderListName(listName)
        for (index, reminder) in remindersList.enumerated() {
            remindersView.tapCompleteButton(index)
        }
    }
    
}
