//
//  TableHeaderView.swift
//  Mura
//
//  Created by Maxim Tvilinev on 10.11.2023.
//

import UIKit
import GoogleMobileAds

class TableHeaderView: UIView {

    // MARK: - Properties

    var bannerView: GADBannerView!

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)

        bannerView = GADBannerView(adSize: GADAdSizeBanner)
        addBannerViewToView(bannerView)
        backgroundColor = Colors.roseColor
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Methods

    func addBannerViewToView(_ bannerView: GADBannerView) {
        addSubview(bannerView)
        bannerView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }

        bannerView.adUnitID = bannerKey

        DispatchQueue.main.async {
            self.bannerView.load(GADRequest())
        }
    }
}
