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
        header.textColor = .systemGray
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
    
    private func setupNavigationBar() {
        navigationItem.title = "\(habit.name)"
        navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.tintColor = .purpleColor
        let rightBarButtonItem = UIBarButtonItem(title: "Править",
                                                 style: .done,
                                                 target: self,
                                                 action: #selector(editHabit))
        navigationItem.rightBarButtonItem = rightBarButtonItem
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
    
    @objc private func editHabit() {}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupNavigationBar()
    }
}

extension HabitDetailsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        HabitsStore.shared.dates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailsCell", for: indexPath)
        let habitIndex = abs(indexPath.row - HabitsStore.shared.dates.count + 1)
        cell.textLabel?.text = HabitsStore.shared.trackDateString(forIndex: habitIndex)
        let date = HabitsStore.shared.dates[habitIndex]
        if HabitsStore.shared.habit(habit, isTrackedIn: date) {
            cell.accessoryType = UITableViewCell.AccessoryType.checkmark
            cell.tintColor = .purpleColor
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 47
    }
}


