//
//  NoItemView.swift
//  JetTodoList
//
//  Created by Thor on 13/07/2021.
//

import SwiftUI

struct NoItemView: View {
    
    @State var animate: Bool = false
    
    let secondaryAccentColor = Color("SecondaryAccentColor")
    
    var body: some View {
        ScrollView{
            VStack(spacing: 10){
                Text("There are no Items!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Are you a produtive person? I think you should click the add button and add a bunch of items to your TODO list!")
                    .padding(.bottom, 20)
                
                NavigationLink(
                    destination: AddView(),
                    label: {
                        Text("Add Something!")
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background( animate ? secondaryAccentColor : Color.accentColor)
                            .cornerRadius(12)
                    })
                    .padding(.horizontal, animate ? 30 : 50)
                    .shadow(
                        color: animate ? secondaryAccentColor.opacity(0.7) : Color.accentColor.opacity(0.7),
                        radius: animate ? 30 : 10,
                        x: 0,
                        y: animate ? 50 : 30
                    )
                    .scaleEffect(animate ? 1.1 : 1.0)
                    .offset(y: animate ? -7 : 0)
                
            }
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
            
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
    }
    
    func addAnimation(){
        guard !animate else {return}
        DispatchQueue
            .main
            .asyncAfter(deadline: .now() + 1.5){
                withAnimation(
                    Animation
                        .easeIn(duration: 2.0)
                        .repeatForever()
                ){
                    animate.toggle()
                }
            }
    }
    
}

struct NoItemView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            NoItemView()
                .navigationTitle("Title")
        }
    }
}
