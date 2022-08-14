//
//  HabitViewController.swift
//  MyHabits
//
//  Created by Aleksey Lexx on 04.07.2022.
//

import UIKit

protocol HabitViewControllerDelegate: AnyObject {
    func didSaveNewHabit()
    func didReloadHabit(for index: Int)
}

class HabitViewController: UIViewController {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "НАЗВАНИЕ"
        label.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var habitTextField: UITextField = {
        let textField = UITextField()
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Бегать по утрам, спать 8 часов и т.п."
        textField.font = .body
        textField.textColor = .black
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.keyboardType = UIKeyboardType.default
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.clipsToBounds = true
        textField.returnKeyType = UIReturnKeyType.done
        textField.isEnabled = true
        textField.isUserInteractionEnabled = true
        return textField
    }()
    
    private lazy var colorTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "ЦВЕТ"
        label.font = .footnoteBold
        label.textColor = .black
        return label
    }()
    
    private lazy var colorButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .orangeColor
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(selectColor), for: .touchUpInside)
        return button
    }()
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "ВРЕМЯ"
        label.font = .footnoteBold
        label.textColor = .black
        return label
    }()
    
    private lazy var everyDayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Каждый день в "
        label.font = .body
        label.textColor = .black
        return label
    }()
    
    private lazy var timePickerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .purpleColor
        label.font = .body
        return label
    }()
    
    private lazy var timePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.datePickerMode = .time
        picker.preferredDatePickerStyle = .wheels
        picker.addTarget(self, action: #selector(setTime), for: .valueChanged)
        return picker
    }()
    
    private lazy var deleteButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Удалить привычку", for: .normal)
        button.setTitleColor(.systemRed, for: .normal)
        button.titleLabel?.font = .body
        button.addTarget(self, action: #selector(deleteHabitButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var onRemove: (() -> Void)?
    
    weak var delegate: HabitViewControllerDelegate?
    
    private lazy var appearance = UINavigationBarAppearance()
    
    private var habit: Habit?
    
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
    
    private func setupView() {
        
        view.addSubview(titleLabel)
        view.addSubview(habitTextField)
        view.addSubview(colorTitleLabel)
        view.addSubview(colorButton)
        view.addSubview(timeLabel)
        view.addSubview(everyDayLabel)
        view.addSubview(timePickerLabel)
        view.addSubview(timePicker)
        view.addSubview(deleteButton)
        
        NSLayoutConstraint.activate ([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 21),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -285),
            titleLabel.heightAnchor.constraint(equalToConstant: 18),
            
            habitTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 7),
            habitTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            habitTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -65),
            // habitTextField.heightAnchor.constraint(equalToConstant: 22),
            
            colorTitleLabel.topAnchor.constraint(equalTo: habitTextField.bottomAnchor, constant: 15),
            colorTitleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            colorTitleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant:  -323),
            
            colorButton.topAnchor.constraint(equalTo: colorTitleLabel.bottomAnchor, constant: 7),
            colorButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            colorButton.heightAnchor.constraint(equalToConstant: 30),
            colorButton.widthAnchor.constraint(equalTo: colorButton.heightAnchor),
            
            timeLabel.topAnchor.constraint(equalTo: colorButton.bottomAnchor, constant: 15),
            timeLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            everyDayLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 7),
            everyDayLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            timePickerLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 7),
            timePickerLabel.leadingAnchor.constraint(equalTo: everyDayLabel.trailingAnchor),
            
            timePicker.topAnchor.constraint(equalTo: timePickerLabel.bottomAnchor, constant: 15),
            timePicker.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            timePicker.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            deleteButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -52),
            deleteButton.heightAnchor.constraint(equalToConstant: 22),
            deleteButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func deleteHabit() {
        HabitsStore.shared.habits.removeAll{$0 == self.habit}
        dismiss(animated: false, completion: onRemove)
    }
    
    private func delegat() {
        if let habit = habit {
            habitTextField.text = habit.name
            colorButton.backgroundColor = habit.color
        }
    }
    
    private func gesture() {
        let gesture = UITapGestureRecognizer()
        gesture.cancelsTouchesInView = false
        gesture.addTarget(self, action: #selector(self.gestureAction))
        self.view.addGestureRecognizer(gesture)
    }
    
    @objc private func gestureAction() {
        self.view.endEditing(true)
    }
    
    @objc private func saveButton() {
        guard let text = habitTextField.text, !text.isEmpty else {
            let alertVC = UIAlertController(title: "Так не получится!", message: "Введи название привычки", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .destructive, handler: nil)
            alertVC.addAction(action)
            self.present(alertVC, animated: true, completion: nil)
            return
        }
        guard let color = colorButton.backgroundColor else {
            return
        }
        
        if let habit = habit {
            guard let index = HabitsStore.shared.habits.firstIndex(of: habit) else {
                return
            }
            habit.name = text
            habit.color = color
            habit.date = timePicker.date
            HabitsStore.shared.habits[index] = habit
            dismiss(animated: true) {
                self.delegate?.didReloadHabit(for: index)
            }
        } else {
            let habit = Habit(name: text, date: timePicker.date, color: color)
            let store = HabitsStore.shared
            store.habits.append(habit)
            dismiss(animated: true){
                self.delegate?.didSaveNewHabit()
            }
        }
    }
    
    @objc private func cancelButton() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func selectColor() {
        let colorPicker = UIColorPickerViewController()
        colorPicker.delegate = self
        colorPicker.selectedColor = self.colorButton.backgroundColor ?? .white
        self.present(colorPicker, animated: true, completion: nil)
    }
    
    @objc private func setTime() {
        let dateFormater = DateFormatter()
        dateFormater.dateStyle = .none
        dateFormater.timeStyle = .short
        timePickerLabel.text = dateFormater.string(from: timePicker.date)
    }
    
    @objc private func deleteHabitButton() {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupNavigationBar()
        setupView()
        gesture()
        delegat()
    }
}

extension HabitViewController: UIColorPickerViewControllerDelegate {
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        self.colorButton.backgroundColor = viewController.selectedColor
    }
    
    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        self.colorButton.backgroundColor = viewController.selectedColor
    }
}

extension HabitViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        habitTextField.resignFirstResponder()
        return true
    }
}


