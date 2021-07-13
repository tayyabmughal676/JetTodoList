//
//  ListViewModel.swift
//  JetTodoList
//
//  Created by Thor on 13/07/2021.
//

import Foundation

class ListViewModel: ObservableObject{
    
    @Published var items: [itemModel] = [] {
        didSet{
            saveItems()
        }
    }
    
    let itemsKey : String = "items_list"
    
    init() {
        getItems()
    }
    
    func getItems() {
        //        let newItem = [
        //            itemModel(title: "This is the first", isCompleted: false),
        //            itemModel(title: "This is the second", isCompleted: false),
        //            itemModel(title: "This is the third", isCompleted: false),
        //            itemModel(title: "This is the fourth", isCompleted: true),
        //        ]
        //        items.append(contentsOf: newItem)
        
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let saveItems = try? JSONDecoder().decode([itemModel].self, from: data)
        else {return}
        
        self.items = saveItems
    }
    
    
    //    Delete Item
    func deleteItem(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
    
    //    Move Item
    
    func moveItem(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    //    Add Item
    func addItem(title: String) {
        let newItem = itemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    //    Update
    
    func updateItem(item: itemModel){
        
        //        if let index = items.firstIndex{ (existingItem) -> Bool in
        //            return existingItem.id = item.id
        //        }
        
        if let index = items.firstIndex(where: {$0.id == item.id}){
            items[index] = item.updateCompletion()
        }
    }
    
    //    Save Items in Local Storage
    func saveItems(){
        if let encodedData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
    
}


