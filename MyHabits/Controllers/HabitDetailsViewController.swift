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
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "detailsCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private lazy var header: UILabel = {
        let header = UILabel()
        header.translatesAutoresizingMaskIntoConstraints = false
        header.backgroundColor = .systemGray
        header.font = .footnote
        header.text = "АКТИВНОСТЬ"
        return header
    }()
    
    private var habit: Habit
    
    init (habit: Habit) {
        self.habit = habit
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        view.addSubview(tableView)
        tableView.backgroundColor = .lightGrayColor
        tableView.addSubview(header)
        
        NSLayoutConstraint.activate([
        tableView.topAnchor.constraint(equalTo: view.topAnchor),
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        
        header.topAnchor.constraint(equalTo: tableView.topAnchor, constant: 22),
        header.leadingAnchor.constraint(equalTo: tableView.leadingAnchor, constant: 16)
        ])
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()

    }
}

extension HabitDetailsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        HabitsStore.shared.dates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailsCell", for: indexPath)
        
        return cell
    }
    
}

//extension HabitDetailsViewController: CustomIdentifier {
//    static var identifier: String {
//        return String(describing: self)
//    }
//}
