//
//  MapView.swift
//  Mountain Journal
//
//  Created by Otis Milliken on 7/7/22.
//

import SwiftUI
import MapKit

struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    @State private var region = MKCoordinateRegion()
    @State private var userTrackingMode: MapUserTrackingMode = .follow
    var pins: FetchedResults<Pin>
    
    var body: some View {
        ZStack{
            Map(coordinateRegion: $region,
                interactionModes: MapInteractionModes.all,
                showsUserLocation: true,
                userTrackingMode: $userTrackingMode,
                annotationItems: pins
            ) { pin in
                MapMarker(coordinate: CLLocationCoordinate2D(latitude: pin.latitude, longitude: pin.longitude))
                
            }
                .onAppear {
                    setRegion(coordinate)
                }
                .ignoresSafeArea(edges: .top)
            
            //if User is in close enough area
            VStack{
                Spacer()
                HStack{
                    Spacer()
                    Button(action: {}){
                        SeeJournal()
                            .frame(width:100,height:100)
                            .cornerRadius(14)
                    }
                    .padding()
                    .padding(.bottom, 38.0)
                }
            }
        }
    }
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D){
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
}

struct MapView_Previews: PreviewProvider {
    @FetchRequest(entity: Pin.entity(), sortDescriptors: [])
        static var pins: FetchedResults<Pin>
    
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 44.015337, longitude: -73.16734), pins: pins)
    }
}
