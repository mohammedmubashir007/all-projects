//
//  HomeViewModel.swift
//  CryptoPrice
//
//  Created by Mohammed Mubashir on 07/03/23.
//

import Foundation

class ActivityViewModel:ObservableObject {
    @Published var activity = [Activity]()
  
    
    init(){
        fetchActivityData()
       
    }
    
    func fetchActivityData() {
        let urlString = "https://www.boredapi.com/api/activity"
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Error: Invalid response")
                return
            }
            
            if !(200...299).contains(httpResponse.statusCode) {
                print("Error: Unexpected response \(httpResponse.statusCode)")
                return
            }
            
            guard let data = data else {
                print("Error: No data returned")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let activity = try decoder.decode(Activity.self, from: data)
                DispatchQueue.main.async {
                    self.activity = [activity]
                    print(activity.activity)
                    print(activity.type)
                }
            } catch {
                print("Error: \(error.localizedDescription)")
            }
            
        }.resume()
    }
    
}
