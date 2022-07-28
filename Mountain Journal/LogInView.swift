//
//  LogInView.swift
//  Mountain Journal
//
//  Created by Otis Milliken on 7/26/22.
//

import SwiftUI
import Auth0

struct LogInView: View {
    @Binding var isAuthenticated: Bool
    @Binding var userProfile: Profile
    
    var body: some View {
        ZStack{
            Image("Tree")
                .resizable()
                .ignoresSafeArea()
                .opacity(0.78)
            HStack{
                Spacer()
                VStack{
                    Text("Hi! In order to gain the full experience of our app. Please Authenticate Before Using Mountain Journal")
                        .font(.headline)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                    Button("Log In"){
                        login()
                    }
                    .padding()
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(16)
                }
                Spacer()
            }
            .padding()
            .background(Color.white.opacity(0.80))
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
    @State static var isAuthenticated = false
    @State static var userProfile = Profile.empty
    static var previews: some View {
        LogInView(isAuthenticated: $isAuthenticated, userProfile: $userProfile)
    }
}
