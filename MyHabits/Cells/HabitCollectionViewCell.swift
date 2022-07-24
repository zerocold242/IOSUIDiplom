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
    
    var habit: Habit?
    
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
