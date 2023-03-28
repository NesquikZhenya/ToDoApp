//
//  TodoTableViewCell.swift
//  todo
//
//  Created by Евгений Михневич on 05.07.2022.
//

import UIKit

class TodoTableViewCell: UITableViewCell {

    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var priorityView: UIView!
    
    func updateCell(todo: Todo) {
        itemLabel.text = todo.item
        switch todo.priority {
        case 0: priorityView.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
            break
        case 1: priorityView.backgroundColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
            break
        case 2: priorityView.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            break
        default: priorityView.backgroundColor = .black
        }
    }

}
