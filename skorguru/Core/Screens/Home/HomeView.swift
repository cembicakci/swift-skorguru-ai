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
    
    @ObservedObject private var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationStack {
            Form {
                
                if viewModel.isLoading {
                    ProgressView()
                } else {
                    
                        Section {
                            Picker(selection: $selectedLeague) {
                                ForEach(Array(viewModel.matchData.indices), id:\.self) { index in
                                    Text(viewModel.matchData[index].league)
                                }
                            } label: {
                                
                            }
                            .pickerStyle(.navigationLink)
                        } header: {
                            Text("Lig Seçiniz")
                        }
                    
                    List {
                        ForEach(viewModel.matchData[selectedLeague].matchs, id:\.id) { match in
                            Text(match.homeTeam)
                        }
                    }
                    
                    
        
                }
                
            }
            .navigationTitle("Skorguru Ai")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    DatePicker(selection: $viewModel.selectedDate, displayedComponents: .date) {
                        Text("Tarih Seçiniz")
                    }
                    .datePickerStyle(.automatic)
                    .labelsHidden()
                }
            }
            .onChange(of: viewModel.selectedDate) {
                Task {
                    await viewModel.fetchData()
                
                }
            }
            .onAppear {
                Task {
                    await viewModel.fetchData()
                
                }
            }
        }
        
    }
}

#Preview {
    HomeView()
}
