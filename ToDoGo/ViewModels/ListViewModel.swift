//
//  ListViewModel.swift
//  ToDoGo
//
//  Created by Seher Ayesha on 18/02/2024.
//

import Foundation

/*
 CRUD Functions
 Create
 Read
 Update
 Delete
 
 */

class ListViewModel : ObservableObject {

    @Published var items: [ItemModel] = []{
        //whenever the items array is changed, it should save in the Userdefaults
        didSet {
            saveItems()
        }
    }
    
    let itemsKey: String = "items_list"
    
    init(){
        getItems()
    }
    
    func getItems (){
        
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        
        //if we get the data, we continue down here
        
        self.items = savedItems
    }
    
    func deleteItem(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String){
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel){
        //first get the index
        if let index = items.firstIndex(where:  { $0.id == item.id}){
            items[index] = item.updateCompletion()
        }
    }
    
    func saveItems(){
        //convert data model into JSON format in order to save in User Defaults
        //make data model struct Codable
        
        if let encodedData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}
