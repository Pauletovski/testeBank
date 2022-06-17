//
//  loginTest.swift
//  testSantanderTests
//
//  Created by Paulo Lazarini on 16/06/22.
//

import XCTest
import Firebase
@testable import testSantander

class loginTest: XCTestCase {
    
    let validation = ValidationService()
    
    override func setUp() throws {
        super.setUp()
        validation
    }
    
    override func tearDown() throws {
        validation
        super.tearDown()
    }
}
