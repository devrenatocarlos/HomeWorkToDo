//
//  ContentTaskViewController.swift
//  HomeWorkToDo
//
//  Created by aluno on 09/08/20.
//  Copyright © 2020 Aluno. All rights reserved.
//

import UIKit

final class ContentTaskViewController: UIViewController,UITextViewDelegate {
    
    
    var taskTitle: String!
    var index: Int!
    //var content: String!
    
    @IBOutlet weak var lbTaskTitle: UILabel!
    
    @IBOutlet weak var tvTaskContent: UITextView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
       self.lbTaskTitle.text = SingletonTodo.shared.dataTask[index].taskTitle
        //tvTaskContent.text = SingletonTodo.shared.dataTask[index].taskContent
        // Do any additional setup after loading the view.
        //tvTaskContent.text = SingletonTodo.shared.dataTask[index].taskContent
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        tvTaskContent.text = SingletonTodo.shared.dataTask[index].taskContent
        //tvTaskContent.text = content
        //print(SingletonTodo.shared.dataTask[index].taskContent)
    }
    
    @IBAction func btSaveTaskContent(_ sender: Any) {
        
        SingletonTodo.shared.setContent(content: tvTaskContent.text, index: index)
        navigationController?.popViewController(animated: true)
       
    }
}
