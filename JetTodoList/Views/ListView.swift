//
//  ListView.swift
//  JetTodoList
//
//  Created by Thor on 13/07/2021.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var mListViewModel : ListViewModel
    
    var body: some View {
        ZStack{
            if mListViewModel.items.isEmpty{
                NoItemView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            }else{
                List{
                    ForEach(mListViewModel.items){ item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear){
                                    mListViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: mListViewModel.deleteItem)
                    .onMove(perform: mListViewModel.moveItem)
                    
                }
                .listStyle(PlainListStyle())
            }
        }
        .navigationTitle("Jet Todo List 📝")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink(
                    "Add",
                    destination:
                        AddView())
        )
    }
    
}


struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}


