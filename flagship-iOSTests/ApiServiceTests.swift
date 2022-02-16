//
//  ApiServiceTests.swift
//  flagship-iOSTests
//
//  Created by Mina on 16/02/2022.
//

import XCTest
@testable import flagship_iOS

class ApiServiceTests: XCTestCase {
    
    var sut: APIServiceStup!
    
    var bannerResponse: BannerResponse!
    var basketResponse: BasketResponse!
    
    var testBanners: [Banner]!
    var testBasket: [Basket]!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        bannerResponse = try constructModelFromJSONFile(named: "Banner")
        basketResponse = try constructModelFromJSONFile(named: "Basket")
        sut = APIServiceStup()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
 
    func testHomeServiceAfterLoadDataThenValidateResponse() {
        // when
        sut.homeService { [weak self] banners, basket, error in
            self?.testBanners = banners
            self?.testBasket = basket
        }
        // then
        XCTAssertNotNil(testBanners)
        XCTAssertNotNil(testBasket)
        XCTAssertEqual(bannerResponse.result, testBanners)
    }
    
   
    
}

