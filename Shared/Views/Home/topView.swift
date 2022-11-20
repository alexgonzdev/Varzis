//
//  topView.swift
//  Sports News (iOS)
//
//  Created by Alex Gonzalez on 1/16/22.
//

import SwiftUI

struct topView: View {
    let pageName: String
    var body: some View {
        HStack {
            Text(pageName)
                .font(.system(size: 20, weight: .medium, design: .default))
                .foregroundColor(.white)
            Spacer()
        }.padding()
            .frame(maxWidth: .infinity, maxHeight: 80)
            .background(Color(0x1E232A))
    }
}
