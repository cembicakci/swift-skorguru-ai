//
//  HomeView.swift
//  skorguru
//
//  Created by Cem Bıçakcı on 8.05.2024.
//

import SwiftUI

struct League: Identifiable {
    let id: Int
    let name: String
}

struct HomeView: View {
    
    @State private var selectedLeague = 0
    @State private var selectedDate = Date()
    
    let leagues = [
        League(id: 0, name: "Premier League"),
        League(id: 1, name: "La Liga"),
        League(id: 2, name: "Serie A"),
        League(id: 3, name: "Bundesliga"),
        League(id: 4, name: "Ligue 1")
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Picker(selection: $selectedLeague) {
                    ForEach(leagues) { league in
                        Text(league.name).tag(league.id)
                    }
                } label: {
                    Text("Lig Seçiniz")
                }
                .pickerStyle(.navigationLink)
                
            }
            .navigationTitle("Skorguru Ai")
            .padding(.horizontal)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    DatePicker(selection: $selectedDate, displayedComponents: .date) {
                        Text("Tarih Seçiniz")
                    }
                    .datePickerStyle(.automatic)
                    .labelsHidden()
                }
            }
        }
        
    }
}

#Preview {
    HomeView()
}
