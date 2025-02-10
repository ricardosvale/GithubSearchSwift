//
//  ProfileView.swift
//  GithubSearch
//
//  Created by Ricardo Silva Vale on 07/02/25.
//

import SwiftUI

struct ProfileView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var profileViewModel: ProfileViewModel
    
    init(username: String) {
        _profileViewModel = StateObject(wrappedValue: ProfileViewModel(username: username))
    }
    
    var body: some View {
        
            NavigationStack {
                ZStack {
                    Color(.white)
                VStack {
                    VStack {
                        if let imageUrl = URL(string: profileViewModel.imageUrl) {
                            AsyncImage(url: imageUrl) { phase in
                                switch phase {
                                case .empty:
                                    ProgressView()
                                case .success(let image):
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 150, height: 150)
                                        .clipShape(Circle())
                                case .failure:
                                    Image(systemName: "person.crop.circle.badge.exclamationmark")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 150, height: 150)
                                        .clipShape(Circle())
                                        .foregroundStyle(.gray)
                                @unknown default:
                                    EmptyView()
                                }
                            }
                            
                            Text(profileViewModel.username)
                                .font(.title3)
                                .foregroundStyle(.black)
                                .padding(.top, 5)
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .background(Color.gray.opacity(0.1))
                    .zIndex(1)
                    
                    VStack {
                        ScrollView {
                            LazyVStack(alignment: .leading) {
                                ForEach(profileViewModel.repositories, id: \.name) { repository in
                                    VStack(alignment: .leading) {
                                        Text(repository.name)
                                            .font(.headline)
                                            .foregroundStyle(.black.opacity(0.6))
                                        Text(repository.language ?? "No language")
                                            .font(.subheadline)
                                            .foregroundStyle(.gray)
                                    }
                                    .padding(.vertical, 8)
                                    .padding(.horizontal, 15)
                                    
                                    if let errorMessage = profileViewModel.errorMessage {
                                        Text(errorMessage)
                                            .foregroundStyle(.red)
                                    }
                                    
                                    Divider()
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .background(.gray)
                                }
                            }
                        }
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            dismiss()
                        }) {
                        }
                    }
                }
                .padding(.top, 70)
                }
            .navigationBarTitleDisplayMode(.inline)
            .ignoresSafeArea()
        }
        
    }
}


#Preview {
    ProfileView(username: "ricardosvale")
}
