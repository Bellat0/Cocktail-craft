//
//  DetailsHeaderView.swift
//  CocktailRecipes
//
//  Created by Maxim Tvilinev on 06.12.2023.
//

import UIKit

class DetailsHeaderView: UIView {

    // MARK: - Properties

    private let imageView = UIImageView()

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods

    private func setupViews() {
        addSubview(imageView)
        imageView.layer.cornerRadius = 8
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
    }

    private func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.centerX.equalToSuperview()
            make.width.equalTo(360)
            make.height.equalTo(193)
        }
    }

    // MARK: - Configure

    func configure(coctailData: CoctailData) {
        self.imageView.image = UIImage(named: coctailData.image)
    }
}
