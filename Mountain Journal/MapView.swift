//
//  MapView.swift
//  Mountain Journal
//
//  Created by Otis Milliken on 7/7/22.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @StateObject var locationManager = LocationManager()
    var pins: FetchedResults<Pin>
    var coordinate: CLLocationCoordinate2D { return locationManager.lastLocation?.coordinate ?? CLLocationCoordinate2D(latitude: 38.5733, longitude: -109.5498)
    }
    
    
    @State private var region = MKCoordinateRegion()
    @State private var userTrackingMode: MapUserTrackingMode = .follow
    
    
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
                .ignoresSafeArea(edges: .top)
            
            //if User is in close enough area
            VStack{
                Spacer()
                HStack{
                    Spacer()
                    Button(action: {}){
                        SeeJournal(coordinate: coordinate)
                            .frame(width:100,height:100)
                            .cornerRadius(14)
                    }
                    .padding()
                    .padding(.bottom, 38.0)
                }
            }
        }
        .onAppear {
            setRegion(coordinate)
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
        MapView(pins: pins)
    }
}
