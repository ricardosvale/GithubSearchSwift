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
    @State private var emptyUsernameAlert = false
    
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
//                        if homeViewModel.username.isEmpty {
//                           emptyUsernameAlert = true
//
//                        } else {
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
                        Text("Search")
                            .font(.headline)
                            .foregroundStyle(.blue)
                            .padding()
                    }
                    
                    .navigationDestination(isPresented: $navigateToProfile) {
                        ProfileView(username: homeViewModel.username)
                    }
                }
                .alert(isPresented: $showErrorAlert) {
                    Alert(title: Text("Erro"), message: Text(errorMessage), dismissButton: .default(Text("OK")))
                }
//                .alert(isPresented: $emptyUsernameAlert) {
//                    Alert(title: Text("Erro"), message: Text("Digite um usuário"), dismissButton: .default(Text("OK")))
                }
            }
            .ignoresSafeArea()
        }
    }



#Preview {
    HomeView()
}
