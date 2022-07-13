//
//  InfoViewController.swift
//  MyHabits
//
//  Created by Aleksey Lexx on 03.07.2022.
//

import UIKit

class InfoViewController: UIViewController {
    
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
    
    private lazy var headerTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Привычка за 21 день"
        label.font = .title3
        label.textColor = .black
        return label
    }()
    
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .body
        label.textColor = .black
        label.text = """

Прохождение этапов, за которые за 21 день вырабатывается привычка, подчиняется следующему алгоритму:

1. Провести 1 день без обращения к старым привычкам, стараться вести себя так, как будто цель, загаданная в перспективу, находится на расстоянии шага.

2. Выдержать 2 дня в прежнем состоянии самоконтроля.

3. Отметить в дневнике первую неделю изменений и подвести первые итоги — что оказалось тяжело, что — легче, с чем еще предстоит серьезно бороться.

4. Поздравить себя с прохождением первого серьезного порога в 21 день. За это время отказ от дурных наклонностей уже примет форму осознанного преодоления и человек сможет больше работать в сторону принятия положительных качеств.

5. Держать планку 40 дней. Практикующий методику уже чувствует себя освободившимся от прошлого негатива и двигается в нужном направлении с хорошей динамикой.

6. На 90-й день соблюдения техники все лишнее из «прошлой жизни» перестает напоминать о себе, и человек, оглянувшись назад, осознает себя полностью обновившимся.
"""
        return label
    }()
    
    private func setupNavigationBar() {
        
        navigationItem.title = "Информация"
        navigationController?.navigationBar.isTranslucent = true
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            headerTextLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 22),
            headerTextLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            headerTextLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            
            textLabel.topAnchor.constraint(equalTo: headerTextLabel.bottomAnchor, constant: 16),
            textLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            textLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            textLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -16)
        ])
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(headerTextLabel)
        contentView.addSubview(textLabel)
        setupNavigationBar()
        setupConstraints()
    }
}
