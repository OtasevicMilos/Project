//
//  ProjectTests.swift
//  ProjectTests
//
//  Created by Milos Otasevic on 29/07/2020.
//  Copyright © 2020 Milos Otasevic. All rights reserved.
//

import XCTest
@testable import Project

class ProjectTests: XCTestCase {
    
    func testDateForExtension(){
        let dateSample = "2020-07-29T13:08:43.000000Z"
        XCTAssertEqual("29/07/2020", dateSample.formatDate(time: false))
    }
}
