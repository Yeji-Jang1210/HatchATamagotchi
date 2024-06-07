//
//  InitCollectionViewCell.swift
//  HatchATamagotchi
//
//  Created by 장예지 on 6/6/24.
//

import UIKit

class InitCollectionViewCell: UICollectionViewCell {
    
    static var identifier: String = String(describing: InitCollectionViewCell.self)
    
    let characterView: CharacterView = {
        let object = CharacterView()
        return object
    }()
    
    let tapArea: UIButton = {
        let object = UIButton(type: .system)
        return object
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureHierarchy()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureHierarchy(){
        contentView.addSubview(characterView)
        contentView.addSubview(tapArea)
    }
    
    private func configureLayout(){
        characterView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        tapArea.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    public func setData(type: TamagotchiType){
        characterView.nameLabel.setTitle(type.name, for: .normal)
        characterView.imageView.image = type.image
        
        if type == .none {
            characterView.isDisabled = true
        }
    }
}
