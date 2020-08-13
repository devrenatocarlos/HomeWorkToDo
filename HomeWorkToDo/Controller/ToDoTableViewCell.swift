//
//  ToDoTableViewCell.swift
//  HomeWorkToDo
//
//  Created by aluno on 09/08/20.
//  Copyright © 2020 Aluno. All rights reserved.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {
    var st = 1
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var status: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
    }
    
    func configureCell(_ task: DataTask){
        title.text = task.taskTitle
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        status.isUserInteractionEnabled = true
        status.addGestureRecognizer(tapGestureRecognizer)
    }
    
}
extension ToDoTableViewCell {
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        // And some actions
        if st == 3 {st = 0}
        switch(st){
        case 0:
            tappedImage.image = UIImage(systemName : "circle")
        case 1:
            tappedImage.image = UIImage(systemName: "circle.lefthalf.fill")
        case 2:
            tappedImage.image = UIImage(systemName: "circle.fill")
            
        default: break
        }
        st += 1
    }
}
