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
    
    private lazy var timeTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "ВРЕМЯ"
        label.font = .footnoteBold
        label.textColor = .black
        return label
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
    
    private func setupView() {
        
        view.addSubview(titleLabel)
        view.addSubview(habitTextField)
        view.addSubview(colorTitleLabel)
        view.addSubview(colorButton)
        view.addSubview(timeTitleLabel)
        
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
            
            timeTitleLabel.topAnchor.constraint(equalTo: colorButton.bottomAnchor, constant: 15),
            timeTitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
        ])
    }
    
    private func delegat() {
        
        if let habit = habit {
            habitTextField.text = habit.name
            colorButton.backgroundColor = habit.color
        }
    }
    
    func gesture() {
        let gesture = UITapGestureRecognizer()
        gesture.cancelsTouchesInView = false
        gesture.addTarget(self, action: #selector(self.gestureAction))
        self.view.addGestureRecognizer(gesture)
    }
    
    @objc private func gestureAction() {
        self.view.endEditing(true)
    }
    
    @objc private func saveButton() {}
    
    @objc private func cancelButton() {}
    
    @objc private func selectColor() {
        
        let colorPicker = UIColorPickerViewController()
        colorPicker.delegate = self
        colorPicker.selectedColor = self.colorButton.backgroundColor ?? .white
        self.present(colorPicker, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupNavigationBar()
        setupView()
        habitTextField.delegate = self
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
    
    //Скрытие keyboard при нажатии клавиши Return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        habitTextField.resignFirstResponder()
        return true
    }
}


