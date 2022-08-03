//
//  LocationJournalView.swift
//  Mountain Journal
//
//  Created by Otis Milliken on 8/2/22.
//

import SwiftUI
import MapKit

struct LocationJournalView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest var entries: FetchedResults<Note>
    
    var coordinate: CLLocationCoordinate2D
    
    init(coordinate: CLLocationCoordinate2D){
        self.coordinate = coordinate
        
        let latpredicate1 = NSPredicate(format: "latitude >= %@", "\(self.coordinate.latitude-0.2)")
        let latpredicate2 = NSPredicate(format: "latitude <= %@", "\(self.coordinate.latitude+0.2)")
        let longpredicate1 = NSPredicate(format: "longitude >= %@", "\(self.coordinate.longitude-0.2)")
        let longpredicate2 = NSPredicate(format: "longitude <= %@", "\(self.coordinate.longitude+0.2)")
        
        self._entries = FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Note.timestamp, ascending: false)], predicate: NSCompoundPredicate(andPredicateWithSubpredicates: [latpredicate1, latpredicate2, longpredicate1, longpredicate2]))
    }
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: 15) {
                    Text("Journals")
                        .font(.headline)
                        .padding(.leading)
                        
                    ForEach(entries) { testEntry in
                        ViewIndividualJournal(entry: testEntry)
                    }
                }
                .padding()
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
        .foregroundColor(.black)
    }
}

struct LocationJournalView_Previews: PreviewProvider {
    static var coordinate: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 38.5733, longitude: -109.5498)
    static var previews: some View {
        LocationJournalView(coordinate: coordinate)
    }
}
