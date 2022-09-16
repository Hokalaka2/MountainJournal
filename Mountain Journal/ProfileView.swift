//
//  ProfileView.swift
//  Mountain Journal
//
//  Created by Otis Milliken on 7/7/22.
//

import SwiftUI

struct ProfileView: View {

    @Binding var userProfile: Profile
    
    let screenSize = UIScreen.main.bounds.size
    
    var body: some View {
        
        
        let rectWidth = screenSize.width * (0.9)
        let bigRectHeight = screenSize.height * (0.15)
        let smallRectHeight = screenSize.height * (0.05)
        
        
        ZStack {
            Rectangle()
                .ignoresSafeArea()
                .foregroundColor(Color("Charcoal"))
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color("LightGray"))
                        .frame(width: rectWidth, height: bigRectHeight)
                    
                    VStack {
                        HStack{
                            ProfileImageView(image: Image("Otis_Cat"))
                                .padding(.leading, 30)
                            Spacer()
                            VStack(alignment: .trailing) {
                                Text("Edit")
                                    .padding(.bottom, 40)
                                    .foregroundColor(.white)
                                Text("\(userProfile.name)")
                                    .foregroundColor(.white)
                                Text("\(userProfile.email)")
                                    .foregroundColor(.white)
                            }
                            .padding(.trailing, 30)
                            .foregroundColor(.white)
                            
                        }
                    }
                }
                .padding(.bottom, 25.0)
                
                NavigationLink(destination: ViewSavedJournals(userProfile: userProfile)){
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: rectWidth, height: smallRectHeight)
                            .foregroundColor(Color("LighterGray"))
                        HStack {
                            Text("My Locations")
                                .padding(.leading, 30)
                            Spacer()
                            Image(systemName: "arrow.right")
                                .padding(.trailing, 30)
                        }
                        .foregroundColor(.white)
                    }
                }
                    
                NavigationLink(destination: ViewSavedJournals(userProfile: userProfile)){
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: rectWidth, height: smallRectHeight)
                            .foregroundColor(Color("LighterGray"))
                        HStack {
                            Text("My Saved Journals")
                                .padding(.leading, 30)
                            Spacer()
                            Image(systemName: "arrow.right")
                                .padding(.trailing, 30)
                        }
                        .foregroundColor(.white)
                    }
                }
                Spacer()
            }
        }
    }
}


struct ProfileView_Previews: PreviewProvider {
    @State static var userProfile = Profile.empty
    static var previews: some View {
        ProfileView(userProfile: $userProfile)
    }
}
