//
//  DetailsViewController.swift
//  CocktailRecipes
//
//  Created by Maxim Tvilinev on 06.12.2023.
//

import UIKit

class CoctailDetails: UIViewController {

    // MARK: - Properties

    private let tableView = UITableView()

    let headerView = DetailsHeaderView(frame: CGRect(x: 0, y: 0, width: 0, height: 220))

    // MARK: - Dependencies

    var coctailData: CoctailData

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupConstraints()
        setupTableView()

        title = coctailData.title
    }

    // MARK: - Init

    init(coctailData: CoctailData) {
        self.coctailData = coctailData

        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Methods

    private func setupViews() {
        view.backgroundColor = Colors.roseColor
        
        view.addSubview(tableView)
        tableView.backgroundColor = Colors.grayColor
    }

    private func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }

    private func setupTableView() {
        tableView.tableHeaderView = headerView
        headerView.configure(coctailData: coctailData)

        tableView.delegate = self
        tableView.dataSource = self

        tableView.register(
            CoctailDetailsCell.self,
            forCellReuseIdentifier: CoctailDetailsCell.ID)
    }
}

// MARK: - Table view data source

extension CoctailDetails: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CoctailDetailsCell.ID,
            for: indexPath
        ) as? CoctailDetailsCell else { return UITableViewCell() }

        let ingridients = coctailData.ingridient[indexPath.row]
        let equipments = coctailData.equipmant[indexPath.row]

        cell.configure(coctailIngridients: ingridients)

        return cell
    }
}
