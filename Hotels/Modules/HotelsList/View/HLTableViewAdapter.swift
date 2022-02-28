//
//  HLTableViewAdapter.swift
//  Hotels
//
//  Created by Andrey Alymov on 21.01.2022.
//

import UIKit
import SnapKit

final class HLTableViewAdapter: NSObject {
    
    // MARK: - Properties
    private var view: UIView
    private var tableView: UITableView
    var presenter: HLViewPresenterProtocol?
    
    // MARK: - Initializator
    init(tableView: UITableView, presenter: HLViewPresenterProtocol?, view: UIView) {
        self.tableView = tableView
        self.presenter = presenter
        self.view = view
        super.init()
        setupTable()
        setupConstraints()
    }
    
    // MARK: - Private methods
    private func setupTable() {
        view.addSubview(tableView)
        setupConstraints()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(HLTableViewCell.self, forCellReuseIdentifier: HLTableViewCell.identifier)
    }
    
    private func setupConstraints() {
        tableView.separatorInset.right = 15
        tableView.separatorInset.left = 15
        tableView.showsVerticalScrollIndicator = false
        tableView.rowHeight = 100
        tableView.snp.makeConstraints { make in
            make.left.equalTo(view)
            make.top.equalTo(view)
            make.right.equalTo(view)
            make.bottom.equalTo(view)
        }
    }
}

// MARK: - UITableViewDataSource
extension HLTableViewAdapter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.hotels?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: String(describing: HLTableViewCell.self), for: indexPath) as? HLTableViewCell
        let hotel = presenter?.hotels?[indexPath.row]
        cell?.configure(with: hotel)
        return cell ?? UITableViewCell()
    }
}

// MARK: - UITableViewDelegate
extension HLTableViewAdapter: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter?.sortHotels(.byDistance)
    }
}

