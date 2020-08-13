//
//  DataTask.swift
//  HomeWorkToDo
//
//  Created by aluno on 11/08/20.
//  Copyright © 2020 Aluno. All rights reserved.
//

import UIKit

struct DataTaskModel {
    let typeStatus : ModelType
   // let titleTask : String
    //var taskContent: String
    
    enum ModelType{
        case create,executing,finish
        
        var typeimageStatus: UIImage? {
            switch self {
            case .create:
                return UIImage(systemName: "circle")!
            case .executing:
                return UIImage(systemName: "circle.lefhalf.fill")!
            case . finish:
                return UIImage(systemName: "circle.fill")!
            }
        }
    }
}
