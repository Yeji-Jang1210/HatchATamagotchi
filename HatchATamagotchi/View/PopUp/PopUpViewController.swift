//
//  PopUpViewController.swift
//  HatchATamagotchi
//
//  Created by 장예지 on 6/6/24.
//

import UIKit
import SnapKit

class PopUpViewController: UIViewController, ConfigurableView {
    
    let backgroundView: UIView = {
        let object = UIView()
        object.backgroundColor = DefaultColor.background
        object.layer.cornerRadius = 8
        return object
    }()
    
    let characterView: CharacterView = {
       let object = CharacterView()
        return object
    }()
    
    let seperatorView: UIView = {
       let object = UIView()
        object.backgroundColor = DefaultColor.border
        return object
    }()
    
    let descriptionLabel: UILabel = {
        let object = UILabel()
        object.font = DefaultFont.medium
        object.textColor = DefaultColor.font
        object.numberOfLines = 0
        object.textAlignment = .center
        return object
    }()
    
    let buttonSeperatorView: UIView = {
        let object = UIView()
        object.backgroundColor = .darkGray
        return object
    }()
    
    let buttonStackView: UIStackView = {
        let object = UIStackView()
        object.axis = .horizontal
        object.distribution = .fillEqually
        object.alignment = .fill
        return object
    }()
    
    let cancelButton: UIButton = {
        let object = UIButton(type: .system)
        object.setTitle("취소", for: .normal)
        object.setTitleColor(DefaultColor.font, for: .normal)
        object.titleLabel?.font = DefaultFont.medium
        object.backgroundColor = .systemGray6
        return object
    }()
    
    let startButton: UIButton = {
        let object = UIButton(type: .system)
        object.setTitle("시작하기", for: .normal)
        object.setTitleColor(DefaultColor.font, for: .normal)
        object.titleLabel?.font = DefaultFont.medium
        object.backgroundColor = .clear
        return object
    }()
    
    var character: TamagotchiType? {
        didSet {
            characterView.imageView.image = character?.image
            characterView.nameLabel.setTitle(character?.name, for: .normal)
            descriptionLabel.text = character?.description
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        
        configureHierarchy()
        configureLayout()
        configureUI()
        
        bindAction()
    }
    
    func configureHierarchy() {
        view.addSubview(backgroundView)
        
        backgroundView.addSubview(characterView)
        backgroundView.addSubview(seperatorView)
        backgroundView.addSubview(descriptionLabel)
        backgroundView.addSubview(buttonSeperatorView)
        backgroundView.addSubview(buttonStackView)
        
        buttonStackView.addArrangedSubview(cancelButton)
        buttonStackView.addArrangedSubview(startButton)
    }
    
    func configureLayout() {
        backgroundView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(view.snp.height).multipliedBy(0.5)
            make.width.equalTo(backgroundView.snp.height).multipliedBy(0.75)
        }
        
        characterView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(backgroundView.snp.centerY).dividedBy(1.5)
            make.width.equalTo(backgroundView.snp.width).multipliedBy(0.4)
        }
        
        seperatorView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.75)
            make.height.equalTo(1)
            make.top.equalTo(characterView.snp.bottom).offset(20)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(seperatorView.snp.horizontalEdges)
            make.top.equalTo(seperatorView.snp.bottom).offset(20)
            make.bottom.greaterThanOrEqualTo(buttonSeperatorView.snp.top).offset(-20)
        }
        
        buttonSeperatorView.snp.makeConstraints { make in
            make.height.equalTo(0.5)
            make.bottom.equalTo(buttonStackView.snp.top)
            make.horizontalEdges.equalTo(backgroundView.snp.horizontalEdges)
        }
        
        buttonStackView.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(backgroundView.snp.horizontalEdges)
            make.bottom.equalTo(backgroundView.snp.bottom)
            make.height.equalTo(45)
        }
    }
    
    func configureUI() { }
    
    func bindAction(){
        let gesture = UITapGestureRecognizer(target: self, action: #selector(dismissPopUpView))
        view.addGestureRecognizer(gesture)
        
        cancelButton.addTarget(self, action: #selector(dismissPopUpView), for: .touchUpInside)
        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
    }
    
    @objc func dismissPopUpView(){
        dismiss(animated: true)
    }
    
    @objc func startButtonTapped(_ sender: UIButton){
        
    }
}
