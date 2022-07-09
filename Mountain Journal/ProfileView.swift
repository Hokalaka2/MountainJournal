//
//  ProfileView.swift
//  Mountain Journal
//
//  Created by Otis Milliken on 7/7/22.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack{
            HStack{
                ProfileImageView(image: Image("Otis_Cat"))
                    .padding()
                VStack{
                    Text("Hokalaka")
                    Text("email@gmail.com")
                }
            }
            NavigationView{
                List{
                    NavigationLink(destination: MainView()){
                        Text("My Journals")
                    }
                    NavigationLink(destination: MainView()){
                        Text("My Locations")
                    }
                    NavigationLink(destination: MainView()){
                        Text("Saved Journals")
                    }

                }
                .navigationTitle("Your Saved Info")
                
            }
            
            
            Spacer()
        }
        .navigationBarTitle("Profile")
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
