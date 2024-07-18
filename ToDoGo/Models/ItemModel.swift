//
//  ItemModel.swift
//  ToDoGo
//
//  Created by Seher Ayesha on 18/02/2024.
//

import Foundation

//Immutable Struct

struct ItemModel : Identifiable, Codable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool){
        
        //id: String = UUID().uuidString ===>> with this parameter in here, we basically can initialize an item model with an id if we give it a string.
        //OR without an id, and it will automatically create one.
        //so anywhere in the app, if we call item model, open the parentheses, you will get 2 initializer here
        //ONE: where we want to add the id directly
        //an other item model, we dont have an option of adding an id and it will automatically create the id for us
//        ItemModel(title: <#T##String#>, isCompleted: <#T##Bool#>)
//        ItemModel(id: <#T##String#>, title: <#T##String#>, isCompleted: <#T##Bool#>)
        //So this first model will be use to CREATE items
        //and the second model (with id) will be used to CHANGE/UPDATE items
        
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
 
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}


