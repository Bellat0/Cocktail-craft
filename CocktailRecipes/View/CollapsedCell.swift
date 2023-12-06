//
//  MainViewCell.swift
//  CocktailRecipes
//
//  Created by Maxim Tvilinev on 28.11.2023.
//

import UIKit

class CollapsedCell: UITableViewCell {

    static let ID = "MainViewCell"

    // MARK: - Properties

    private let rectangleView = UIView()
    private let coctailImage = UIImageView()
    private let coctailTitleLabel = UILabel()
    private let coctailDescriptionEnLabel = UILabel()
    private let arrowButton = UIButton()
    private let verticalStackView = UIStackView()

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
        coctailTitleLabel.text = "Ост-индийский негрони"
        coctailTitleLabel.numberOfLines = 0
        coctailTitleLabel.font = UIFont(name: "SFProText-Semibold", size: 17)
        coctailTitleLabel.textColor = .black

        contentView.addSubview(coctailDescriptionEnLabel)
        coctailDescriptionEnLabel.text = "Margarita"
        coctailDescriptionEnLabel.font = UIFont(name: "SFProText-Regular", size: 13)
        coctailDescriptionEnLabel.textColor = .systemGray

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
            make.bottom.equalTo(rectangleView.snp.bottom).offset(-16)
        }
    }


    // MARK: - Configure

    func configure(coctailData: CoctailData) {
        self.coctailTitleLabel.text = coctailData.title
        self.coctailDescriptionEnLabel.text = coctailData.titleEn
        self.coctailImage.image = UIImage(named: coctailData.image)
    }
}
