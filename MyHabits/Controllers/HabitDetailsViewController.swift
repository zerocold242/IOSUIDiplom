//
//  HabitDetailsViewController.swift
//  MyHabits
//
//  Created by Aleksey Lexx on 02.08.2022.
//

import UIKit

class HabitDetailsViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private func setupView() {
        view.addSubview(tableView)
        tableView.backgroundColor = .lightGrayColor
        
        NSLayoutConstraint.activate([
        tableView.topAnchor.constraint(equalTo: view.topAnchor),
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()

    }
}

extension HabitDetailsViewController: CustomIdentifier {
    static var identifier: String {
        return String(describing: self)
    }
}
