//
//  HomeViewModel.swift
//  skorguru
//
//  Created by Cem Bıçakcı on 9.05.2024.
//

import Foundation
import SwiftUI

struct RequestBody: Codable {
    let date: String
    let type: String
}

@MainActor
class HomeViewModel: ObservableObject {
    
    @Published var matchData: [MatchData] = []
    @Published var infoData: [Info] = []
    
    @State var date = "2024-12-12"
    @State var type = "0"
    
    init() {
        Task {
            await fetchData()
        }
    }
    
    
    func fetchData() async {
        do {
            
        
            let jsonData = try JSONEncoder().encode(RequestBody(date: date, type: type))
            
            let endpoint = MockEndpointProtocol(path: "matchs", httpMethod: .post, body: jsonData)
            let response: MatchResponse = try await NetworkManager.shared.request(endpoint)
            print(response)
            
            self.matchData = response.response
        } catch {
            // Handle error
            print("Error fetching data: \(error)")
        }
        
    }
    
}

