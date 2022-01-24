//
//  HotelsListViewController.swift
//  Hotels
//
//  Created by Andrey Alymov on 21.01.2022.
//

import UIKit

class HotelsListViewController: UIViewController {
    
    //MARK: - Interface elements
    private lazy var hotelsTableView = UITableView()
    weak var activityIndicator: UIActivityIndicatorView!
    
    //MARK: - Properties
    var presenter: HLViewPresenterProtocol! // Input
    var adapter: HLTableViewAdapter? // setup tableView, dataSource & delegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewLoaded()
    }
    
    //MARK: - Private methods
    private func viewLoaded() {
        adapter = HLTableViewAdapter(tableView: hotelsTableView, presenter: presenter, view: view)
        setupNavItems()
    }
    
    private func setupNavItems() {
        navigationItem.title = "Hotels"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

//MARK: - Actions after loaded data
extension HotelsListViewController: HLViewProtocol {
    func success() {
            self.hotelsTableView.reloadData()
    }
    
    func failure(error: Error) {
        let controller = UIAlertController.appErrorAlert(controllerTitlte: "Error", controllerMessage: "\(error.localizedDescription)", actionTitle: "Try again", cancelTitlte: "Cancel") { [ weak self ] _ in
            self?.presenter.getHotels()
        } cancelHandler: { [ weak self ] _ in
            self?.activityIndicator.stopAnimating()
        }
        present(controller, animated: true, completion: nil)
    }
}
