//
//  PinCoreData.swift
//  Mountain Journal
//
//  Created by Otis Milliken on 7/23/22.
//

import Foundation
import CoreData
import UIKit

let result = PersistenceController(inMemory: true)
let viewContext = result.container.viewContext

func addPinToRecord(name: String, latitude: Double, longitude: Double) -> Void{
    
    let newPin = Pin(context: viewContext)
    newPin.id = UUID()
    newPin.name = name
    newPin.latitude = latitude
    newPin.longitude = longitude
    
    do {
        try viewContext.save()
        print("Saved")
    } catch {
        print(error.localizedDescription)
    }
}


