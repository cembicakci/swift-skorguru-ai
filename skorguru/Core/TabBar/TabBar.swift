//
//  TabBar.swift
//  skorguru
//
//  Created by Cem Bıçakcı on 8.05.2024.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                }
            
            Text("Profil")
                .tabItem {
                    Image(systemName: "person")
                }
        }
    }
}

#Preview {
    TabBar()
}
