//
//  HomeView.swift
//  GithubSearch
//
//  Created by Ricardo on 07/02/25.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var homeViewModel = HomeViewModel()
    @State private var navigationProfile: String? = nil
    
    var body: some View {
        NavigationStack {
            ZStack{
                Color(.white)
                VStack{
                    TextField("", text: $homeViewModel.username, prompt: Text("Username")
                        .foregroundStyle(Color.gray)
                    )
                    .padding(8)
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color.gray.opacity(0.1))
                    )
                    .padding(.horizontal, 30)
                    
                    Button(action: {
                        navigationProfile = homeViewModel.username
                    }) {
                        Text("Search")
                            .font(.headline)
                            .foregroundStyle(.blue)
                            .padding()
                    }
                    .disabled(homeViewModel.username.isEmpty)
                    .navigationDestination(for: String.self) { username in
                        ProfileView(username: username)
                        
                    }
                }
                
            }
            .ignoresSafeArea()
        }
    }
}


#Preview {
    HomeView()
}
