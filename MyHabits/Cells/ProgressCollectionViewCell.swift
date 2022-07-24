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
          
          NSLayoutConstraint.activate([
              titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
              titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
          ])
      }

    
    func refreshProgress() -> Void {
        }

    
}

extension ProgressCollectionViewCell: CustomIdentifier {
    static var identifier: String {
        return String(describing: self)
    }
}

