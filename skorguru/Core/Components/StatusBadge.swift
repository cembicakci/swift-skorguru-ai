//
//  StatusBadge.swift
//  skorguru
//
//  Created by Cem Bıçakcı on 18.05.2024.
//

import SwiftUI

struct StatusBadge: View {
    let text: String
    let type: BadgeType
    
    var body: some View {
        Text(text)
            .font(.caption)
            .fontWeight(.bold)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(type.color)
            .foregroundColor(.white)
            .cornerRadius(4)
    }
}

enum BadgeType {
    case success, danger, warning
    
    var color: Color {
        switch self {
        case .success:
            return .green
        case .danger:
            return .red
        case .warning:
            return .orange
        }
    }
    
}

#Preview {
    StatusBadge(text: "Tamamlandı", type: .success)
}
