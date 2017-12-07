//
//  MovieModelTest.swift
//  PremierSwiftTests
//
//  Created by Deja Cespedes on 07/12/2017.
//  Copyright © 2017 Deliveroo. All rights reserved.
//

import XCTest
@testable import PremierSwift

class MovieModelTest: XCTestCase {
    //MARK: - Properties
    public var movie: Movie?

    //MARK: - Set up
    override func setUp() {
        super.setUp()
        testCreationOfMovie()
    }
    
    //MARK: - Tear down
    override func tearDown() {
        super.tearDown()
        movie = nil
    }
    
    //MARK: - Test Creation of Movie
    func testCreationOfMovie() {
        let movie = Movie(title: "The Dark Knight", overview: "This is a great movie, I really enjoyed this film. The best in the Batman trilogy", posterPathEndpoint: "\testEndpoint\0")
        XCTAssertTrue(movie.title != "")
    }
}
