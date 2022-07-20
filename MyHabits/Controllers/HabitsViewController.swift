//
//  HabitsViewController.swift
//  MyHabits
//
//  Created by Aleksey Lexx on 03.07.2022.
//

import UIKit

class HabitsViewController: UIViewController {
  
    private lazy var collectionView: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            return collectionView
        }()

    
    private func setupView() {
        view.backgroundColor = .systemBackground
        view.addSubview(collectionView)
         collectionView.backgroundColor = .lightGrayColor
         
         NSLayoutConstraint.activate([
             collectionView.topAnchor.constraint(equalTo: view.topAnchor),
             collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
             collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
             collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
         ])

        
    }
    
    private func setupNavigationBar() {
        
        navigationItem.title = "Сегодня"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.isTranslucent = true
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
