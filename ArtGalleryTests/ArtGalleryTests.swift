//
//  ArtGalleryTests.swift
//  ArtGalleryTests
//
//  Created by Andreea Lavinia Ionescu on 15/01/2020.
//  Copyright © 2020 Orange Labs Romania. All rights reserved.
//

import XCTest
@testable import ArtGallery

class ArtGalleryTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testCountGalleries() {
        let model = GalleryViewModel()
        XCTAssert(model.levelsList.count == 0, "Lista nu a putut fi descarcata")

        XCTAssertNotNil(model, "Nu e nil")
        let expectation = XCTestExpectation(description: "Download apple.com home page")

        model.getDataFromAPI { (success) in
            XCTAssert(success == true, "Lista nu a putut fi descarcata")
            XCTAssert(model.levelsList.count == 3, "Lista nu a putut fi descarcata")
            XCTAssertNotEqual(model.levelsList.count, 2)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 30.0)

    }
    
    func testDownloadWebData()  {
        // Create an expectation for a background download task.
        let expectation = XCTestExpectation(description: "Download apple.com home page")
       // Create a URL for a web page to be downloaded.
        let url = URL(string: "https://apple.com")!
       // Create a background task to download the web page.
        let dataTask = URLSession.shared.dataTask(with: url) { (data, _, _) in
           // Make sure we downloaded some data.
            XCTAssertNotNil(data, "No data was downloaded.")
            
            // Fulfill the expectation to indicate that the background task has finished successfully.
            expectation.fulfill()
        }
        // Start the download task.
        dataTask.resume()
        
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
