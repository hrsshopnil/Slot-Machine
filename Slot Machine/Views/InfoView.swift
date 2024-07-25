//
//  InfoView.swift
//  Slot Machine
//
//  Created by shopnil hasan on 21/7/24.
//

import SwiftUI

struct InfoView: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        VStack {
            LogoView()
                .padding(.bottom)
            Spacer()
            Form {
                Section {
                    FormRowView(firstItem: "Application", secondItem: "Slot Machine")
                    FormRowView(firstItem: "Platforms", secondItem: "Iphone, Ipad, Mac")
                    FormRowView(firstItem: "Developer", secondItem: "Shopnil Hasan")
                    FormRowView(firstItem: "Designer", secondItem: "Robert Petras")
                    FormRowView(firstItem: "Music", secondItem: "Dan Lebowitz")
                    FormRowView(firstItem: "Copywright", secondItem: "© All right reserved")
                    FormRowView(firstItem: "Version", secondItem: "1.0.0")
                } header: {
                    Text("About The Application")
                        .textCase(.none)
                        .bold()
                }
            }
            
        }
        .overlay (
            Button {
                dismiss()
            } label: {
                Image(systemName: "xmark.circle")
            }
                .font(.title)
                .bold()
                .foregroundStyle(.gray),
            alignment: .topTrailing
        )
        .padding(.top)
        .frame(maxWidth: 720)
    }
}

struct FormRowView: View {
    let firstItem: String
    let secondItem: String
    var body: some View {
        HStack {
            Text(firstItem)
                .foregroundStyle(.gray)
            Spacer()
            Text(secondItem)
        }
    }
}
#Preview {
    InfoView()
}
