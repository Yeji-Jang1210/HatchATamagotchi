//
//  SettingType.swift
//  HatchATamagotchi
//
//  Created by 장예지 on 6/9/24.
//

import UIKit

enum SettingType: Int, CaseIterable {
    case editName = 0
    case changeTamagotchi = 1
    case reset = 2
    
    var title: String {
        switch self {
        case .editName:
            return "내 이름 설정하기"
        case .changeTamagotchi:
            return "다마고치 변경하기"
        case .reset:
            return "데이터 초기화"
        }
    }
    
    var icon: UIImage? {
        switch self {
        case .editName:
            return DefaultIcon.pencil.icon
        case .changeTamagotchi:
            return DefaultIcon.moon.icon
        case .reset:
            return DefaultIcon.refresh.icon
        }
    }
}

