//
//  MainViewController.swift
//  HatchATamagotchi
//
//  Created by 장예지 on 6/6/24.
//

import UIKit
import SnapKit
import SwiftyUserDefaults
import Toast

class MainViewController: TamagotchiVC, ConfigurableView {
   
//MARK: - object
    
    let messageBubbleBackgroundView: UIView = {
        let object = UIView()
        object.backgroundColor = .clear
        return object
    }()
    
    let messageBubbleImageView: UIImageView = {
        let object = UIImageView()
        object.contentMode = .scaleAspectFit
        object.image = DefaultIcon.bubble.icon
        return object
    }()
    
    let messageLabel: UILabel = {
        let object = UILabel()
        object.font = DefaultFont.accentMedium
        object.textColor = DefaultColor.font
        object.textAlignment = .center
        object.numberOfLines = 0
        return object
    }()
    
    let characterView: CharacterView = {
       let object = CharacterView()
        object.nameLabel.titleLabel?.font = DefaultFont.accent
        return object
    }()
    
    let characterInfoLabel: UILabel = {
        let object = UILabel()
        object.font = DefaultFont.accentMedium
        object.textColor = DefaultColor.font
        return object
    }()
    
    let feedTextField: MainTextField = {
        let object = MainTextField(type: LevelUpType.feed)
        object.button.tag = 0
        return object
    }()
    
    let waterTextField: MainTextField = {
        let object = MainTextField(type: LevelUpType.water)
        object.button.tag = 1
        return object
    }()
    
//MARK: - property
    lazy var tamagotchi = Tamagotchi(type: Defaults.tamagotchi)
    
 //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        configureHierarchy()
        configureLayout()
        configureUI()
        
        bindAction()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let user = Defaults.user {
            self.navigationItem.title = "\(user)님의 다마고치"
        }
        messageLabel.text = Message.list.randomElement()
    }
    
//MARK: - configure
    func configureNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: DefaultIcon.person.icon, style: .done, target: self, action: #selector(settingButtonTapped))
        
    }
    
    func configureHierarchy() {
        
        view.addSubview(messageBubbleBackgroundView)
        view.addSubview(characterView)
        view.addSubview(characterInfoLabel)
        view.addSubview(feedTextField)
        view.addSubview(waterTextField)
        
        messageBubbleBackgroundView.addSubview(messageBubbleImageView)
        messageBubbleBackgroundView.addSubview(messageLabel)
    }
    
    func configureLayout() {

        messageBubbleBackgroundView.snp.makeConstraints { make in
            make.top.lessThanOrEqualTo(view.safeAreaLayoutGuide).offset(40)
            make.width.equalToSuperview().multipliedBy(0.6)
            make.height.equalTo(messageBubbleBackgroundView.snp.width).multipliedBy(0.6)
            make.bottom.equalTo(characterView.snp.top).offset(-20)
            make.centerX.equalToSuperview()
        }
        
        messageBubbleImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        messageLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(20)
            make.top.equalToSuperview().offset(20)
            make.bottom.equalToSuperview().offset(-40)
        }
        
        characterView.snp.makeConstraints { make in
            make.bottom.equalTo(characterInfoLabel.snp.top).offset(-12)
            make.width.equalTo(messageBubbleBackgroundView.snp.width).multipliedBy(0.8)
            make.centerX.equalToSuperview()
        }
        
        characterInfoLabel.snp.makeConstraints { make in
            make.bottom.equalTo(feedTextField.snp.top).offset(-24)
            make.height.equalTo(24)
            make.centerX.equalToSuperview()
        }
        
        feedTextField.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.7)
            make.bottom.equalTo(waterTextField.snp.top).offset(-12)
            make.height.equalTo(36)
            make.centerX.equalToSuperview()
        }
        
        waterTextField.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.7)
            make.centerX.equalToSuperview()
            make.height.equalTo(36)
            make.bottom.greaterThanOrEqualTo(view.keyboardLayoutGuide.snp.top).offset(-50)
        }
    }
    
    func configureUI() {
        characterView.imageView.image = tamagotchi.levelImage
        characterView.name = tamagotchi.type.name
        characterInfoLabel.text = tamagotchi.infoText
    }
//MARK: - function
    func bindAction(){
        let gesture = UITapGestureRecognizer(target: self, action: #selector(activeEndEditing))
        view.addGestureRecognizer(gesture)
        
        feedTextField.button.addTarget(self, action: #selector(giveCareButtonTapped), for: .touchUpInside)
        waterTextField.button.addTarget(self, action: #selector(giveCareButtonTapped), for: .touchUpInside)
    }
    
    @objc func activeEndEditing(){
        view.endEditing(true)
    }
    
    @objc func settingButtonTapped(){
        let vc = SettingViewController(navigationTitle: "설정")
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func giveCareButtonTapped(_ sender: UIButton){
        switch sender.tag {
        case 0:
            Defaults.feed += convertTextFieldTextToInt(feedTextField.text)
            feedTextField.text = ""
        case 1:
            Defaults.water += convertTextFieldTextToInt(waterTextField.text)
            waterTextField.text = ""
        default:
            return
        }
        
        characterInfoLabel.text = tamagotchi.infoText
        characterView.imageView.image = tamagotchi.levelImage
        messageLabel.text = Message.list.randomElement()
    }
    
    func convertTextFieldTextToInt(_ text: String?) -> Int {
        guard let text else {
            view.makeToast("잘못된 값입니다.")
            return 0
        }
        
        if text.isEmpty {
            return 1
        }
        
        guard let value = Int(text) else {
            view.makeToast("숫자를 입력해 주세요.")
            return 0
        }
        
        return value
    }
}
