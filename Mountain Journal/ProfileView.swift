//
//  ProfileView.swift
//  Mountain Journal
//
//  Created by Otis Milliken on 7/7/22.
//

import SwiftUI

struct ProfileView: View {
    @Binding var userProfile: Profile
    
    var body: some View {
        VStack{
            HStack{
                ProfileImageView(image: Image("Otis_Cat"))
                    .padding()
                VStack{
                    Text("\(userProfile.name)")
                    Text("\(userProfile.email)")
                }
            }
            NavigationView{
                List{
                    NavigationLink(destination: ViewAllJournals(userProfile: userProfile)){
                        Text("My Journals")
                    }
                    NavigationLink(destination: ViewAllJournals(userProfile: userProfile)){
                        Text("My Locations")
                    }
                    NavigationLink(destination: ViewAllJournals(userProfile: userProfile)){
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
    @State static var userProfile = Profile.empty
    static var previews: some View {
        ProfileView(userProfile: $userProfile)
    }
}
