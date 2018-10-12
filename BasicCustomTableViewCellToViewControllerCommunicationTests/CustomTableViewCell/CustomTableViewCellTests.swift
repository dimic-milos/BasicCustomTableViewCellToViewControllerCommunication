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
        let nib = bundle.loadNibNamed("CustomTableViewCell", owner: nil, options: nil)
        guard let customTableViewCell = nib?.first as? CustomTableViewCell else { XCTFail() ; return }
        sut = customTableViewCell
    }
    
    override func tearDown() {
        super.tearDown()
        
        sut = nil
    }
    
    func test_SutIsNotNil() {
        XCTAssertNotNil(sut)
    }
    
    func test_ButtonMainIsNotNil() {
        XCTAssertNotNil(sut.buttonMain)
    }
    
    func test_ImageViewMainIsNotNil() {
        XCTAssertNotNil(sut.imageViewMain)
    }
    
    func test_ButtonMainTapped_WhenTapped_CallsDidTapButtonMain() {
        let mockCustomTableViewCellDelegate = MockCustomTableViewCellDelegate()
        sut.delegate = mockCustomTableViewCellDelegate
        sut.buttonMainTapped(UIButton())
        XCTAssertTrue(mockCustomTableViewCellDelegate.didTapButtonMainGotCalled)
    }
    
    func test_ImageViewActionTapped_WhenTapped_CallsDidTapImageViewMain() {
        let mockCustomTableViewCellDelegate = MockCustomTableViewCellDelegate()
        sut.delegate = mockCustomTableViewCellDelegate
        (sut.imageViewMain.gestureRecognizers)?.first?.execute()
        XCTAssertTrue(mockCustomTableViewCellDelegate.didTapimageViewMainGotCalled)
    }
    
    func test_ImageViewMain_HasOneGestureRecognizer() {
        let expected = 1
        XCTAssertEqual(expected, sut.imageViewMain.gestureRecognizers?.count)
    }
    
    func test_ViewGestureRecognizerHasProperActionAssigned() {
        let expectedSelector = NSSelectorFromString("imageViewActionTapped:")
        XCTAssertEqual((sut.imageViewMain.gestureRecognizers)?.first?.getTargetInfo().first?.action, expectedSelector)
    }
}





class MockCustomTableViewCellDelegate: CustomTableViewCellDelegate {
   
    var didTapButtonMainGotCalled = false
    var didTapimageViewMainGotCalled = false
    
    func didTapButtonMain(inCell cell: CustomTableViewCell) {
        didTapButtonMainGotCalled = true
    }
    
    func didTapimageViewMain(inCell cell: CustomTableViewCell) {
        didTapimageViewMainGotCalled = true
    }
    
    
}

