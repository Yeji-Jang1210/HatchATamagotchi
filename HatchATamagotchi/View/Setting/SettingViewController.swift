//
//  SettingViewController.swift
//  HatchATamagotchi
//
//  Created by 장예지 on 6/6/24.
//

import UIKit
import SnapKit

class SettingViewController: TamagotchiVC, ConfigurableView {
//MARK: - object
    let tableView: UITableView = {
        let object = UITableView()
        return object
    }()

    public var user: User?
    
//MARK: - lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    
        configureHierarchy()
        configureLayout()
        configureUI()
    }
//MARK: - configure
    func configureHierarchy() {
        view.addSubview(tableView)
    }
    
    func configureLayout() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func configureUI() {
        configureTableView()
        configureNavigationBar()
    }
    
    func configureNavigationBar(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: DefaultIcon.back.icon, style: .done, target: self, action: #selector(dismissButtonTapped))
    }
    
    func configureTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.identifier)
    }

//MARK: - function
    @objc func dismissButtonTapped(){
        navigationController?.popViewController(animated: true)
    }
}

extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SettingType.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.identifier, for: indexPath) as! SettingTableViewCell
        
        guard let type = SettingType(rawValue: indexPath.row) else {
            return cell
        }
        
        switch type {
        case .editName:
            cell.setData(type: type, editName: user?.name)
        default:
            cell.setData(type: type)
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let type = SettingType(rawValue: indexPath.row) else { return }
        
        switch type {
        case .editName:
            guard let user = user else { return }
            let vc = EditNameViewController(navigationTitle: "\(user.name)님 이름 정하기")
            vc.user = user
            navigationController?.pushViewController(vc, animated: true)
        case .changeTamagotchi:
            let vc = SelectTamagotchiViewController(navigationTitle: SelectTamagotciVCType.change.navigationTitle)
            vc.type = SelectTamagotciVCType.change
            navigationController?.pushViewController(vc, animated: true)
            return
        case .reset:
            return
        }
    }
}
