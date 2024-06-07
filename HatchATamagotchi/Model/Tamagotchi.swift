//
//  Tamagotchi.swift
//  HatchATamagotchi
//
//  Created by 장예지 on 6/6/24.
//

import UIKit

struct TamagotchiList {
    static var list = TamagotchiType.allCases
}

enum TamagotchiType: Int, CaseIterable {
    case prickly = 1
    case beaming = 2
    case twinkling = 3
    case none = 0
    
    var image: UIImage? {
        switch self {
        case .prickly, .beaming, .twinkling:
            return UIImage(named: "\(self.rawValue)-6")
        case .none:
            return UIImage(named: "1-1")
        }
    }
    
    var name: String {
        switch self {
        case .prickly:
            return "따끔따끔 다마고치"
        case .beaming:
            return "방실방실 다마고치"
        case .twinkling:
            return "반짝반짝 다마고치"
        case .none:
            return "준비중이에요"
        }
    }
    
    var description: String {
        switch self {
        case .prickly:
            return "나는 따끔따끔 다마고치!!! 🐾\n깃 푸시를 깜빡할때마다 따끔따끔 공격할거다!!\n 보기에는 따끔따끔해보여도 마음 여린 다마고치라구😤\n잘부탁해 따끔따끔! 😊🌟"
        case .beaming:
            return "저는 방실방실 다마고치입니당😊\n키는 100km, 몸무게는 150톤이에용\n성격은 화끈하고 날라다닙니당~!\n열심히 잘 먹고 잘 클 자신은 있답니다 방실방실!"
        case .twinkling:
            return "숨겨도 twinkle 어쩌나~✨ 눈에 확 띄잖아~🌟\n저는 반짝반짝 다마고치에요 반짝반짝!\n 눈부신 저를 감당할수 있다면 저와 함께해요 우훗~😘"
        case .none:
            return "아직 준비중이에요"
        }
    }
}

struct Tamagotchi {
    
    let type: TamagotchiType
    var feed: Int = 0
    var water: Int = 0
    
    var level: Int {
        var count = 0
        
        if feed != 0 {
            count += (feed / 5)
        }
        
        if water != 0 {
            count += (water / 2)
        }
        
        switch count {
        case 0..<20:
            return 1
        case 20..<30:
            return 2
        case 30..<40:
            return 3
        case 40..<50:
            return 4
        case 50..<60:
            return 5
        case 60..<70:
            return 6
        case 70..<80:
            return 7
        case 80..<90:
            return 8
        case 90..<100:
            return 9
        default:
            return 10
        }
        
    }
    
    var levelImage: UIImage? {
        let lev = level == 10 ? 9 : level
        guard let image = UIImage(named: "\(self.type.rawValue)-\(lev)") else {
            return nil
        }
        return image
    }
    
    var infoText: String {
        return "LV\(level) · 밥알 \(feed)개 · 물방울 \(water)개"
    }
}
