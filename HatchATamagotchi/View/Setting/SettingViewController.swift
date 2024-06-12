//
//  SettingViewController.swift
//  HatchATamagotchi
//
//  Created by 장예지 on 6/6/24.
//

import UIKit
import SnapKit
import SwiftyUserDefaults

class SettingViewController: TamagotchiVC, ConfigurableView {
//MARK: - object
    let tableView: UITableView = {
        let object = UITableView()
        return object
    }()
    
//MARK: - lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    
        configureHierarchy()
        configureLayout()
        configureUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadRows(at: [IndexPath(row: 0, section: 0)], with: .none)
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
            cell.setData(type: type, editName: Defaults.user)
        default:
            cell.setData(type: type)
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let type = SettingType(rawValue: indexPath.row) else { return }
        
        switch type {
        case .editName:
            guard let user = Defaults.user else { return }
            let vc = EditNameViewController(navigationTitle: "\(user)님 이름 정하기")
            navigationController?.pushViewController(vc, animated: true)
        case .changeTamagotchi:
            let vc = SelectTamagotchiViewController(navigationTitle: SelectTamagotciVCType.change.navigationTitle)
            vc.type = SelectTamagotciVCType.change
            navigationController?.pushViewController(vc, animated: true)
            return
        case .reset:
            showAlert()
            return
        }
    }
    
    func showAlert(){
        let alert = UIAlertController(title: "데이터 초기화", message: "정말 처음부터 시작하실 건가용?", preferredStyle: .alert)
        
        let confirmAction = UIAlertAction(title: "웅", style: .default) { action in
            let vc = SelectTamagotchiViewController(navigationTitle: SelectTamagotciVCType.initSelect.navigationTitle)
            vc.type = SelectTamagotciVCType.initSelect
            
            let nvc = UINavigationController(rootViewController: vc)
            nvc.modalPresentationStyle = .overFullScreen
            
            //initialize tamagotchi
            Defaults.user = nil
            Defaults.tamagotchi = .none
            Defaults.feed = 0
            Defaults.water = 0
            
            self.present(nvc, animated: true)
        }
        
        let cancelAction = UIAlertAction(title: "아닝", style: .cancel)
        
        alert.addAction(cancelAction)
        alert.addAction(confirmAction)
        
        present(alert, animated: true)
    }
}
