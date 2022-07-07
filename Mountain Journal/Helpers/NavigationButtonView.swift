//
//  NavigationButtonView.swift
//  Mountain Journal
//
//  Created by Otis Milliken on 7/7/22.
//

import SwiftUI

struct NavigationButtonView: View {
    var body: some View {
        Label("Profile", systemImage: "person")
    }
}

struct NavigationButtonView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationButtonView()
            .previewLayout(.sizeThatFits)
    }
}
