//
//  HabitsViewController.swift
//  MyHabits
//
//  Created by Aleksey Lexx on 03.07.2022.
//

import UIKit

class HabitsViewController: UIViewController {
    
    private func setupView() {
        view.backgroundColor = .systemBackground
    }
    
    private func setupNavigationBar() {
        
        navigationItem.title = "Сегодня"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.isTranslucent = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addHabit))
    }
    
    @objc func addHabit() {}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupView()
    }
}
