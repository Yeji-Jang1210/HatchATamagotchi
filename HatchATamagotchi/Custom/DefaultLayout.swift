//
//  DefaultLayout.swift
//  HatchATamagotchi
//
//  Created by 장예지 on 6/6/24.
//

import UIKit

class DefaultFont {
    static var small: UIFont = .systemFont(ofSize: 10)
    static var medium: UIFont = .systemFont(ofSize: 12)
    static var accent: UIFont = .boldSystemFont(ofSize: 14)
    static var accentSmall: UIFont = .boldSystemFont(ofSize: 10)
    static var accentMedium: UIFont = .boldSystemFont(ofSize: 14)
}

class DefaultColor {
    static var background = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
    static var font = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
    static var border = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
    static var tintColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
}

enum DefaultIcon: String {
//MARK: Main
    case bubble = "bubble"
    case feed = "leaf.circle"
    case drink = "drop.circle"
    
//MARK: Setting
    case person = "person.circle"
    case pencil = "pencil"
    case moon = "moon.fill"
    case refresh = "arrow.clockwise"
    case back = "chevron.left"
    
    var icon: UIImage? {
        switch self {
        case .bubble:
            return UIImage(named: self.rawValue)
        default:
            return UIImage(systemName: self.rawValue)
        }
    }
}
