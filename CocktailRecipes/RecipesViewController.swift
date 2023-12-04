//
//  ViewController.swift
//  CocktailRecipes
//
//  Created by Maxim Tvilinev on 28.11.2023.
//

import UIKit
import SnapKit

class RecipesViewController: UIViewController {

    // MARK: - Properties

    private let searchBar = UISearchBar()
    private let tableView = UITableView()

    private let tableHeader = TableHeaderView(frame: CGRect(x: 0, y: 0, width: 0, height: 70))

    // MARK: - Dependencies

    var coctailsSmallData = CoctailSmallData()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupConstraints()
        setupTableView()
    }


    // MARK: - Methods

    private func setupViews() {
        view.backgroundColor = Colors.roseColor
        tableView.backgroundColor = Colors.grayColor

        view.addSubview(tableView)
        tableView.separatorStyle = .none
    }

    private func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }

    private func setupTableView() {
        tableHeader.bannerView.rootViewController = self
        tableView.tableHeaderView = tableHeader

        tableView.delegate = self
        tableView.dataSource = self

        tableView.register(
            MainViewCell.self,
            forCellReuseIdentifier: MainViewCell.ID)
    }
}

// MARK: - Table view data source

extension RecipesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: MainViewCell.ID,
            for: indexPath
        ) as? MainViewCell else { return UITableViewCell() }

        if coctailsSmallData.isCollapsed {
            cell.collapsedRectangle()
        } else {
            cell.expandedRectangle()
        }

        cell.selectionStyle = .none

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        coctailsSmallData.isCollapsed.toggle()
        self.tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}
