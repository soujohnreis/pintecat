//
//  CatListViewModel.swift
//  Pintecat
//
//  Created by John Lenon Souza dos Reis on 23/07/20.
//  Copyright © 2020 John Lenon Souza dos Reis. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift
import RxCocoa

struct CatListViewModelConstants {
    static let rowNearEndToFetch = 12
}

class CatListViewModel {
    
    // MARK: Properties
    private var networkService: NetworkServiceProtocol
    private var imageService: ImageServiceProtocol
    private var pictures: [String:UIImage] = [:]
    private var downloadedPictures: [String: Bool] = [:]
    private var nextPage: Int = 0
    var error = BehaviorRelay<AFError?>(value: nil)
    var loading = BehaviorRelay<Bool>(value: false)
    var refreshing = BehaviorRelay<Bool>(value: false)
    var cats = BehaviorRelay<[Cat]>(value: [])
    
    // MARK: Initializers
    init(networkService: NetworkServiceProtocol = NetworkService(), imageService: ImageServiceProtocol = ImageService()) {
        self.networkService = networkService
        self.imageService = imageService
    }
    
    // MARK: Methods
    func setNetworkService(_ networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func setImageService(_ imageService: ImageServiceProtocol) {
        self.imageService = imageService
    }
    
    func cat(at indexPath: IndexPath) -> Cat? {
        if !self.cats.value.indices.contains(indexPath.row) {
            return nil
        }
        return self.cats.value[indexPath.row]
    }
    
    func cat(by menuConfiguration: UIContextMenuConfiguration) -> Cat? {
        return self.cats.value.item(for: menuConfiguration)
    }
    
    func picture(at indexPath: IndexPath) -> UIImage? {
        if let cat = self.cat(at: indexPath) {
            return self.pictures[cat.id]
        }
        
        return nil
    }
    
    func picture(by menuConfiguration: UIContextMenuConfiguration) -> UIImage? {
        if let cat = self.cat(by: menuConfiguration) {
            return self.pictures[cat.id]
        }
        
        return nil
    }
    
    func shouldReloadCell(at indexPath: IndexPath) -> Bool {
        return self.cat(at: indexPath) != nil
    }
    
    func catCount() -> Int {
        return self.cats.value.count
    }

    func sizeForItemAt(_ indexPath: IndexPath, maxWidth: CGFloat) -> CGSize {
        let cat = self.cat(at: indexPath)
        if indexPath.row % 13 == 0 {
            
            if let coverWidth = cat?.coverWidth, let coverHeight = cat?.coverHeight {
                return CGSize.sizeProportion(maxWidth: maxWidth, withGivenWidth: CGFloat(coverWidth), andHeight: CGFloat(coverHeight))
            }
            
            return CGSize(width: maxWidth, height: maxWidth)
        }
        
        let size = (maxWidth / 3) - 10
        
        return CGSize(width: size, height: size)
    }
    
    func fetchPicture(to indexPath: IndexPath, completion: @escaping () -> Void) {
        guard let cat = self.cat(at: indexPath) else { return }
        
        if !self.downloadedPictures.keys.contains(cat.id) {
            self.imageService.downloadImage(from: cat.directLink()) { [weak self] response in
                if case .success(let picture) = response.result {
                    self?.pictures[cat.id] = picture
                    completion()
                }
            }
        }
        
        self.downloadedPictures[cat.id] = true
    }
    
    func fetchCats(isRefreshing: Bool = false) {
        if isRefreshing {
            self.refreshing.accept(true)
        } else if self.catCount() == 0 {
            self.loading.accept(true)
        }
        
        self.networkService.fetchCats(page: self.nextPage, completion: { response in
            switch response.result {
            case.success(let catRusult):
                self.cats.accept(self.cats.value + catRusult.data)
                self.nextPage += 1
                break
            case .failure(let error):
                self.error.accept(error)
                break
            }
            self.loading.accept(false)
            self.refreshing.accept(false)
        })
    }
    
    func fetchMoreCatsIfNeeded(at indexPath: IndexPath) {
        if indexPath.row == (self.catCount() - CatListViewModelConstants.rowNearEndToFetch) {
            self.fetchCats()
        }
    }
    
    func refreshCats() {
        self.cats.accept([])
        self.nextPage = 0
        self.fetchCats(isRefreshing: true)
    }
    
    func detailViewController(at indexPath: IndexPath) -> CatDetailViewController? {
        guard let cat = self.cat(at: indexPath) else { return nil}
        guard let picture = self.picture(at: indexPath) else { return nil }
        let viewModel = CatDetailViewModel(cat: cat, picture: picture)
        let viewController = CatDetailViewController()
        viewController.viewModel = viewModel
        return viewController
    }
    
    func detailViewController(by menuConfiguration: UIContextMenuConfiguration) -> CatDetailViewController? {
        guard let cat = self.cat(by: menuConfiguration) else { return nil}
        guard let picture = self.picture(by: menuConfiguration) else { return nil }
        let viewModel = CatDetailViewModel(cat: cat, picture: picture)
        let viewController = CatDetailViewController()
        viewController.viewModel = viewModel
        return viewController
    }
}
