//
//  HomeViewModel.swift
//  GithubSearch
//
//  Created by Ricardo on 08/02/25.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    
    @Published var username: String  = ""
    @Published var isLoading: Bool = false
    private let service = Service()
    
    func fetchUser(completion: @escaping (String?) -> Void) {
        
        let formattedUsername = username.trimmingCharacters(in: .whitespacesAndNewlines)
        isLoading = true
        service.fetchRepositoriesGit(for: formattedUsername) { result in
            self.isLoading = false
            switch result {
            case .success(_):
                completion(nil)
            case .failure(let error):
                let nsError = error as NSError
                if nsError.code == -1009 {
                    completion("A network error has occurred. Check your Internet connection and try again later.")
                } else if nsError.code == -404 {
                    completion("User not found. Please enter another name")
                } else {
                    completion(error.localizedDescription)
                }
            }
        }
    }
}
