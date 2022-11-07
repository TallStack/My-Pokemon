//
//  My_PokemonTests.swift
//  My PokemonTests
//
//  Created by Keketso Ramosedi on 2022/11/04.
//  Copyright © 2022 TallStack Game Studios. All rights reserved.
//

import XCTest
@testable import My_Pokemon

final class My_PokemonTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
//        let num1 : Int32 = 14
//        let num2 : Int32 = 14
//        let result : Int32 = num1 + num2
//
//        XCTAssertEqual(result, 28)
        
        
    }
    
    func testUrlValid() throws {
        var canOpen : Bool
        canOpen = false
        if Constants.apiUrl == "https://pokeapi.co/api/v2/" {
                if let url = NSURL(string: Constants.apiUrl) {
                    canOpen = UIApplication.shared.canOpenURL(url as URL)
                }
            }
        
        XCTAssertTrue(canOpen)
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
