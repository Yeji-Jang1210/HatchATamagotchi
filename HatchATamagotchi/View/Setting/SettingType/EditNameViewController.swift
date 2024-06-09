//
//  EditNameViewController.swift
//  HatchATamagotchi
//
//  Created by 장예지 on 6/9/24.
//

import UIKit
import SnapKit
import SwiftyUserDefaults
import Toast

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
        textField.text = Defaults.user
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(activeEndEditing))
        view.addGestureRecognizer(gesture)
    }
    
    func configureNavigationBar(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "저장", style: .done, target: self, action: #selector(editUserName))
    }
    
//MARK: - function
    @objc func editUserName(){
        guard let text = textField.text, !text.isEmpty else {
            let point = CGPoint(x: view.bounds.width / 2 , y: textField.frame.origin.y + 100)
            view.makeToast("올바른 이름을 입력하세요", point: point, title: nil, image: nil, completion: nil)
            return
        }
        
        Defaults.user = text
        navigationController?.popViewController(animated: true)
    }
    
    @objc func activeEndEditing(){
        view.endEditing(true)
    }
}
