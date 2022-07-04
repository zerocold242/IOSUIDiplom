//
//  HabitViewController.swift
//  MyHabits
//
//  Created by Aleksey Lexx on 04.07.2022.
//

import UIKit

class HabitViewController: UIViewController {
    
    private lazy var appearance = UINavigationBarAppearance()
    
    private var habit: Habit?
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    init (habit: Habit?) {
        self.habit = habit
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupNavigationBar() {
        
        if habit == nil {
            navigationItem.title = "Создать"
            navigationItem.largeTitleDisplayMode = .never
            navigationController?.navigationBar.tintColor = .purpleColor
            appearance.backgroundColor = .navigationColor
            navigationController?.navigationBar.scrollEdgeAppearance = appearance
            let rightBarButtonItem = UIBarButtonItem(title: "Сохранить",
                                                     style: .done,
                                                     target: self,
                                                     action: #selector(saveButton))
            navigationItem.rightBarButtonItem = rightBarButtonItem
            let leftBarButtonItem = UIBarButtonItem(title: "Отменить",
                                                    style: .done,
                                                    target: self,
                                                    action: #selector(cancelButton))
            navigationItem.leftBarButtonItem = leftBarButtonItem
            
        } else {
            
            navigationItem.title = "Править"
            navigationController?.navigationBar.tintColor = .purpleColor
            appearance.backgroundColor = .navigationColor
            navigationController?.navigationBar.scrollEdgeAppearance = appearance
            let rightBarButtonItem = UIBarButtonItem(title: "Сохранить",
                                                     style: .done,
                                                     target: self,
                                                     action: #selector(saveButton))
            navigationItem.rightBarButtonItem = rightBarButtonItem
            let leftBarButtonItem = UIBarButtonItem(title: "Отменить",
                                                    style: .done,
                                                    target: self,
                                                    action: #selector(cancelButton))
            navigationItem.leftBarButtonItem = leftBarButtonItem
        }
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate ([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        ])
    }
    
    @objc private func saveButton() {}
    
    @objc private func cancelButton() {}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        view.backgroundColor = .white
        setupNavigationBar()
        setupConstraints()
    }
}
