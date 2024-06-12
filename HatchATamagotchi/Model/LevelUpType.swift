//
//  LevelUpType.swift
//  HatchATamagotchi
//
//  Created by 장예지 on 6/12/24.
//

import UIKit

enum LevelUpType {
    case feed
    case water
    
    var placeholder: String {
        switch self {
        case .feed:
            return "밥주세용"
        case .water:
            return "물주세용"
        }
    }
    
    var buttonTitle: String {
        switch self {
        case .feed:
            return "밥먹기"
        case .water:
            return "물먹기"
        }
    }
    
    var buttonImage: UIImage? {
        switch self {
        case .feed:
            return DefaultIcon.feed.icon
        case .water:
            return DefaultIcon.drink.icon
        }
    }
}
