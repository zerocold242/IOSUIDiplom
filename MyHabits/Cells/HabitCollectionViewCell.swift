//
//  HabitCollectionViewCell.swift
//  MyHabits
//
//  Created by Aleksey Lexx on 20.07.2022.
//

import UIKit

class HabitCollectionViewCell: UICollectionViewCell {
    
    var habitTrack: (() -> Void)?
    
    var habit: Habit?
}

extension HabitCollectionViewCell: CustomIdentifier {
    static var identifier: String {
        return String(describing: self)
    }
}
