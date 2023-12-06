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

    var coctailData = [CoctailData]()

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

        view.addSubview(searchBar)
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "Поиск рецептов"

        view.addSubview(tableView)
        tableView.separatorStyle = .none
    }

    private func setupConstraints() {
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().offset(-8)
        }

        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }

    private func setupTableView() {
        tableView.separatorStyle = .none
        tableHeader.bannerView.rootViewController = self
        tableView.tableHeaderView = tableHeader

        tableView.delegate = self
        tableView.dataSource = self

        tableView.register(
            CollapsedCell.self,
            forCellReuseIdentifier: CollapsedCell.ID)

        tableView.register(
            ExpandedCell.self,
            forCellReuseIdentifier: ExpandedCell.ID)

        tableView.register(
            TableViewHeaderSection.self,
            forHeaderFooterViewReuseIdentifier: TableViewHeaderSection.ID)
    }
}

// MARK: - Table view data source

extension RecipesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coctailsDataBase.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let coctailData = coctailsDataBase[indexPath.row]

        if coctailData.isCollapsed {

            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: CollapsedCell.ID,
                for: indexPath
            ) as? CollapsedCell else { return UITableViewCell() }

            cell.configure(coctailData: coctailData)
            cell.isCollapsed = coctailData.isCollapsed

            cell.selectionStyle = .none

            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: ExpandedCell.ID,
                for: indexPath
            ) as? ExpandedCell else { return UITableViewCell() }

            cell.configure(coctailData: coctailData)
            cell.isCollapsed = coctailData.isCollapsed

            return cell
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        coctailsDataBase[indexPath.row].isCollapsed.toggle()

        self.tableView.reloadRows(at: [indexPath], with: .automatic)
    }

    // MARK: - Table header section

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(
            withIdentifier: TableViewHeaderSection.ID
        ) as? TableViewHeaderSection else { return nil }

        header.configureTitle(title: "Все рецепты")

        return header
    }
}
