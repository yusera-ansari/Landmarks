//
//  ModalData.swift
//  Landmarks
//
//  Created by Abcom on 16/07/25.
//

import Foundation

class ModelData : Observable{
    
}

var landmarks:[Landmark] = load("landmarkData.json")
func load<T:Decodable>(_ fileName:String)->T{
    let data:Data
    guard let file = Bundle.main.url(forResource: fileName, withExtension: nil)
    else{
        fatalError("couldn't find \(fileName) in the Bundle")
    }
    do{
      data =  try Data(contentsOf: file)
    }catch{
        fatalError("Couldn't load \(fileName) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data);
        
    }catch{
        fatalError("Couldn't parse \(fileName) as \(T.self):\n\(error)")
    }
}
