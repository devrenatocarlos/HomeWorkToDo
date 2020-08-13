//
//  SingletonToDo.swift
//  HomeWorkToDo
//
//  Created by aluno on 03/08/20.
//  Copyright © 2020 Aluno. All rights reserved.
//

import Foundation

struct DataTask {
    
    let taskTitle: String
    var status : Int
    var taskContent : String
}

final class SingletonTodo {
    
    static let shared = SingletonTodo()
    private init() {}

    var listTasks: [String] = []
    var dataTask: [DataTask] = []
    var dataTaskModel : [DataTaskModel] = []
    
    func setContent(content:String,index:Int){
        dataTask[index].taskContent = content
    }
}
