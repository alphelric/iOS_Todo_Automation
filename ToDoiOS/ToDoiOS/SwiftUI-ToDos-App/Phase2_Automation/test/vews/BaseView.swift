//
//  BaseView.swift
//  ToDos
//
//  Created by Miguel Velasquez on 1/05/25.
//
import XCTest

class BaseView {

    var app: XCUIApplication!

    init(_ app: XCUIApplication? = nil) {
        self.app = app ?? XCUIApplication()
    }

}
