//
//  CharacterView.swift
//  HatchATamagotchi
//
//  Created by 장예지 on 6/6/24.
//

import UIKit
import SnapKit

class CharacterView: UIView, ConfigurableView {
    
    let backgroundView: UIStackView = {
        let object = UIStackView()
        object.axis = .vertical
        object.distribution = .fill
        object.alignment = .center
        object.spacing = 4
        return object
    }()
    
    let disabledOverlayView: UIView = {
        let object = UIView()
        object.clipsToBounds = true
        object.isHidden = true
        object.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        return object
    }()
    
    let imageView: UIImageView = {
        let object = UIImageView()
        object.contentMode = .scaleAspectFit
        object.backgroundColor = .clear
        return object
    }()
    
    let nameLabel: UIButton = {
        let object = UIButton(type: .system)
        object.titleLabel?.font = DefaultFont.accentSmall
        object.tintColor = DefaultColor.font
        object.isUserInteractionEnabled = false
        object.contentEdgeInsets = UIEdgeInsets(top: 0, left: 6, bottom: 0, right: 6)
        object.layer.cornerRadius = 4
        object.layer.borderWidth = 1
        object.layer.borderColor = DefaultColor.border.cgColor
        return object
    }()
    
    var isDisabled: Bool = true {
        didSet {
            disabledOverlayView.isHidden = !isDisabled
        }
    }
    
    var name: String? {
        didSet {
            nameLabel.setTitle(name, for: .normal)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureHierarchy()
        configureLayout()
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureHierarchy() {
        addSubview(backgroundView)
        addSubview(disabledOverlayView)
        backgroundView.addArrangedSubview(imageView)
        backgroundView.addArrangedSubview(nameLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        disabledOverlayView.layoutIfNeeded()
        disabledOverlayView.layer.cornerRadius = disabledOverlayView.bounds.width / 2
    }
    
    func configureLayout() {
        backgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        imageView.snp.makeConstraints { make in
            make.height.equalTo(backgroundView.snp.width).multipliedBy(1)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.height.equalTo(24)
        }
        
        disabledOverlayView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
            make.size.equalTo(imageView.snp.size)
        }
    }
    
    func configureUI() {
        self.backgroundColor = .clear
    }
    
}

