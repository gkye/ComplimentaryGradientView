//
//  ComplimentaryGradientViewTests.swift
//  ComplimentaryGradientViewTests
//
//  Created by George Kye on 2016-08-22.
//  Copyright © 2016 George Kye. All rights reserved.
//

import XCTest
@testable import ComplimentaryGradientView

class ComplimentaryGradientViewTests: XCTestCase {

  let compView = ComplimentaryGradientView()

  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  func testGradientType() {
    compView.gradientType = .primaryDetail
    
    XCTAssertTrue(compView.gradientType == .primaryDetail)
  }
  
  func testCustomStartPoint(){
    let startPoint = CGPoint(x: 0.2, y: 0.1)
    let endPoint = CGPoint(x: 0.1, y: 0.3)
    compView.customPoint = CustomPoints(startPoint, endPoint)
    
    XCTAssertEqual(compView.customPoint?.startPoint, Optional(startPoint))
    XCTAssertEqual(compView.customPoint?.endPoint, Optional(startPoint))
    
  }
  
  func testExample() {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
  }
  
  func testPerformanceExample() {
    // This is an example of a performance test case.
    self.measure {
      // Put the code you want to measure the time of here.
    }
  }
  
}
