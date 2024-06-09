//
//  EditNameViewController.swift
//  HatchATamagotchi
//
//  Created by 장예지 on 6/9/24.
//

import UIKit
import SnapKit

class EditNameViewController: TamagotchiVC {
    
//MARK: - object
    let textField: UITextField = {
        let object = UITextField()
        object.borderStyle = .none
        object.placeholder = "이름을 입력해 주세요"
        object.textColor = DefaultColor.font
        object.font = DefaultFont.accentMedium
        object.tintColor = DefaultColor.tintColor
        return object
    }()
    
    let textFieldLine: UIView = {
        let object = UIView()
        object.backgroundColor = DefaultColor.tintColor
        return object
    }()
    
//MARK: - property
    var user: User?

//MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        configureLayout()
        configureUI()
    }

//MARK: - configure
    func configureHierarchy(){
        view.addSubview(textField)
        view.addSubview(textFieldLine)
    }
    
    func configureLayout(){
        textField.snp.makeConstraints { make in
            make.horizontalEdges.top.equalTo(view.safeAreaLayoutGuide).inset(30)
            make.height.equalTo(44)
        }
        
        textFieldLine.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(textField.snp.horizontalEdges)
            make.top.equalTo(textField.snp.bottom)
            make.height.equalTo(1)
        }
    }
    
    func configureUI(){
        configureNavigationBar()
    }
    
    func configureNavigationBar(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "저장", style: .done, target: self, action: #selector(editUserName))
    }
    
//MARK: - function
    @objc func editUserName(){
        navigationController?.popToRootViewController(animated: true)
    }
    
}
