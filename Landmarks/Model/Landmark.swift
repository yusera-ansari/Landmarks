//
//  Landmark.swift
//  Landmarks
//
//  Created by Abcom on 16/07/25.
//

import Foundation
import SwiftUI
import CoreLocation

struct Landmark : Codable, Hashable, Identifiable{
    var isFavorite:Bool
    var id: Int
       var name: String
       var park: String
       var state: String
       var description: String
    var imageName:String
    var category:Category
    var isFeatured: Bool
    
    enum Category : String, CaseIterable, Codable{
        case lakes="Lakes"
        case rivers="Rivers"
        case mountains="Mountains"
    }
    var featureImage : Image? {
        isFeatured ? Image(imageName+"_feature") : nil
    }
    var image:Image{
        Image(imageName)
    }
    private var coordinates:Coordinates
    struct Coordinates: Hashable, Codable {
           var latitude: Double
           var longitude: Double
       }
    
    var locationCoordinate:CLLocationCoordinate2D{
        CLLocationCoordinate2D(
                  latitude: coordinates.latitude,
                  longitude: coordinates.longitude)
    }
    
}
