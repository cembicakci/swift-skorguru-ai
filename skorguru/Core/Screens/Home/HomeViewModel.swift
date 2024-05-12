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
    
    @Published var matchData: [Response] = []
    @Published var infoData: [Info] = []
    @Published var selectedDate = Date()
    @Published var isLoading = true
    
    
    @State var type = "0"
    
        
    func fetchData() async {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        let formattedDate = dateFormatter.string(from: selectedDate)
        
        do {
            let jsonData = try JSONEncoder().encode(RequestBody(date: formattedDate, type: type))
            
            let endpoint = MockEndpointProtocol(path: "matchs", httpMethod: .post, body: jsonData)
            let response: MatchResponse = try await NetworkManager.shared.request(endpoint)
            
            self.matchData = response.response
            self.infoData = response.info
            
        } catch {
            // Handle error
            print("Error fetching data: \(error)")
        }
        
        self.isLoading = false
    }
    
}

