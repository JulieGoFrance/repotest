//
//  ContentView.swift
//  PhotoMania
//
//  Created by User on 12/07/2022.
//

import SwiftUI

struct ContentView: View {
   @StateObject var viewModel = ViewModel()
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                if let image = viewModel.image{
                    ZStack {
                        image.resizable().foregroundColor(Color.blue).frame(width: 200, height:200).padding()
                    }.frame(width: UIScreen.main.bounds.width / 1.2, height: UIScreen.main.bounds.height / 2)
                        .background(Color.pink).cornerRadius(8)
                    
                }
                
                else {
                    Image(systemName: "photo").resizable().foregroundColor(Color.blue).frame(width: 200, height: 200).padding()
                }
               
                Spacer()
                
                Button(action: {
                    viewModel.fetchNewImage()
                    
                }, label : {
                    Text("Changer d'image :) ")
                        .bold()
                        .frame(width: 200, height: 40).foregroundColor(Color.white).background(Color.blue).cornerRadius(8)
                        .padding()
                }
                
                )
                
                
            }.navigationTitle("Premiere application")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
