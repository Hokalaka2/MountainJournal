//
//  LogInView.swift
//  Mountain Journal
//
//  Created by Otis Milliken on 7/26/22.
//

import SwiftUI
import Auth0

struct LogInView: View {
    @State private var isAuthenticated = false
    @State var userProfile = Profile.empty
    
    var body: some View {
        if isAuthenticated {
            MainView()
        } else {
            Button("Login"){
                login()
            }
        }
    }
}

extension LogInView {
  
    func login() {
        Auth0 // 1
          .webAuth() // 2
          .start { result in // 3
            switch result {
              // 4
              case .failure(let error):
                print("Failed with: \(error)")
              // 5
              case .success(let credentials):
                self.isAuthenticated = true
                self.userProfile = Profile.from(credentials.idToken)
                print("Credentials: \(credentials)")
                print("ID token: \(credentials.idToken)")
            }
          }
      }
  
    func logout() {
        Auth0 // 1
          .webAuth() // 2
          .clearSession { result in // 3
            switch result {
              // 4
              case .failure(let error):
                print("Failed with: \(error)")
                // 5
              case .success:
                self.isAuthenticated = false
            }
          }
      }
}


struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}