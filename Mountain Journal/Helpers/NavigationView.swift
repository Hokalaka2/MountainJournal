//
//  NavigationView.swift
//  Mountain Journal
//
//  Created by Otis Milliken on 7/7/22.
//

import SwiftUI

struct NavigationView: View {
    var body: some View {
        HStack{
            NavigationLink(destination: ProfileView()){
                NavigationButtonView()
            }
            .padding()
            NavigationLink(destination: ProfileView()) {
                NavigationButtonView()
            }
            .padding()
            NavigationLink(destination: ProfileView()) {
                NavigationButtonView()
            }
            .padding()
        }
        .foregroundColor(.blue)
        .cornerRadius(60)
    }
}

struct NavigationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView()
            .previewLayout(.sizeThatFits)
    }
}
