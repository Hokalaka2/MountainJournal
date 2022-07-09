//
//  ProfileImageView.swift
//  Mountain Journal
//
//  Created by Otis Milliken on 7/8/22.
//

import SwiftUI

struct ProfileImageView: View {
    var image: Image
    var body: some View {
        image
            .resizable()
            .clipShape(Circle())
            .frame(width:100, height:100)
            .shadow(radius: 4)
            .overlay(Circle().stroke(Color.black, lineWidth: 1))
    }
}

struct ProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileImageView(image: Image("Otis_Cat"))
    }
}
