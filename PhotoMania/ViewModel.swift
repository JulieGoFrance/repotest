//
//  ViewModel.swift
//  PhotoMania
//
//  Created by User on 14/07/2022.
//

import Foundation
import SwiftUI
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
