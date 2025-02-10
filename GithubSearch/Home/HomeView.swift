//
//  HomeView.swift
//  GithubSearch
//
//  Created by Ricardo on 07/02/25.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var homeViewModel = HomeViewModel()
    @State private var showErrorAlert = false
    @State private var navigateToProfile = false
    @State private var searchedUsername: String = ""
    @State private var errorMessage: String = ""
    
    var body: some View {
        NavigationStack {
            ZStack{
                Color(.white)
                VStack{
                    TextField("", text: $homeViewModel.username, prompt: Text("Username")
                        .foregroundStyle(Color.gray)
                              
                    )
                    .padding(8)
                    .autocapitalization(.none)
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color.gray.opacity(0.1))
                    )
                    .padding(.horizontal, 30)
                    
                    Button(action: {
                        homeViewModel.fetchUser { error in
                            if let error = error {
                                errorMessage = error
                                showErrorAlert = true
                                navigateToProfile = false
                            } else {
                                searchedUsername = homeViewModel.username
                                showErrorAlert = false
                                navigateToProfile = true
                            }
                        }
                        
                    }) {
                        if homeViewModel.isLoading {
                            ProgressView() // Mostra o indicador de carregamento
                                .progressViewStyle(CircularProgressViewStyle())
                                .padding()
                        } else {
                            Text("Search")
                                .font(.headline)
                                .foregroundStyle(.blue)
                                .padding()
                        }
                        
                    }   .navigationDestination(isPresented: $navigateToProfile) {
                        ProfileView(username: homeViewModel.username)
                    }
                }
                .alert(isPresented: $showErrorAlert) {
                    Alert(title: Text("Error"), message: Text(errorMessage), dismissButton: .default(Text("OK")))
                }
            }
        }
        .ignoresSafeArea()
    }
}



#Preview {
    HomeView()
}
