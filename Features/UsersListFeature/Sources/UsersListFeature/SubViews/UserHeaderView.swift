//
//  UserHeaderView.swift
//
//
//  Created by Hussam Elsadany on 24/02/2024.
//

import SwiftUI

struct UserHeaderView: View {
    
    let user: UserAdapter
    
    var body: some View {
        VStack(alignment: .leading, spacing: Sizes.spacing) {
            Text(user.name)
                .font(.headline)
            
            Text(user.address)
                .font(.body)
            
            Text("My Albums")
                .font(.headline)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

private extension UserHeaderView {
    struct Sizes {
        static let spacing: CGFloat = 16
    }
}
