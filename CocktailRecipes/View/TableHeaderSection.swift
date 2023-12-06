//
//  TableHeaderSectionView.swift
//  CocktailRecipes
//
//  Created by Maxim Tvilinev on 05.12.2023.
//

import UIKit

class TableViewHeaderSection: UITableViewHeaderFooterView {

    static let ID = "HeaderSectionView"

    // MARK: - Properties

    private let titleLabel = UILabel()

    // MARK: - Init

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)

        setupViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - Methods

    private func setupViews() {
        contentView.backgroundColor = Colors.grayColor
        
        contentView.addSubview(titleLabel)
        titleLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        titleLabel.textColor = UIColor(red: 171/255, green: 179/255, blue: 187/255, alpha: 1)
    }

    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(20)
            make.bottom.equalToSuperview().offset(-8)
        }
    }

    // MARK: - Configure

    func configureTitle(title: String) {
        self.titleLabel.text = title.uppercased()
    }
}

