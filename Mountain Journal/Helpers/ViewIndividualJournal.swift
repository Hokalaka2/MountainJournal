//
//  ViewIndividualJournal.swift
//  Mountain Journal
//
//  Created by Tristan Meyer on 7/14/22.
//

import SwiftUI

struct ViewIndividualJournal: View {
    var body: some View {
        VStack(spacing: -17){
            Text("Users Name")
                .position(x:70,y:10)
                .font(.title2)
            
            Text("Insert text preview")
                .position(x:70,y:10)
                .font(.caption)
                .multilineTextAlignment(.leading)
                .lineLimit(3)
            
            HStack(spacing: -5) {
                Label("", systemImage: "arrow.down")
                Text("Save")
            }
            
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .size(width: 60, height: 30)
                    .position(x: <#T##CGFloat#>, y: <#T##CGFloat#>)
            }
            
                
            
//            Text("Tristan Meyer")
//                .font(.custom("Name", size: 15.0))
//                .foregroundColor(Color.white)
//                .multilineTextAlignment(.leading)
//                .lineLimit(1)
//                .frame(width: 140.0, height: 35.0)
//                .background(Color.gray)
//                .cornerRadius(10, corners: [.topLeft, .bottomRight, .bottomLeft])
//
//
//            ZStack {
//                Text("")
//                    .frame(width: 190.0, height: 35.0)
//                    .background(Color.gray)
//                    .cornerRadius(60, corners: [.topLeft, .bottomRight])
//
//                Text("First Little bit of Journal goes here with blah bl")
//                    .multilineTextAlignment(.leading)
//                    .lineLimit(1)
//                    .padding(.leading)
//                    .frame(width: 185.0, height: 30.0)
//                    .font(.custom("JournalPreviewText", size: 11.0))
//                    .background(Color.white)
//                    .cornerRadius(20, corners: [.bottomRight])
//                    .cornerRadius(5, corners: [.topLeft, .bottomLeft])
//            }
//        }
//    }
//}
        }
        .frame(width: 360, height:130)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct ViewIndividualJournal_Previews: PreviewProvider {
    static var previews: some View {
        ViewIndividualJournal()
//            .previewLayout(.fixed(width: 400, height: 60))
    }
}
