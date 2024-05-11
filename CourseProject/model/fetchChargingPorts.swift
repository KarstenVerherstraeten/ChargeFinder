//
//  fetchChargingPorts.swift
//  CourseProject
//
//  Created by Karsten Verherstraeten on 19/04/2024.
//

import Foundation

struct ChargingPortsResponse: Decodable {
    let results: [ChargingPort]
}

class FetchChargingPorts: ObservableObject {
    @Published var posts: [ChargingPort] = []

    func fetchPosts() {
        if let cachedData = loadCachedData() {
            self.posts = cachedData
        }
        
        guard let url = URL(string: "https://opendata.brussels.be/api/explore/v2.1/catalog/datasets/bornes-de-recharge-pour-voitures-electriques/records?limit=6") else { return }

        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
                // If there's an error fetching data, use cached data
                if let cachedData = self?.loadCachedData() {
                    DispatchQueue.main.async {
                        self?.posts = cachedData
                    }
                }
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                let chargingPortsResponse = try JSONDecoder().decode(ChargingPortsResponse.self, from: data)
                DispatchQueue.main.async {
                    self?.posts = chargingPortsResponse.results
                    // Save fetched data to cache
                    self?.saveDataToCache(chargingPortsResponse.results)
                }
            } catch {
                print("Error decoding data: \(error)")
            }
        }
        task.resume()
    }
    
    private func loadCachedData() -> [ChargingPort]? {
        // Load cached data from UserDefaults or CoreData
        // For simplicity, let's assume we're storing it in UserDefaults
        if let data = UserDefaults.standard.data(forKey: "cachedChargingPorts"),
           let cachedData = try? JSONDecoder().decode([ChargingPort].self, from: data) {
            return cachedData
        }
        return nil
    }
    
    private func saveDataToCache(_ data: [ChargingPort]) {
        // Save data to cache (UserDefaults or CoreData)
        // For simplicity, let's assume we're storing it in UserDefaults
        if let encodedData = try? JSONEncoder().encode(data) {
            UserDefaults.standard.set(encodedData, forKey: "cachedChargingPorts")
        }
    }
}
