//
//  MainViewCell.swift
//  CocktailRecipes
//
//  Created by Maxim Tvilinev on 28.11.2023.
//

import UIKit

class MainViewCell: UITableViewCell {

    static let ID = "MainViewCell"

    // MARK: - Properties

    private let rectangleView = UIView()
    private let coctailImage = UIImageView()
    private let coctailTitleLabel = UILabel()
    private let coctailDescriptionEnLabel = UILabel()
    private let arrowutton = UIButton()

    var topicSelectionHandler: ((IndexPath) -> Void)?

    // MARK: - Init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupViews()
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
        coctailImage.frame.size.width = 48
        coctailImage.frame.size.height = 48
        coctailImage.layer.cornerRadius = coctailImage.frame.width / 2
        coctailImage.clipsToBounds = true
        coctailImage.backgroundColor = .systemBlue

        contentView.addSubview(arrowutton)

        contentView.addSubview(coctailTitleLabel)
        coctailTitleLabel.text = "Ост-индийский негрониОст-индийский негрони"
        coctailTitleLabel.numberOfLines = 0
        coctailTitleLabel.font = UIFont(name: "SFProText-Semibold", size: 17)
        coctailTitleLabel.textColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)

        contentView.addSubview(coctailDescriptionEnLabel)
        coctailDescriptionEnLabel.text = "Margarita"
        coctailDescriptionEnLabel.font = UIFont(name: "SFProText-Regular", size: 13)
        coctailDescriptionEnLabel.textColor = UIColor(red: 136/255, green: 136/255, blue: 136/255, alpha: 1)
    }

    func collapsedRectangle() {
        rectangleView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-8)
        }

        coctailImage.snp.makeConstraints { make in
            make.leading.equalTo(rectangleView.snp.leading).offset(12)
            make.centerY.equalTo(rectangleView)
            make.width.equalTo(48)
            make.height.equalTo(48)
        }

        arrowutton.snp.makeConstraints { make in
            make.trailing.equalTo(rectangleView).offset(-12)
            make.top.equalTo(rectangleView).offset(24)
            make.size.equalTo(24)
        }

        coctailTitleLabel.snp.makeConstraints { make in
            make.leading.equalTo(coctailImage.snp.trailing).offset(12)
            make.top.equalTo(rectangleView).offset(16)
            make.trailing.equalTo(arrowutton.snp.leading).offset(-12)
        }

        coctailDescriptionEnLabel.snp.makeConstraints { make in
            make.leading.equalTo(coctailImage.snp.trailing).offset(12)
            make.top.equalTo(coctailTitleLabel.snp.bottom).offset(4)
            make.bottom.equalTo(rectangleView.snp.bottom).offset(-16)
        }
    }

    func expandedRectangle() {
        rectangleView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-8)
            make.height.equalTo(200)
        }
    }
}
