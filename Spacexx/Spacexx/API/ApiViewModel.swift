//
//  ApiViewModel.swift
//  Spacexx
//
//  Created by Mohammed Mubashir on 29/03/23.
//

import Foundation

class SpaceAPI : ObservableObject {
    @Published var news : [SpaceData] = []
    
    
    func getData() {
        guard let url = URL(string: "https://api.spaceflightnewsapi.net/v3/articles") else {return}
        
        URLSession.shared.dataTask(with: url) { data , response , error in
            guard let data = data else {
                let tempError = error!.localizedDescription
                DispatchQueue.main.async {
                    
                          self.news = [SpaceData(id: 0, title: tempError, url: "Error", imageUrl: "Error", newsSite: "Error", summary: "Try swiping down to refresh as soon as you have internet again.", publishedAt: "Error")]
                }
                return
            }
            
            let spaceData = try! JSONDecoder().decode([SpaceData].self, from: data)
            DispatchQueue.main.async {
                print("Loaded data succesfully")
                self.news = spaceData
            }
            
        }.resume()
      
    }
    
}
