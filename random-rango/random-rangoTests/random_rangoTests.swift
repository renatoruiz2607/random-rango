//
//  random_rangoTests.swift
//  random-rangoTests
//
//  Created by Renato on 17/10/21.
//

import XCTest
@testable import random_rango

class random_rangoTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testTextFields_dadoQueRegexEhChamado_quandoReceberEmailESenha_entaoDeveRetornarTrue() throws {
        XCTAssertTrue(true)
        var valid = false
        let viewModel = LoginViewModel(profile: [])
        let email = "email@email.com"
        let password = "password"
        if viewModel.validateEmail(text: email) && viewModel.validatePassword(text: password) {
            valid = true
        } else {
            valid = false
        }
        
        XCTAssertTrue(valid)
        
    }

}
