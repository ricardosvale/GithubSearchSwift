//
//  ProfileView.swift
//  GithubSearch
//
//  Created by Ricardo Silva Vale on 07/02/25.
//

import SwiftUI

struct ProfileView: View {
    var username: String
    var body: some View {
        VStack {
            AsyncImage(url:URL(string: "https://avatars.githubusercontent.com/u/169118123?v=4"))
                .clipShape(Circle())
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
    ProfileView(username: "")
}
