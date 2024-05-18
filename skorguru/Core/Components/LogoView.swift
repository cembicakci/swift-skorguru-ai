//
//  LogoView.swift
//  skorguru
//
//  Created by Cem Bıçakcı on 18.05.2024.
//

import SwiftUI

struct LogoView: View {
    
    let logoUrl: String
    let width: CGFloat = 72
    let height: CGFloat = 72
    
    var body: some View {
        if let logoUrl = URL(string: logoUrl) {
            AsyncImage(url: logoUrl) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: width, height: width)
                } else if phase.error != nil {
                    Image(systemName: "xmark.octagon")
                       .resizable()
                       .aspectRatio(contentMode: .fit)
                       .frame(width: width, height: width)
                } else {
                    ProgressView()
                        .frame(width: 40, height: 40)
                }
            }
        }
    }
}

#Preview {
    LogoView(logoUrl: "https://ati.codelisa.app/images/logos/6724.webp")
}
