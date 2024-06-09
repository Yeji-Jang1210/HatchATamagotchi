//
//  SelectTamagotciVCType.swift
//  HatchATamagotchi
//
//  Created by 장예지 on 6/9/24.
//

import Foundation

enum SelectTamagotciVCType{
    case initSelect
    case change
    
    var navigationTitle: String {
        switch self {
        case .initSelect:
            return "다마고치 선택하기"
        case .change:
            return "다마고치 변경하기"
        }
    }
    
    var confirmButtonTitle: String {
        switch self {
        case .initSelect:
            return "시작하기"
        case .change:
            return "변경하기"
        }
    }
}
