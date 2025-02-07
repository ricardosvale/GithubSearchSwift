//
//  HomeView.swift
//  GithubSearch
//
//  Created by Ricardo on 07/02/25.
//

import SwiftUI

struct HomeView: View {
    @State private var username: String = ""
    var body: some View {
        ZStack{
            Color(.white)
            VStack{
                TextField("", text: $username, prompt: Text("Username")
                    .foregroundStyle(Color.gray)
                )
                .padding(8)
                .background(
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color.gray.opacity(0.1))
                )
                .padding(.horizontal, 30)
                
                Button(action: {
                }) {
                    Text("Search")
                        .font(.headline)
                        .foregroundStyle(.blue)
                        .padding()
                }
                .disabled(username.isEmpty)
            }
            
        }
        .ignoresSafeArea()
    }
}


#Preview {
    HomeView()
}
