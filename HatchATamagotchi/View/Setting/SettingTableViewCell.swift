//
//  SettingTableViewCell.swift
//  HatchATamagotchi
//
//  Created by 장예지 on 6/9/24.
//

import UIKit

class SettingTableViewCell: UITableViewCell {
    
    static var identifier = String(describing: SettingTableViewCell.self)
    
    lazy var config = self.defaultContentConfiguration()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureCell(){
        config.textProperties.font = DefaultFont.accentSmall
        config.secondaryTextProperties.font = DefaultFont.small
        config.imageProperties.tintColor = DefaultColor.tintColor
        config.imageProperties.maximumSize = CGSize(width: 20, height: 20)
        
        self.contentConfiguration = config
        self.accessoryType = .disclosureIndicator
    }
    
    func setData(type: SettingType, editName: String? = nil){
        config.text = type.title
        config.secondaryText = editName
        config.image = type.icon
        
        
        self.contentConfiguration = config
    }
}
