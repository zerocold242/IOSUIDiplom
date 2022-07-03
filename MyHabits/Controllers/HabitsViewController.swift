//
//  HabitsViewController.swift
//  MyHabits
//
//  Created by Aleksey Lexx on 03.07.2022.
//

import UIKit

class HabitsViewController: UIViewController {
    
    private lazy var appearance = UINavigationBarAppearance()
    
    private func setupNavigationBar() {
        
        navigationItem.title = "Сегодня"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.isTranslucent = true
        appearance.backgroundColor = .navigationColor
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        view.backgroundColor = .systemBackground

    }
}
