//
//  DetailViewControllerTests.swift
//  TMDBViewer
//
//  Created by Gabriel Targon on 26/04/23.
//

@testable import TMDBViewer
import XCTest

class DetailViewControllerTests: XCTestCase {
    
    // MARK: Subject under test
    var sut: DetailViewController!
    
    // MARK: Doubles
    private var interactorSpy: DetailInteractorSpy!
    private var routerSpy: DetailRouterSpy!
    
    // MARK: Test lifecycle
    override func setUp() {
        super.setUp()
        setupDetailViewController()
    }
    
    override func tearDown() {
        sut = nil
        interactorSpy = nil
        routerSpy = nil
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupDetailViewController() {
        sut = DetailViewController()
        interactorSpy = DetailInteractorSpy()
        routerSpy = DetailRouterSpy()
        
        sut.interactor = interactorSpy
        sut.router = routerSpy
    }
    
    // MARK: Tests
    
    func test_viewDidLoad() {
        sut.viewDidLoad()
        
        XCTAssertTrue(sut.view is DetailView)
    }
    
    func test_requestMovie() {
        sut.requestMovie()
        
        XCTAssertNotNil(routerSpy.dataStore?.id)
        XCTAssertTrue(interactorSpy.requestMovieCalled)
    }
    
    func test_displayError() {
        sut.displayError(description: "test")
        
        XCTAssertTrue(routerSpy.routeToErrorCalled)
    }
}
