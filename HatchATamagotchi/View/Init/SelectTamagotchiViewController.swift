//
//  SelectTamagotchiViewController.swift
//  HatchATamagotchi
//
//  Created by 장예지 on 6/6/24.
//

import UIKit
import SnapKit
import Toast

class SelectTamagotchiViewController: TamagotchiVC, ConfigurableView {
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        let object = UICollectionView(frame: .zero, collectionViewLayout: layout)
        object.backgroundColor = .clear
        return object
    }()
    
    let sectionInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    var type: SelectTamagotciVCType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        configureLayout()
        configureUI()
    }
    
    func configureHierarchy() {
        view.addSubview(collectionView)
    }
    
    func configureLayout() {
        collectionView.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalToSuperview()
        }
    }
    
    func configureUI() {
        configureCollectionView()
    }
    
    func configureCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(SelectTamagotchiCollectionViewCell.self, forCellWithReuseIdentifier: SelectTamagotchiCollectionViewCell.identifier)
    }
    
    @objc func tamagotchiTapped(_ sender: UIButton){
        print(sender.tag)
        if sender.tag >= 0 && sender.tag < 3 {
            let vc = PopUpViewController()
            
            vc.modalTransitionStyle = .coverVertical
            vc.modalPresentationStyle = .overFullScreen
            
            vc.selectType = type
            vc.character = TamagotchiType(rawValue: sender.tag+1)!
            
            present(vc, animated: true)
            return
        }
        view.makeToast("지금은 준비중이에요")
    }
}

extension SelectTamagotchiViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SelectTamagotchiCollectionViewCell.identifier, for: indexPath) as! SelectTamagotchiCollectionViewCell
        
        switch indexPath.row {
        case 0:
            cell.setData(type: .prickly)
        case 1:
            cell.setData(type: .beaming)
        case 2:
            cell.setData(type: .twinkling)
        default:
            cell.setData(type: .none)
        }
        
        cell.tapArea.tag = indexPath.row
        cell.tapArea.addTarget(self, action: #selector(tamagotchiTapped), for: .touchUpInside)
        return cell
    }
}

extension SelectTamagotchiViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        
        let itemsPerRow: CGFloat = 3
        let widthPadding = sectionInsets.left * (itemsPerRow + 1)
        let cellWidth = (width - widthPadding) / itemsPerRow
        
        
        return CGSize(width: cellWidth, height: cellWidth+28)
    }
}
