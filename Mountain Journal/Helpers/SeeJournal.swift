//
//  SeeJournal.swift
//  Mountain Journal
//
//  Created by Otis Milliken on 7/11/22.
//

import SwiftUI
import MapKit

struct SeeJournal: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest var entries: FetchedResults<Note>
    
    var coordinate: CLLocationCoordinate2D
    
    init(coordinate: CLLocationCoordinate2D){
        self.coordinate = coordinate
        
        let predicate = NSPredicate(format: "latitude == %@", "\(self.coordinate.latitude)")
        
        self._entries = FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Note.timestamp, ascending: false)], predicate: predicate)
    }
    
    var body: some View {
        VStack{
            Image(systemName: "note.text")
                .resizable()
                .frame(width: 35.0, height: 35.0)
            Text("See")
                .font(.subheadline)
            Text("Journals")
                .font(.subheadline)
        }
        .padding()
        .background(Color.white)
    }
}

struct SeeJournal_Previews: PreviewProvider {
    static var coordinate: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 38.5733, longitude: -109.5498)
    static var previews: some View {
        SeeJournal(coordinate: coordinate)
            .previewLayout(.sizeThatFits)
    }
}
