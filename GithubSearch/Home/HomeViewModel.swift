//
//  HomeViewModel.swift
//  GithubSearch
//
//  Created by Ricardo on 08/02/25.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    
    @Published var username: String  = ""
    
    private let service = Service()
    
    func fetchUser(completion: @escaping (String?) -> Void) {
       
        let formattedUsername = username.trimmingCharacters(in: .whitespacesAndNewlines)
       
        service.fetchRepositoriesGit(for: formattedUsername) { result in
            switch result {
            case .success(_):
                completion(nil)
            case .failure(let error):
               let nsError = error as NSError
                if nsError.code == 404 {
                    completion("Usuário não encontrado")
                    
                } else if nsError.code == -1009 {
                    completion("Ocorreu um erro de rede. Verifique sua conexão com a Internet e tente novamente.")
               } else {
                    completion(error.localizedDescription)
                   print("Erro\(completion(error.localizedDescription))")
                }
                
            }
        }
    }
}
