//
//  DetailsCell.swift
//  CocktailRecipes
//
//  Created by Maxim Tvilinev on 06.12.2023.
//

import UIKit

class CoctailDetailsCell: UITableViewCell {

    static let ID = "DetailsCell"

    // MARK: - Properties

    private let ingridientsRectangle = UIView()
    private let firstInrgidient = UILabel()
    private let secondIngridient = UILabel()
    private let thirdIngridient = UILabel()
    private let fourthIngridient = UILabel()
    private let fifthIngridient = UILabel()
    private let sixIngridient = UILabel()
    private let seventhtIngridient = UILabel()
    private let eighthIngridient = UILabel()
    private let ninthIngridient = UILabel()
    private let tenthIngridient = UILabel()
    private let ingridientStackView = UIStackView()

    private let equipmentsRectangle = UIView()
    private let first = UILabel()
    private let second = UILabel()
    private let third = UILabel()
    private let fourth = UILabel()
    private let fifth = UILabel()
    private let six = UILabel()
    private let seventht = UILabel()
    private let eighth = UILabel()
    private let ninth = UILabel()
    private let tenth = UILabel()
    private let equipmentsStackView = UIStackView()

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

        contentView.addSubview(ingridientsRectangle)
        ingridientsRectangle.backgroundColor = .white
        ingridientsRectangle.layer.cornerRadius = 8

        for setup in [firstInrgidient, secondIngridient, thirdIngridient, fourthIngridient, fifthIngridient, sixIngridient, seventhtIngridient, eighthIngridient, tenthIngridient] {

            setup.font = UIFont(name: "SFProText-Regular", size: 13)
            setup.textColor = .systemGray

            contentView.addSubview(setup)
            ingridientStackView.addArrangedSubview(setup)
        }

        contentView.addSubview(ingridientStackView)
        ingridientStackView.axis = .vertical

        for setup in [first, second, third, fourth, fifth, six, seventht, eighth, ninth, tenth] {

            setup.font = UIFont(name: "SFProText-Regular", size: 13)
            setup.textColor = .systemGray

            contentView.addSubview(setup)
            equipmentsStackView.addArrangedSubview(setup)
        }

        contentView.addSubview(equipmentsStackView)
        equipmentsStackView.axis = .vertical
    }

    private func setupConstraints() {
        ingridientsRectangle.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(8)
            make.bottom.equalTo(contentView).offset(-8)
            make.leading.equalTo(contentView).offset(8)
            make.trailing.equalTo(contentView).offset(-8)
        }

        ingridientStackView.snp.makeConstraints { make in
            make.top.equalTo(ingridientsRectangle.snp.top).offset(8)
            make.bottom.equalTo(ingridientsRectangle.snp.bottom).offset(-8)
            make.leading.equalTo(ingridientsRectangle.snp.leading).offset(8)
            make.trailing.equalTo(ingridientsRectangle.snp.trailing).offset(-8)
        }

        equipmentsStackView.snp.makeConstraints { make in
            make.top.equalTo(ingridientStackView.snp.top).offset(8)
            make.bottom.equalTo(ingridientsRectangle.snp.bottom).offset(-8)
            make.leading.equalTo(ingridientsRectangle.snp.leading).offset(8)
            make.trailing.equalTo(ingridientsRectangle.snp.trailing).offset(-8)
        }

    }

    // MARK: - Configure

    func configure(coctailIngridients: Ingridients) {
        self.firstInrgidient.text = coctailIngridients.firstInrgidient
        self.secondIngridient.text = coctailIngridients.secondIngridient
        self.thirdIngridient.text = coctailIngridients.thirdIngridient
        self.fourthIngridient.text = coctailIngridients.fourthIngridient
        self.fifthIngridient.text = coctailIngridients.fifthIngridient
        self.sixIngridient.text = coctailIngridients.sixIngridient
        self.seventhtIngridient.text = coctailIngridients.seventhtIngridient
        self.eighthIngridient.text = coctailIngridients.eighthIngridient
        self.ninthIngridient.text = coctailIngridients.ninthIngridient
        self.tenthIngridient.text = coctailIngridients.tenthIngridient
    }

    func configureEquipments(coctailEquipments: Equipment) {
        self.first.text = coctailEquipments.first
        self.second.text = coctailEquipments.second
        self.third.text = coctailEquipments.third
        self.fourth.text = coctailEquipments.fourth
        self.fifth.text = coctailEquipments.fifth
        self.six.text = coctailEquipments.six
        self.seventht.text = coctailEquipments.seventht
        self.eighth.text = coctailEquipments.eighth
        self.ninth.text = coctailEquipments.ninth
        self.tenth.text = coctailEquipments.tenth
    }
}
