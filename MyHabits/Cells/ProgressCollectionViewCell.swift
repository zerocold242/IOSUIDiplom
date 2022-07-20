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
    
}

extension ProgressCollectionViewCell: CustomIdentifier {
    static var identifier: String {
        return String(describing: self)
    }
}

