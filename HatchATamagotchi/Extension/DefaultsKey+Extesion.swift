//
//  DefaultsKey+Extesion.swift
//  HatchATamagotchi
//
//  Created by 장예지 on 6/10/24.
//

import Foundation
import SwiftyUserDefaults

extension DefaultsKeys {
    var user: DefaultsKey<String?>{.init("user", defaultValue: nil)}
    var tamagotchi: DefaultsKey<TamagotchiType>{.init("tamagotchi", defaultValue: TamagotchiType.none)}
    var feed: DefaultsKey<Int>{.init("feed", defaultValue: 0)}
    var water: DefaultsKey<Int>{.init("water", defaultValue: 0)}
}
