//
//  ContentView.swift
//  PhotoMania
//
//  Created by User on 12/07/2022.
//

import SwiftUI
// https://random.imagecdn.app/500/500

class ViewModel :ObservableObject {
    
    func fetchNewImage(){
        guard URL(string: "https://random.imagecdn.app/500/500") != nil else {
            return
        }
    }
}
struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Image(systemName: "photo").resizable().foregroundColor(Color.pink).frame(width: 200, height: 200).padding()
                Spacer()
                
                Button(action: {
                    // todo
                    
                }, label : {
                    Text("New Image !")
                        .bold()
                        .frame(width: 200, height: 40).foregroundColor(Color.white).background(Color.blue).cornerRadius(8)
                        .padding()
                }
                
                )
                
                
            }.navigationTitle("PhotoMania")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
