//
//  ContentView.swift
//  PhotoMania
//
//  Created by User on 12/07/2022.
//

import SwiftUI
// https://random.imagecdn.app/500/500

class ViewModel :ObservableObject {
    @Published var image : Image?
    func fetchNewImage(){
        guard let url = URL(string: "https://random.imagecdn.app/500/500")  else {return}
        let task = URLSession.shared.dataTask(with: url) {
            data,_, _ in guard let data = data else {return}
        
            DispatchQueue.main.async {
                guard  let uiImage = UIImage(data: data) else {return}
                self.image = Image(uiImage : uiImage)
                }
            }
            task.resume()
        }
}

struct ContentView: View {
   @StateObject var viewModel = ViewModel()
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                if let image = viewModel.image{
        image.resizable().foregroundColor(Color.blue).frame(width: 200, height: 200).padding()
                }else {
                    Image(systemName: "photo").resizable().foregroundColor(Color.pink).frame(width: 200, height: 200).padding()
                }
               
                Spacer()
                
                Button(action: {
                    viewModel.fetchNewImage()
                    
                }, label : {
                    Text("New Image13h48 !")
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
