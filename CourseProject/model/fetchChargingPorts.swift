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

    func fetchPosts(){
        guard let url = URL(string: "https://opendata.brussels.be/api/explore/v2.1/catalog/datasets/bornes-de-recharge-pour-voitures-electriques/records?limit=5") else {return}

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
                return
            }
            guard let data = data else {
                print("No data received")
                return
            }
            do {
                let chargingPortsResponse = try JSONDecoder().decode(ChargingPortsResponse.self, from: data)
                DispatchQueue.main.async {
                    self.posts = chargingPortsResponse.results
                }
            } catch {
                print("Error decoding data: \(error)")
            }
        }
        task.resume()
    }
}

