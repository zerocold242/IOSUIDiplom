//
//  InfoViewController.swift
//  MyHabits
//
//  Created by Aleksey Lexx on 03.07.2022.
//

import UIKit

class InfoViewController: UIViewController {
    
    private lazy var appearance = UINavigationBarAppearance()
    
    private func setupNavigationBar() {
        
        navigationItem.title = "Информация"
        navigationController?.navigationBar.isTranslucent = true
        appearance.backgroundColor = .navigationColor
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupNavigationBar()
    }
}
