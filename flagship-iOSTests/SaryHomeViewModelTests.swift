//
//  SaryHomeViewModelTests.swift
//  SaryHomeViewModelTests
//
//  Created by Mina on 11/02/2022.
//

import XCTest
@testable import flagship_iOS

class SaryHomeViewModelTests: XCTestCase {
    
    var sut: SaryHomeViewModel!
    let service = APIServiceStup()
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = SaryHomeViewModel(service: service)
    
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func testfetchBannersWhenStartServiceThenUpdateDataSource() {
        // when
        sut.attach()
        // then
        XCTAssertNotNil(sut.testBanners)
    }


}


