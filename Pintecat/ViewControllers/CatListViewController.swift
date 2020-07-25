//
//  CatListViewController.swift
//  Pintecat
//
//  Created by John Lenon Souza dos Reis on 23/07/20.
//  Copyright © 2020 John Lenon Souza dos Reis. All rights reserved.
//

import UIKit
import RxSwift
import Alamofire

class CatListViewController: UIViewController {

    // MARK: Properties
    private var bag = DisposeBag()
    private var activityIndicator = UIActivityIndicatorView(style: .large)
    private var refreshControl = UIRefreshControl()
    var viewModel = CatListViewModel()
    
    // MARK: Outlets
    @IBOutlet weak var catCollectionView: UICollectionView!
    
    // MARK: Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupCollectionView()
        self.setupActivityIndicator()
        self.viewModel.fetchCats()
        self.bindUI()
    }
    
    // MARK: Methods
    private func setupCollectionView() {
        self.catCollectionView.dataSource = self
        self.catCollectionView.delegate = self
        self.refreshControl.addTarget(self, action: #selector(self.refreshCats(_:)), for: .valueChanged)
        self.catCollectionView.refreshControl = self.refreshControl
        
    }
    
    @objc func refreshCats(_ sender: AnyObject) {
        self.viewModel.refreshCats()
    }
    
    private func setupActivityIndicator() {
        self.activityIndicator.center = self.view.center
        self.view.addSubview(self.activityIndicator)
    }
    
    private func bindUI() {
        self.viewModel.loading.subscribe(onNext: { [weak self] isLoading in
            isLoading ? self?.activityIndicator.startAnimating() : self?.activityIndicator.stopAnimating()
            self?.activityIndicator.isHidden = !isLoading
        }).disposed(by: self.bag)
        
        self.viewModel.refreshing.subscribe(onNext: { [weak self] isRefreshing in
            isRefreshing ? self?.refreshControl.beginRefreshing() : self?.refreshControl.endRefreshing()
        }).disposed(by: self.bag)
        
        self.viewModel.cats.subscribe(onNext: { [weak self] cats in
            self?.catCollectionView.reloadData()
        }).disposed(by: self.bag)
        
        self.viewModel.error.subscribe(onNext: { [weak self] error in
            if let error = error {
                let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Tentar novamente", style: .default, handler: { action in
                    self?.viewModel.fetchCats()
                }))
                
                self?.present(alert, animated: true, completion: nil)
            }
        }).disposed(by: self.bag)
    }
}

// MARK: CollectionViewDelegate
extension CatListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.catCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CatCollectionViewCell", for: indexPath) as! CatCollectionViewCell
        let picture = self.viewModel.picture(to: indexPath)
        
        if picture == nil {
            DispatchQueue.main.async {
                self.viewModel.fetchPicture(to: indexPath) {
                    if self.catCollectionView.cellForItem(at: indexPath) != nil {
                        self.catCollectionView.reloadItems(at: [indexPath])
                    }
                }
            }
        }
        
        cell.setPicture(picture)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.viewModel.fetchMoreCatsIfNeeded(at: indexPath)
    }
}

// MARK: Collection View Flow Delegate
extension CatListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return self.viewModel.sizeForItemAt(indexPath, maxWidth: collectionView.bounds.width)
    }
}
