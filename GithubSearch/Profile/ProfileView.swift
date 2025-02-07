//
//  ProfileView.swift
//  GithubSearch
//
//  Created by Ricardo Silva Vale on 07/02/25.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            Text("Image perfil")
            Text("Name")
            
            ScrollView{
                VStack {
                    Text("Name Repositorie")
                    Text("linguage Repositorie")
                }
            }
        }
      
    }
}

#Preview {
    ProfileView()
}
