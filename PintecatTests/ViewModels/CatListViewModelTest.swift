//
//  CatListViewModelTest.swift
//  PintecatTests
//
//  Created by John Lenon Souza dos Reis on 24/07/20.
//  Copyright © 2020 John Lenon Souza dos Reis. All rights reserved.
//

import XCTest
import Cuckoo
import Alamofire
import AlamofireImage

class CatListViewModelTest: XCTestCase {

    var networkService: MockNetworkServiceProtocol!
    var imageService: MockImageServiceProtocol!
    
    override func setUp() {
        self.networkService = MockNetworkServiceProtocol()
        self.imageService = MockImageServiceProtocol()
    }
    
    func testShouldReturnCatCount() {
        // given
        let viewModel = CatListViewModel()
        viewModel.cats.accept([
            Cat(id: "1", title: "Cat title", link: "Link"),
            Cat(id: "2", title: "Cat2 title", link: "Link2")
        ])
        
        // when
        let count = viewModel.catCount()
        
        //then
        XCTAssertEqual(2, count)
    }
    
    func testShouldReturnSizeOfScreenDividedBy3MinusInsetWhenNoCoverWidthAndHeightAndNot13Item() {
        // given
        let viewModel = CatListViewModel()
        viewModel.cats.accept([
            Cat(id: "1", title: "Cat title", link: "Link"),
            Cat(id: "2", title: "Cat title", link: "Link")
        ])
        
        // when
        let size = viewModel.sizeForItemAt(IndexPath(row: 1, section: 0), maxWidth: CGFloat(300))
        
        // then
        XCTAssertEqual(90, size.height)
        XCTAssertEqual(90, size.width)
    }
    
    func testShouldReturnSameSizesIs13ItemAndNoCoverWidthAndHeight() {
        // given
        let viewModel = CatListViewModel()
        viewModel.cats.accept([
            Cat(id: "0", title: "Cat title", link: "Link"),
            Cat(id: "1", title: "Cat title", link: "Link"),
            Cat(id: "2", title: "Cat title", link: "Link"),
            Cat(id: "3", title: "Cat title", link: "Link"),
            Cat(id: "4", title: "Cat title", link: "Link"),
            Cat(id: "5", title: "Cat title", link: "Link"),
            Cat(id: "6", title: "Cat title", link: "Link"),
            Cat(id: "7", title: "Cat title", link: "Link"),
            Cat(id: "8", title: "Cat title", link: "Link"),
            Cat(id: "9", title: "Cat title", link: "Link"),
            Cat(id: "10", title: "Cat title", link: "Link"),
            Cat(id: "11", title: "Cat title", link: "Link"),
            Cat(id: "12", title: "Cat title", link: "Link"),
            Cat(id: "13", title: "Cat title", link: "Link"),
        ])
        
        // when
        let size = viewModel.sizeForItemAt(IndexPath(row: 13, section: 0), maxWidth: CGFloat(300))
        
        // then
        XCTAssertEqual(300, size.height)
        XCTAssertEqual(300, size.width)
    }
    
    func testShouldReturnSizeIs13ItemAndHasCoverWidthAndHeight() {
        // given
        let viewModel = CatListViewModel()
        viewModel.cats.accept([
            Cat(id: "0", title: "Cat title", link: "Link"),
            Cat(id: "1", title: "Cat title", link: "Link"),
            Cat(id: "2", title: "Cat title", link: "Link"),
            Cat(id: "3", title: "Cat title", link: "Link"),
            Cat(id: "4", title: "Cat title", link: "Link"),
            Cat(id: "5", title: "Cat title", link: "Link"),
            Cat(id: "6", title: "Cat title", link: "Link"),
            Cat(id: "7", title: "Cat title", link: "Link"),
            Cat(id: "8", title: "Cat title", link: "Link"),
            Cat(id: "9", title: "Cat title", link: "Link"),
            Cat(id: "10", title: "Cat title", link: "Link"),
            Cat(id: "11", title: "Cat title", link: "Link"),
            Cat(id: "12", title: "Cat title", link: "Link"),
            Cat(id: "13", title: "Cat title", coverWidth: 100, coverHeight: 90, link: "Link"),
        ])
        
        // when
        let size = viewModel.sizeForItemAt(IndexPath(row: 13, section: 0), maxWidth: CGFloat(300))
        
        // then
        XCTAssertEqual(270, size.height)
        XCTAssertEqual(300, size.width)
    }
    
