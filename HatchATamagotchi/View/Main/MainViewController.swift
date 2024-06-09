//
//  MainViewController.swift
//  HatchATamagotchi
//
//  Created by 장예지 on 6/6/24.
//

import UIKit
import SnapKit
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
        object.text = Message.list.randomElement()
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
        let object = MainTextField()
        object.setData(placeholder: "밥주세용", buttonTitle: "밥먹기", buttonImage: DefaultIcon.feed.icon)
        object.button.tag = 0
        return object
    }()
    
    let waterTextField: MainTextField = {
        let object = MainTextField()
        object.setData(placeholder: "물주세용", buttonTitle: "물먹기", buttonImage: DefaultIcon.drink.icon)
        object.button.tag = 1
        return object
    }()
    
//MARK: - property
    var user: User?
    
 //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        configureHierarchy()
        configureLayout()
        configureUI()
        
        bindAction()
    }
//MARK: - configure
    func configureNavigationBar() {
        self.navigationItem.title = "\(navigationTitle)님의 다마고치"
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
            make.width.equalToSuperview().multipliedBy(0.6)
            make.height.equalTo(messageBubbleBackgroundView.snp.width).multipliedBy(0.6)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(40)
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
            make.top.equalTo(messageBubbleBackgroundView.snp.bottom).offset(12)
            make.width.equalTo(messageBubbleBackgroundView.snp.width).multipliedBy(0.8)
            make.centerX.equalToSuperview()
        }
        
        characterInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(characterView.snp.bottom).offset(12)
            make.centerX.equalToSuperview()
        }
        
        feedTextField.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.7)
            make.top.equalTo(characterInfoLabel.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
        }
        
        waterTextField.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.7)
            make.top.equalTo(feedTextField.snp.bottom).offset(12)
            make.centerX.equalToSuperview()
        }
    }
    
    func configureUI() {
        characterView.imageView.image = user?.tamagotchi.levelImage
        characterView.name = user?.tamagotchi.type.name
        characterInfoLabel.text = user?.tamagotchi.infoText
    }
//MARK: - function
    func bindAction(){
        feedTextField.button.addTarget(self, action: #selector(giveCareButtonTapped), for: .touchUpInside)
        waterTextField.button.addTarget(self, action: #selector(giveCareButtonTapped), for: .touchUpInside)
    }
    
    @objc func settingButtonTapped(){
        let vc = SettingViewController(navigationTitle: "설정")
        vc.user = user
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func giveCareButtonTapped(_ sender: UIButton){
        switch sender.tag {
        case 0:
            user?.tamagotchi.feed += convertTextFieldTextToInt(feedTextField.text)
            feedTextField.text = ""
        case 1:
            user?.tamagotchi.water += convertTextFieldTextToInt(waterTextField.text)
            waterTextField.text = ""
        default:
            return
        }
        
        characterInfoLabel.text = user?.tamagotchi.infoText
        characterView.imageView.image = user?.tamagotchi.levelImage
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
