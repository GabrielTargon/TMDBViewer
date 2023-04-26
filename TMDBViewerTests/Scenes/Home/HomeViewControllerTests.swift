//
//  HomeViewControllerTests.swift
//  TMDBViewer
//
//  Created by Gabriel Targon on 25/03/23.

@testable import TMDBViewer
import XCTest

class HomeViewControllerTests: XCTestCase {
    
    // MARK: Subject under test
    var sut: HomeViewController!
    
    // MARK: Doubles
    private var interactorSpy: HomeInteractorSpy!
    private var routerSpy: HomeRouterSpy!
    
    // MARK: Test lifecycle
    override func setUp() {
        super.setUp()
        setupHomeViewController()
    }
    
    override func tearDown() {
        sut = nil
        interactorSpy = nil
        routerSpy = nil
        super.tearDown()
    }
    
    // MARK: Test setup
    func setupHomeViewController() {
        sut = HomeViewController()
        interactorSpy = HomeInteractorSpy()
        routerSpy = HomeRouterSpy()
        
        sut.interactor = interactorSpy
        sut.router = routerSpy
    }
    
    // MARK: Tests
    func test_viewDidLoad() {
        sut.viewDidLoad()
        
        XCTAssertTrue(sut.view is HomeView)
        XCTAssertTrue(interactorSpy.requestMoviesListCalled)
    }
    
    func test_viewWillAppear() {
        sut.viewWillAppear(true)
        
        XCTAssertFalse(((sut.navigationController?.navigationBar.isTranslucent) != nil))
    }
    
    func test_displayError() {
        sut.displayError(description: "Test")

        XCTAssertTrue(routerSpy.routeToErrorCalled)
    }
}
