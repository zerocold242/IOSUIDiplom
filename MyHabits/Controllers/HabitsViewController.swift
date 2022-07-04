//
//  HabitsViewController.swift
//  MyHabits
//
//  Created by Aleksey Lexx on 03.07.2022.
//

import UIKit

class HabitsViewController: UIViewController {
    
    private lazy var appearance = UINavigationBarAppearance()
    
    private func setupView() {
        view.backgroundColor = .systemBackground
        
    }
    
    private func setupNavigationBar() {
        
        navigationItem.title = "Сегодня"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.isTranslucent = true
        appearance.backgroundColor = .navigationColor
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(openHabit))
    }
    
    @objc func openHabit() {
        
        let habitVC = HabitViewController(habit: nil)
        let habitNavigationVC = UINavigationController(rootViewController: habitVC)
        habitNavigationVC.modalPresentationStyle = .fullScreen
        present(habitNavigationVC, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupView()
    }
}
