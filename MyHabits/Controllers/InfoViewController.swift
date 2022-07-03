//
//  InfoViewController.swift
//  MyHabits
//
//  Created by Aleksey Lexx on 03.07.2022.
//

import UIKit

class InfoViewController: UIViewController {
    
    private lazy var appearance = UINavigationBarAppearance()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    
    private func stupView() {
        
        view.backgroundColor = .white
    }
    
    private func setupNavigationBar() {
        
        navigationItem.title = "Информация"
        navigationController?.navigationBar.isTranslucent = true
        appearance.backgroundColor = .navigationColor
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        stupView()
    }
}
