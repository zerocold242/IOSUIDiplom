//
//  HabitCollectionViewCell.swift
//  MyHabits
//
//  Created by Aleksey Lexx on 20.07.2022.
//

import UIKit

class HabitCollectionViewCell: UICollectionViewCell {
    
    private lazy var habitLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .headLine
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .caption
        label.textColor = .systemGray2
        return label
    }()
    
    private lazy var counterLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .footnote
        label.textColor = .systemGray
        return label
    }()
    
    private lazy var colorButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "checkmark"), for: .normal)
        button.backgroundColor = .white
        button.tintColor = .white
        button.layer.cornerRadius = 19
        button.layer.borderWidth = 3
        button.addTarget(self, action: #selector(onColorButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var habitTrack: (() -> Void)?
    
    var habit: Habit? {
        didSet {
            if let habit = habit {
                habitLabel.text = habit.name
                habitLabel.textColor = habit.color
                timeLabel.text = habit.dateString
                counterLabel.text = "Счётчик: \(habit.trackDates.count)"
                colorButton.layer.borderColor = habit.color.cgColor
                
                if habit.isAlreadyTakenToday {
                    colorButton.backgroundColor = habit.color
                } else {
                    colorButton.backgroundColor = .white
                }
            }
        }
    }
    
    private func setupCell() {
        contentView.addSubview(habitLabel)
        contentView.addSubview(timeLabel)
        contentView.addSubview(counterLabel)
        contentView.addSubview(colorButton)
        
        NSLayoutConstraint.activate([
            habitLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            habitLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            habitLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -88),
            
            timeLabel.topAnchor.constraint(equalTo: habitLabel.bottomAnchor, constant: 4),
            timeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            counterLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            counterLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            
            colorButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            colorButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            colorButton.heightAnchor.constraint(equalToConstant: 38),
            colorButton.widthAnchor.constraint(equalTo: colorButton.heightAnchor)
        ])
    }
    
    @objc func onColorButton() {
        if habit?.isAlreadyTakenToday == false {
            colorButton.backgroundColor = habit?.color
            HabitsStore.shared.track(habit!)
            counterLabel.text = "Счётчик: \(habit!.trackDates.count)"
            habitTrack?()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.layer.cornerRadius = 10
        contentView.backgroundColor = .white
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HabitCollectionViewCell: CustomIdentifier {
    static var identifier: String {
        return String(describing: self)
    }
}