    func testShouldReturnNilPictureWhenNoCatInIndexPath() {
        // given
        let viewModel = CatListViewModel()
        
        // when
        let picture = viewModel.picture(at: IndexPath(row: 0, section: 0))
        
        // then
        XCTAssertNil(picture)
    }
    
    func testShouldNotFetchPictureWhenNoCatInIndexPath() {
        // given
        let viewModel = CatListViewModel(networkService: self.networkService, imageService: self.imageService)
        
        // when
        viewModel.fetchPicture(to: IndexPath(row: 0, section: 0), completion: {})
        
        // then
        verify(self.imageService, times(0)).downloadImage(from: any(), completion: any())
    }
    
    func testShouldFetchPicture() {
        // given
        let cat = Cat(id: "1", title: "Cat title", link: "Link")
        let expectedPicture = UIImage()
        stub(self.imageService) { stub in
            when(stub.downloadImage(from: any(), completion: any())).then { string, completion in
                let response = AFDataResponse<Image>(request: nil, response: nil, data: nil, metrics: nil, serializationDuration: 0, result: Result<Image, AFError>.success(expectedPicture))
                completion(response)
            }
        }
        let viewModel = CatListViewModel(networkService: self.networkService, imageService: self.imageService)
        viewModel.cats.accept([cat])
        
        // when
        let expectation = XCTestExpectation(description: "Fetch picture")
        viewModel.fetchPicture(to: IndexPath(row: 0, section: 0)) {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
        let picture = viewModel.picture(at: IndexPath(row: 0, section: 0))
        
        // then
        XCTAssertNotNil(picture)
        XCTAssertEqual(expectedPicture, picture)
    }
    
    func testShouldReturnPictureByMenuConfiguration() {
        // given
        let indexPath = IndexPath(row: 0, section: 0)
        let cat = Cat(id: "12345", title: "Cat title", link: "Link")
        let menuConfiguration = UIContextMenuConfiguration(identifier: cat.menuID, previewProvider: nil)
        let expectedPicture = UIImage()
        stub(self.imageService) { stub in
            when(stub.downloadImage(from: any(), completion: any())).then { string, completion in
                let response = AFDataResponse<Image>(request: nil, response: nil, data: nil, metrics: nil, serializationDuration: 0, result: Result<Image, AFError>.success(expectedPicture))
                completion(response)
            }
        }
        let viewModel = CatListViewModel(networkService: self.networkService, imageService: self.imageService)
        viewModel.cats.accept([cat])
        
        // when
        let expectation = XCTestExpectation(description: "Fetch picture")
        viewModel.fetchPicture(to: indexPath) {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
        let picture = viewModel.picture(by: menuConfiguration)
        
        // then
        XCTAssertNotNil(picture)
        XCTAssertEqual(expectedPicture, picture)
    }
    
    func testShouldFetchCats() {
        // given
        let expectedCats = [
            Cat(id: "1", title: "Cat title", link: "Link"),
            Cat(id: "2", title: "Cat title", link: "Link")
        ]
        stub(self.networkService) { stub in
            when(stub.fetchCats(page: any(), completion: any())).then { string, completion in
                let catResult = CatResult(data: expectedCats, success: true, status: 200)
                let response = AFDataResponse<CatResult>(request: nil, response: nil, data: nil, metrics: nil, serializationDuration: 0, result: Result<CatResult, AFError>.success(catResult))
                completion(response)
            }
        }
        let viewModel = CatListViewModel(networkService: self.networkService, imageService: self.imageService)
        
        // when
        viewModel.fetchCats()
        
        // then
        XCTAssertEqual(2, viewModel.catCount())
        XCTAssertNil(viewModel.error.value)
        XCTAssertEqual("1", viewModel.cats.value[0].id)
        XCTAssertEqual("2", viewModel.cats.value[1].id)
    }
    
    func testShouldRefreshCats() {
        // given
        let expectedCats = [
            Cat(id: "1", title: "Cat title", link: "Link")
        ]
        stub(self.networkService) { stub in
            when(stub.fetchCats(page: any(), completion: any())).then { string, completion in
                let catResult = CatResult(data: expectedCats, success: true, status: 200)
                let response = AFDataResponse<CatResult>(request: nil, response: nil, data: nil, metrics: nil, serializationDuration: 0, result: Result<CatResult, AFError>.success(catResult))
                completion(response)
            }
        }
        let viewModel = CatListViewModel(networkService: self.networkService, imageService: self.imageService)
        
        // when
        viewModel.fetchCats()
        
        // then
        XCTAssertEqual(1, viewModel.catCount())
        XCTAssertNil(viewModel.error.value)
        XCTAssertEqual("1", viewModel.cats.value[0].id)
        
        // given
        reset(self.networkService)
        stub(self.networkService) { stub in
            when(stub.fetchCats(page: any(), completion: any())).then { string, completion in
                let catResult = CatResult(data: [], success: true, status: 200)
                let response = AFDataResponse<CatResult>(request: nil, response: nil, data: nil, metrics: nil, serializationDuration: 0, result: Result<CatResult, AFError>.success(catResult))
                completion(response)
            }
        }
        viewModel.setNetworkService(self.networkService)
        
        // when
        viewModel.refreshCats()
        
        //then
        XCTAssertEqual(0, viewModel.catCount())
        XCTAssertNil(viewModel.error.value)
    }
    
    func testShouldSetErrorWhenOccurWhileFetchingCats() {
        // given
        stub(self.networkService) { stub in
            when(stub.fetchCats(page: any(), completion: any())).then { string, completion in
                let error: AFError = .invalidURL(url: "invalid url")
                let response = AFDataResponse<CatResult>(request: nil, response: nil, data: nil, metrics: nil, serializationDuration: 0, result: Result<CatResult, AFError>.failure(error))
                completion(response)
            }
        }
        let viewModel = CatListViewModel(networkService: self.networkService, imageService: self.imageService)
        
        // when
        viewModel.fetchCats()
        
        // then
        XCTAssertEqual(0, viewModel.catCount())
        XCTAssertNotNil(viewModel.error.value)
        XCTAssertEqual("URL is not valid: invalid url", viewModel.error.value?.localizedDescription)
    }
    
    func testShouldFetchMoreWhenReachIndexPath() {
        //given
        stub(self.networkService) { stub in
            when(stub.fetchCats(page: any(), completion: any())).thenDoNothing()
        }
        let viewModel = CatListViewModel(networkService: self.networkService, imageService: self.imageService)
        viewModel.cats.accept([
            Cat(id: "1", title: "Cat title", link: "Link"),
            Cat(id: "2", title: "Cat title", link: "Link"),
            Cat(id: "3", title: "Cat title", link: "Link"),
            Cat(id: "4", title: "Cat title", link: "Link"),
            Cat(id: "5", title: "Cat title", link: "Link"),
            Cat(id: "6", title: "Cat title", link: "Link"),
            Cat(id: "7", title: "Cat title", link: "Link"),
            Cat(id: "8", title: "Cat title", link: "Link"),
            Cat(id: "9", title: "Cat title", link: "Link"),
            Cat(id: "10", title: "Cat title", link: "Link"),
            Cat(id: "11", title: "Cat title", link: "Link"),
            Cat(id: "12", title: "Cat title", link: "Link"),
        ])
        
        // when
        viewModel.fetchMoreCatsIfNeeded(at: IndexPath(row: 0, section: 0))
        
        // then
        verify(self.networkService, times(1)).fetchCats(page: any(), completion: any())
    }
    
    func testShouldReloadCellAtIndexPath() {
        // given
        let viewModel = CatListViewModel()
        viewModel.cats.accept([
            Cat(id: "12345", title: "Cat title", link: "link"),
            Cat(id: "12345", title: "Cat title", link: "link")
        ])
        
        // when
        let expectToReload = viewModel.shouldReloadCell(at: IndexPath(row: 0, section: 0))
        let expectToNotReload = viewModel.shouldReloadCell(at: IndexPath(row: 2, section: 0))
        
        // then
        XCTAssertTrue(expectToReload)
        XCTAssertFalse(expectToNotReload)
    }
    
    func testShouldReturnDetailViewControllerByIndexPath() {
        // given
        let cat = Cat(id: "12345", title: "Cat title", link: "link")
        let expectedPicture = UIImage(systemName: "heart.fill")!
        stub(self.imageService) { stub in
            when(stub.downloadImage(from: any(), completion: any())).then { string, completion in
                let response = AFDataResponse<Image>(request: nil, response: nil, data: nil, metrics: nil, serializationDuration: 0, result: Result<Image, AFError>.success(expectedPicture))
                completion(response)
            }
        }
        let viewModel = CatListViewModel(networkService: self.networkService, imageService: self.imageService)
        viewModel.cats.accept([cat])
        let indexPath = IndexPath(row: 0, section: 0)
        
        // when
        let expectation = XCTestExpectation(description: "fetch picture")
        viewModel.fetchPicture(to: indexPath) {
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1)
        let catDetailViewController = viewModel.detailViewController(at: indexPath)
        
        // then
        XCTAssertNotNil(catDetailViewController)
    }
    
    func testShouldReturnDetailViewControllerByMenuConfiguration() {
        // given
        let cat = Cat(id: "12345", title: "Cat title", link: "link")
        let menuConfiguration = UIContextMenuConfiguration(identifier: cat.menuID, previewProvider: nil)
        let expectedPicture = UIImage(systemName: "heart.fill")!
        stub(self.imageService) { stub in
            when(stub.downloadImage(from: any(), completion: any())).then { string, completion in
                let response = AFDataResponse<Image>(request: nil, response: nil, data: nil, metrics: nil, serializationDuration: 0, result: Result<Image, AFError>.success(expectedPicture))
                completion(response)
            }
        }
        let viewModel = CatListViewModel(networkService: self.networkService, imageService: self.imageService)
        viewModel.cats.accept([cat])
        let indexPath = IndexPath(row: 0, section: 0)
        
        // when
        let expectation = XCTestExpectation(description: "fetch picture")
        viewModel.fetchPicture(to: indexPath) {
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1)
        let catDetailViewController = viewModel.detailViewController(by: menuConfiguration)
        
        // then
        XCTAssertNotNil(catDetailViewController)
    }
    
    func testShouldReturnNilWhenNoCatOrPictureToDetailViewController() {
        // given
        let viewModel = CatListViewModel()
        
        // when
        let catDetailViewController = viewModel.detailViewController(at: IndexPath(row: 0, section: 0))
        
        // then
        XCTAssertNil(catDetailViewController)
    }
    
    func testShouldReturnCatForMenuConfiguration() {
        // given
        let cat = Cat(id: "12345", title: "Cat title", link: "Link")
        let menuConfiguration = UIContextMenuConfiguration(identifier: cat.menuID, previewProvider: nil)
        let viewModel = CatListViewModel()
        viewModel.cats.accept([cat])
        
        // when
        let catByConfiguration = viewModel.cat(by: menuConfiguration)
        
        // then
        XCTAssertNotNil(catByConfiguration)
    }
    
    func testShouldReturnCatNilForMenuConfigurationWhenHasntCat() {
        // given
        let cat = Cat(id: "12345", title: "Cat title", link: "Link")
        let menuConfiguration = UIContextMenuConfiguration(identifier: "123456" as NSCopying, previewProvider: nil)
        let viewModel = CatListViewModel()
        viewModel.cats.accept([cat])
        
        // when
        let catByConfiguration = viewModel.cat(by: menuConfiguration)
        
        // then
        XCTAssertNil(catByConfiguration)
    }
}
