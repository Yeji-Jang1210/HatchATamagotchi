//
//  TamagotchiVC.swift
//  HatchATamagotchi
//
//  Created by 장예지 on 6/6/24.
//

import UIKit

protocol NavigationTitle {
    var navigationTitle: String? { get set }
}

protocol ConfigurableView {
    func configureHierarchy()
    func configureLayout()
    func configureUI()
}

class TamagotchiVC: UIViewController, NavigationTitle {
    var navigationTitle: String?
    
    init(navigationTitle: String? = nil) {
        if let navigationTitle {
            self.navigationTitle = navigationTitle
        }
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = DefaultColor.background
        
        
        navigationItem.scrollEdgeAppearance = UINavigationBarAppearance()
        navigationItem.scrollEdgeAppearance?.titleTextAttributes = [.foregroundColor: DefaultColor.font]
        navigationItem.scrollEdgeAppearance?.backgroundColor = DefaultColor.background
        navigationItem.scrollEdgeAppearance?.shadowColor = .clear
        
        navigationItem.title = navigationTitle
        navigationController?.navigationBar.tintColor = DefaultColor.tintColor

    }
}
