//
//  MainTextField.swift
//  HatchATamagotchi
//
//  Created by 장예지 on 6/7/24.
//

import UIKit
import SnapKit

class MainTextField: UIView, ConfigurableView {
    
    let backgroundView: UIView = {
        let object = UIView()
        object.backgroundColor = .clear
        return object
    }()
    
    let textField: UITextField = {
        let object = UITextField()
        object.setContentHuggingPriority(.init(249), for: .horizontal)
        object.borderStyle = .none
        object.textAlignment = .center
        object.font = DefaultFont.accentMedium
        return object
    }()
    
    let seperatorLine: UIView = {
        let object = UIView()
        object.setContentHuggingPriority(.init(249), for: .horizontal)
        object.backgroundColor = DefaultColor.border
        return object
    }()
    
    let button: UIButton = {
        let object = UIButton(type: .system)
        object.layer.borderColor = DefaultColor.border.cgColor
        object.layer.borderWidth = 1
        object.contentEdgeInsets = .init(top: 4, left: 4, bottom: 4, right: 12)
        object.titleEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: -8)
        object.layer.cornerRadius = 4
        object.titleLabel?.font = DefaultFont.accentMedium
        object.tintColor = DefaultColor.tintColor
        object.titleLabel?.font = DefaultFont.accentSmall
        return object
    }()
    
    var text: String? {
        get {
            return textField.text
        }
        
        set {
            textField.text = newValue
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
        self.addSubview(backgroundView)
        backgroundView.addSubview(textField)
        backgroundView.addSubview(seperatorLine)
        backgroundView.addSubview(button)
    }
    
    func configureLayout() {
        
        backgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        textField.snp.makeConstraints { make in
            make.leading.verticalEdges.equalToSuperview()
            make.trailing.equalTo(button.snp.leading).offset(-12)
        }
        
        seperatorLine.snp.makeConstraints { make in
            make.width.equalTo(textField.snp.width)
            make.horizontalEdges.equalTo(textField.snp.horizontalEdges)
            make.bottom.equalToSuperview()
            make.height.equalTo(1)
        }
        
        button.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }
    
    func configureUI() {
        
    }
    
    public func setData(placeholder: String, buttonTitle: String, buttonImage: UIImage?){
        textField.placeholder = placeholder
        button.setTitle(buttonTitle, for: .normal)
        button.setImage(buttonImage, for: .normal)
    }
}
