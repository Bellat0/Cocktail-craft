//
//  ExpandedCell.swift
//  CocktailRecipes
//
//  Created by Maxim Tvilinev on 05.12.2023.
//

import UIKit

class ExpandedCell: UITableViewCell {

    static let ID = "ExpandedCell"

    // MARK: - Properties

    private let rectangleView = UIView()
    private let coctailImage = UIImageView()
    private let coctailTitleLabel = UILabel()
    private let coctailDescriptionEnLabel = UILabel()
    private let aboutCoctailsLabel = UILabel()
    private let recipeButton = UIButton(type: .system)
    private let arrowButton = UIButton()
    private let verticalStackView = UIStackView()

    var topicSelectionHandler: (() -> Void)?

    var isCollapsed = true {
        didSet {
            arrowButton.setImage(isCollapsed ? UIImage(systemName: "chevron.down")
                                 : UIImage(systemName: "chevron.up"), for: .normal)
        }
    }

    // MARK: - Init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Methods

    private func setupViews() {
        contentView.backgroundColor = Colors.grayColor

        contentView.addSubview(rectangleView)
        rectangleView.backgroundColor = .white
        rectangleView.layer.cornerRadius = 12

        contentView.addSubview(coctailImage)
        coctailImage.layer.cornerRadius = 12
        coctailImage.clipsToBounds = true
        coctailImage.backgroundColor = .systemBlue

        contentView.addSubview(arrowButton)
        arrowButton.tintColor = .systemGray

        contentView.addSubview(coctailTitleLabel)
        coctailTitleLabel.numberOfLines = 0
        coctailTitleLabel.font = UIFont(name: "SFProText-Semibold", size: 17)
        coctailTitleLabel.textColor = .black

        contentView.addSubview(coctailDescriptionEnLabel)
        coctailDescriptionEnLabel.font = UIFont(name: "SFProText-Regular", size: 13)
        coctailDescriptionEnLabel.textColor = .systemGray

        contentView.addSubview(aboutCoctailsLabel)
        aboutCoctailsLabel.font = UIFont(name: "SFProText-Regular", size: 13)
        aboutCoctailsLabel.textColor = .systemGray
        aboutCoctailsLabel.numberOfLines = 0

        contentView.addSubview(recipeButton)
        recipeButton.setTitle("Рецепт коктейля", for: .normal)
        recipeButton.setTitleColor(.systemBlue, for: .normal)
        recipeButton.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        recipeButton.addTarget(self, action: #selector(recipeButtonAction), for: .touchUpInside)

        contentView.addSubview(verticalStackView)
        verticalStackView.addArrangedSubview(coctailTitleLabel)
        verticalStackView.addArrangedSubview(coctailDescriptionEnLabel)
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 3
    }

    private func setupConstraints() {

        rectangleView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().offset(-8)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }

        arrowButton.snp.makeConstraints { make in
            make.trailing.equalTo(rectangleView).offset(-12)
            make.top.equalTo(rectangleView).offset(24)
            make.size.equalTo(24)
        }

        coctailImage.snp.makeConstraints { make in
            make.centerY.equalTo(verticalStackView.snp.centerY)
            make.leading.equalTo(rectangleView.snp.leading).offset(8)
            make.size.equalTo(48)
        }

        verticalStackView.snp.makeConstraints { make in
            make.top.equalTo(rectangleView).offset(16)
            make.leading.equalTo(coctailImage.snp.trailing).offset(12)
            make.trailing.equalTo(arrowButton.snp.leading).offset(-12)
        }

        aboutCoctailsLabel.snp.makeConstraints { make in
            make.top.equalTo(coctailImage.snp.bottom).offset(8)
            make.leading.equalTo(rectangleView.snp.leading).offset(12)
            make.trailing.equalTo(rectangleView.snp.trailing).offset(-12)
        }

        recipeButton.snp.makeConstraints { make in
            make.top.equalTo(aboutCoctailsLabel.snp.bottom).offset(6)
            make.bottom.equalTo(rectangleView.snp.bottom).offset(-16)
            make.leading.equalTo(rectangleView.snp.leading).offset(12)
            make.trailing.equalTo(rectangleView.snp.trailing).offset(-12)
        }
    }

    // MARK: - Configure

    func configure(coctailData: CoctailData) {
        self.coctailTitleLabel.text = coctailData.title
        self.coctailDescriptionEnLabel.text = coctailData.titleEn
        self.coctailImage.image = UIImage(named: coctailData.image)
        self.aboutCoctailsLabel.text = coctailData.aboutCoctail
    }

    @objc func recipeButtonAction() {
        topicSelectionHandler?()
    }
}

