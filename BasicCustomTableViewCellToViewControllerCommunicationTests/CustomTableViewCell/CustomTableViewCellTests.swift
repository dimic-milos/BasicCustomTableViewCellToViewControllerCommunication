//
//  CustomTableViewCellTests.swift
//  BasicCustomTableViewCellToViewControllerCommunicationTests
//
//  Created by Milos Dimic on 10/10/18.
//  Copyright © 2018 Milos Dimic. All rights reserved.
//

import XCTest
@testable import BasicCustomTableViewCellToViewControllerCommunication

class CustomTableViewCellTests: XCTestCase {

    var sut: CustomTableViewCell!
    
    override func setUp() {
        super.setUp()
        
        let bundle = Bundle.init(for: CustomTableViewCell.self)
        let nibs = bundle.loadNibNamed("CustomTableViewCell", owner: nil, options: nil)
        sut = nibs?.first as? CustomTableViewCell
    }
    
    override func tearDown() {
        super.tearDown()
        
        sut = nil
    }
    
    func test_SutIsNotNil() {
        XCTAssertNotNil(sut)
    }

}
