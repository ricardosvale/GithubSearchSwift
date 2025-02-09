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
                            if let error = error, error == "Usuário não encontrado" {
                                showErrorAlert = true
                                navigateToProfile = false
                            } else {
                                showErrorAlert = false
                                navigateToProfile = true
                            }
                        }
                    }) {
                        Text("Search")
                            .font(.headline)
                            .foregroundStyle(.blue)
                            .padding()
                    }
                    .disabled(homeViewModel.username.isEmpty)
                    .navigationDestination(isPresented: $navigateToProfile) {
                                            ProfileView(username: homeViewModel.username)
                                        }
                 }
                .alert(isPresented: $showErrorAlert) {
                    Alert(title: Text("Erro"), message: Text("Usuário não encontrado"), dismissButton: .default(Text("OK")))
                }
            }
                .ignoresSafeArea()
            }
        }
    }
    

#Preview {
    HomeView()
}
