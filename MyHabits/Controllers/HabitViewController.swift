//
//  HabitViewController.swift
//  MyHabits
//
//  Created by Aleksey Lexx on 04.07.2022.
//

import UIKit

class HabitViewController: UIViewController, UITextFieldDelegate {
    
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
        //textField.becomeFirstResponder()
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Бегать по утрам, спать 8 часов и т.п."
        textField.font = UIFont.systemFont(ofSize: 17, weight: .regular)
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
        label.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
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
    
    private func setupHabitScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(habitTextField)
        contentView.addSubview(colorTitleLabel)
        scrollView.keyboardDismissMode = .onDrag
        
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
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 21),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.heightAnchor.constraint(equalToConstant: 18),
            
            habitTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 7),
            habitTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            habitTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            habitTextField.heightAnchor.constraint(equalToConstant: 22),
            
            colorTitleLabel.topAnchor.constraint(equalTo: habitTextField.bottomAnchor, constant: 15),
            colorTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
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
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = keyboardSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        }
    }
  
    @objc func keyboardWillHide(notification: NSNotification) {
        scrollView.contentInset.bottom = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(scrollView)
        setupNavigationBar()
        setupHabitScrollView()
        //habitTextField.delegate = self
        gesture()
        
    }
}

