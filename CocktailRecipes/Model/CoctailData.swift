//
//  CoctailData.swift
//  CocktailRecipes
//
//  Created by Maxim Tvilinev on 28.11.2023.
//

import Foundation

struct CoctailData {
    let title: String
    let titleEn: String
    let image: String
    let aboutCoctail: String
    let recipe: String
    let ingridient: [Ingridients]
    let equipmant: [Equipment]
    var isCollapsed: Bool = true
}

struct Ingridients {
    let firstInrgidient: String?
    let secondIngridient: String?
    let thirdIngridient: String?
    let fourthIngridient: String?
    let fifthIngridient: String?
    let sixIngridient: String?
    let seventhtIngridient: String?
    let eighthIngridient: String?
    let ninthIngridient: String?
    let tenthIngridient: String?
}

struct Equipment {
    let first: String?
    let second: String?
    let third: String?
    let fourth: String?
    let fifth: String?
    let six: String?
    let seventht: String?
    let eighth: String?
    let ninth: String?
    let tenth: String?
}
