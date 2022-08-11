//
//  ProgressCollectionViewCell.swift
//  MyHabits
//
//  Created by Aleksey Lexx on 20.07.2022.
//

import UIKit

protocol CustomIdentifier: AnyObject {
    static var identifier: String { get }
}

class ProgressCollectionViewCell: UICollectionViewCell {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Всё получится!"
        label.font = .footnoteStatus
        label.textColor = .systemGray
        return label
    }()
    
    private lazy var percentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .footnoteStatus
        label.textColor = .systemGray
        return label
    }()
    
    private lazy var progressView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.trackTintColor = .systemGray
        progressView.progressTintColor = .purpleColor
        return progressView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.layer.cornerRadius = 10
        contentView.backgroundColor = .white
        setupViews()
        refreshProgress()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(percentLabel)
        contentView.addSubview(progressView)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            
            percentLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            percentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            
            progressView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            progressView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            progressView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            progressView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15)
        ])
    }
    
    func refreshProgress() -> Void {
        percentLabel.text = "\(Int(HabitsStore.shared.todayProgress * 100))%"
        progressView.setProgress(HabitsStore.shared.todayProgress, animated: true)
    }
}

extension ProgressCollectionViewCell: CustomIdentifier {
    static var identifier: String {
        return String(describing: self)
    }
}

