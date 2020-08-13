//
//  ViewController.swift
//  HomeWorkToDo
//
//  Created by aluno on 03/08/20.
//  Copyright © 2020 Aluno. All rights reserved.
//

import UIKit

final class ViewController:  UIViewController {
    var taskTitle: String!
    
    @IBOutlet weak var tfTask: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let nib = UINib(nibName: "ToDoTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        tfTask.delegate = self
        tfTask.becomeFirstResponder()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == tfTask{
            guard let item = tfTask.text, !item.isEmpty else { return false }
            SingletonTodo.shared.dataTask.append(DataTask(taskTitle: item, status: 0,taskContent: ""))

            tfTask.text = ""
            tableView.reloadData()
        }
    
        return true
    }
}
extension ViewController: UITableViewDataSource,UITableViewDelegate{
   
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SingletonTodo.shared.dataTask.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ToDoTableViewCell
        
        let dataTask = SingletonTodo.shared.dataTask[indexPath.row]
        cell.configureCell(dataTask)
        
        return cell
    }
    
    //func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
      //  return .delete
    //}
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = ContentTaskViewController(nibName: "ContentTaskViewController", bundle: nil)
        self.navigationController?.pushViewController(viewController, animated: true)

        viewController.index = indexPath.row
    }
    
}
